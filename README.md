# Vidya - The Virtual Teacher for OLabs

## Overview

Vidya is a VTuber-powered virtual teacher designed to assist students in performing and understanding experiments on the OLabs platform. By leveraging cutting-edge AI technologies, Vidya enhances accessibility, engagement, and interactivity in virtual science education.

## Features

- **Custom LLM-VTuber Framework**: We have heavily customized an open-source LLM-VTuber framework to cater specifically to OLabs.
- **Multilingual Support**: Implemented using Azure TTS and ASR, enabling seamless transitions between multiple languages.
- **Context-Aware AI**: Enhanced to provide better understanding and support for OLabs experiments.
- **WebSocket Communication**: Enables efficient bidirectional communication between the frontend and backend.
- **Experiment Context Extraction**: Custom Python script scrapes relevant information from OLabs to improve Vidya’s contextual awareness.
- **Non-Intrusive Integration**: Vidya is embedded within a cloned OLabs website via an iFrame, ensuring zero interference with OLabs’ core functionality.
- **Flexible AI Model Support**: Supports APIs from Azure and Gemini while maintaining the ability to switch to local models like Bhashini for reduced third-party dependence.
- **Scalability & Model Switching**: Different models with varying capabilities and efficiencies can be used dynamically based on demand.

## Technical Stack

- **Frontend & Backend**: Custom forks of the LLM-VTuber framework with injected modifications.
- **Speech Processing**: Azure Speech-to-Text (STT) and Text-to-Speech (TTS) for multilingual capabilities.
- **LLM Processing**: Gemini API for reasoning, with future potential for self-hosted models.
- **Web Integration**: iFrame-based embedding to maintain OLabs’ security and stability.
- **Communication**: WebSockets for real-time interaction.
- **Data Extraction**: Python-based scraper to fetch experiment details.

### Installation

1. Clone the repositories:
   ```
   git clone https://github.com/ItsAbhinavM/Vidya.git
   ```
   Frontend builder:
   ```
   git clone https://github.com/hrideshmg/vidya-frontend-build.git
   ```
   Backend: 
   ```
   git clone https://github.com/hrideshmg/vidya-backend.git
   ```

2. Install dependencies:
   ```bash
   cd vidya-backend/
   curl -LsSf https://astral.sh/uv/install.sh | sh
   uv sync
   ```
   ```bash
   cd ../vidya-frontend-build/
   npm install
   ```
3. Configure API keys and environment variables.
   Create a `.env` file and in the root of **backend** repository and add the following
   ```
   GEMINI_API_KEY={YOUR_GEMINI_API_KEY}
   AZURE_API_KEY={YOUR_AZURE_SPEECHSERVICE_API_KEY}
   ```
4. Run the backend:
   ```
   uv run run_server.py
   ```
5. Run the frontend:
- Navigate to the Vidya repository.
- Open `index.html` inside the `olabs/` directory in a web browser.

---
Frontend builder: https://github.com/hrideshmg/vidya-frontend-build

Backend: https://github.com/hrideshmg/vidya-backend
