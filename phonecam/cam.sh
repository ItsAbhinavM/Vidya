#!/bin/sh

# What this script does
# =====================
#
# It allows you to access the phone camera of your Android device as a webcam in Linux. Then
# you can use it for web meetings.
#
# How to use
# ==========
#
# 1. Connect your phone and computer to the same WiFi. If there is no WiFi available, 
# you can use the phone as hotspot and connect your computer to it.
# 2. Install IP Webcam on your Android phone: https://play.google.com/store/apps/details?id=com.pas.webcam
# 3. Start the app and press "Start server". Make a note of the IP address of the phone shown on the screen.
# 4. Install the v4l2loopback kernel module: https://github.com/umlaeute/v4l2loopback
#    For example on Ubuntu 22.04 LTS:
#    ```
#    sudo apt install v4l2loopback-utils v4l2loopback-dkms
#    sudo reboot
#    ```
# 5. Run this script:
#    ```   
#    sudo sh cam.sh <IP address of phone>
#    ```

sigint()
{
  sudo rmmod v4l2loopback && echo "Camera detached."
}

if [ -z $1 ]; then
  echo ""
  echo "Loads a live stream as a web camera."
  echo ""
  echo "  Usage: cam IP"
  echo ""
  exit 0
fi

sudo rmmod v4l2loopback > /dev/null 2>&1
trap "sigint" 2

sudo modprobe v4l2loopback devices=1 video_nr=10 exclusive_caps=1 card_label="Webcam"
echo "Loaded camera. Press Ctrl+C to detach."
ffmpeg -hide_banner -loglevel error -f mjpeg -i http://$1:8080/video -pix_fmt yuv420p -f v4l2 /dev/video10