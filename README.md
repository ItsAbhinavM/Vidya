# Vidya - The Virtual Teacher for OLabs

## Overview

Vidya is an AI-powered virtual teacher designed to assist students in performing and understanding experiments on the OLabs platform. Unlike traditional chatbots, Vidya has an animated avatar which can express emotions and interact with students in a human-like manner making learning more immersive and engaging.

## Features

- **Multilingual Support**: Vidya is a truly multilingual teacher who can seamlessly transition between multiple languages even in the middle of conversations.
- **Context-Aware AI**: A custom python script is made to scrape data from the OLabs platform to improve Vidya’s contextual awareness regarding the current experiment
- **Non-Obtrusive Integration**: Vidya is embedded within the OLabs website via a non-obtrusive popup, enhancing functionality while preserving the core OLabs experience.
- **Flexible AI Model Support**: Supports APIs from multiple vendors including Azure, Gemini, Groq, Deepseek, Whisper etc while maintaining the ability to switch to local models like Ollama for reduced third-party dependence.

## Technical Highlights

- **Customized LLM-VTuber Framework**: We have heavily customized an open-source [Open-LLM-VTuber framework](https://github.com/Open-LLM-VTuber/Open-LLM-VTuber) to cater specifically to OLabs.
- **WebSocket Communication**: Enables efficient bidirectional communication between the frontend and backend.
- **Speech Processing**: Azure Automatic Speech Recognition (ASR), Speech-to-Text (STT) and Text-to-Speech (TTS) for multilingual capabilities.
- **LLM Processing**: The Gemini API currently handles multilingual interactions, with future plans to integrate indigenous models like [Bhashini](https://bhashini.gov.in/) for enhanced language support.
- **Web Integration**: iFrame-based embedding to maintain OLabs’ security and stability as well as for non-obtrusive interaction.
- **Data Extraction**: A Python-based scraper is present to fetch experiment details.

## For Developers

### Project Overview
Vidya is chiefly divided into three different repositories - 
* **Vidya(You are here):** Serves as the central hub for tracking discussions, curating documentation as well as hosting a demo of the project on a cloned version of an OLabs experiment.
* **[vidya-frontend-build](https://github.com/hrideshmg/vidya-frontend-build)**: A stripped down fork of the [Open-LLM-VTuber frontend](https://github.com/Open-LLM-VTuber/Open-LLM-VTuber-Web) which is customized to run in a picture in picture format. 
  * As made obvious by the name, it is used to **build** the `JS/HTML` files necessary for the backend to serve the avatar.
* **[vidya-backend](https://github.com/hrideshmg/vidya-backend)**: A **heavily** customized version of the `Open-LLM-Vtuber` framework, where the bulk of the work has been done in adapting the platform for OLabs.

<hr>

### Installation

1. Clone the repositories:
   1. Demo - 
      ```
      git clone https://github.com/ItsAbhinavM/Vidya.git
      ```
   2. Backend - 
      ```
      git clone https://github.com/hrideshmg/vidya-backend.git
      ```

2. Install dependencies:
   ```bash
   cd vidya-backend/
   curl -LsSf https://astral.sh/uv/install.sh | sh
   uv sync
   ```
3. Configure API keys and environment variables.
   Create a `.env` file in the root of the **backend** repository and add the following
   ```
   GEMINI_API_KEY={YOUR_GEMINI_API_KEY}
   AZURE_API_KEY={YOUR_AZURE_SPEECHSERVICE_API_KEY}
   ```
   * **Note:** Make sure to either set your azure region to `centralindia` or modify it in `conf.yaml`
4. Run the backend:
   ```
   uv run run_server.py
   ```
5. Run the demo:
- Navigate to the `Vidya` repository.
- Open `index.html` inside the `olabs/` directory in a web browser.

---
