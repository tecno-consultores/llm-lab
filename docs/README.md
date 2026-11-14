# Documentation Index

Here you will find configuration guides, integration instructions, prompts, and helper files for the services orchestrated by **LLM-Lab**.

## Hermes Agent & Integrations

* [Hermes Agent Overview](./hermes.md) — Initial setup, CLI, and TUI dashboard commands
* [Hermes + Ollama](./hermes-ollama.md) — Custom Ollama endpoint configuration
* [Hermes + LM Studio](./hermes-llm-studio.md) — Connecting Hermes to a host or remote LM Studio server
* [Hermes + OpenWebUI](./hermes-openwebui.md) — Using OpenWebUI as a frontend for Hermes
* [Hermes + Browserless](./browserless-hermes.md) — Fetching Browserless API docs for Hermes skills
* [Hermes + SearXNG](./searxng-hermes.md) — Querying the internal SearXNG JSON search API
* [Hermes + OpenCode](./opencode-hermes.md) — Exposing OpenCode API documentation to Hermes
* [Hermes MCP Examples](./hermes-mcp-examples.md) — Sample MCP configurations for OmniRoute and Proxmox
* [Hermes Troubleshooting](./hermes-troubleshooting.md) — Session permission fixes and `SOUL.md` placement

## OpenWebUI Integrations

* [OpenWebUI + Ollama](./openwebui-ollama.md) — Enabling the internal Ollama API connection
* [OpenWebUI + OmniRoute](./openwebui-omniroute.md) — Connecting OpenWebUI to OmniRoute
* [OpenWebUI + OpenRouter](./openwebui-openrouter.md) — Connecting OpenWebUI to OpenRouter
* [OpenWebUI + LM Studio](./openwebui-lm-studio.md) — Connecting OpenWebUI to LM Studio
* [OpenWebUI + N8N Webhook](./openwebui-n8n-webhook.md) — Installing the async N8N Pipe function

## N8N, Ollama, OpenCode & Services

* [N8N Expressions Reference](./n8n-expressions.md) — Common date, query, webhook, and AI expressions
* [N8N + LM Studio](./n8n-lm-studio.md) — Configuring an OpenAI-compatible credential for LM Studio
* [Ollama Models & Usage](./ollama.md) — Creating custom models, pulling from Hugging Face, and disabling thinking output
* [OpenCode + Ollama](./opencode-ollama.md) — Configuring `ollamamodel` and `ollamaquant` via `.env`
* [EvolutionAPI Setup](./evolution.md) — Recommended Baileys instance and webhook event settings
* [Custom NGINX Configuration](./custom-nginx-configuration.md) — Reverse proxy snippet with streaming and WebSocket headers
* [Paperclip Onboarding (Archived)](./paperclip-setup-for-onboard.md) — Historical reference for the removed `paperclip` profile

## Prompts & Auxiliary Files

* [Codebase Documentation Prompt](./prompt-documentation.md) — Template prompt for conceptual repository exploration
* [Reflection System Prompt](./reflection-prompt.md) — Structured `<thinking>` / `<reflection>` / `<output>` system message
* [Modelfile.example](./Modelfile.example) — Sample Ollama `Modelfile` (`qwen3.5:9b`)
* [title n8n Pipe Function-2.txt](./title%20n8n%20Pipe%20Function-2.txt) — Recommended async OpenWebUI Pipe function (v0.3.0, `aiohttp`)
* [n8n Pipe Function.txt](./n8n%20Pipe%20Function.txt) — Legacy synchronous OpenWebUI Pipe function (v0.2.0, `requests`)
* [sear-setting.txt](./sear-setting.txt) — Minimal SearXNG `formats: [html, json]` snippet (already embedded inline in `docker-compose.yml`)
* [ttyia.sh](./ttyia.sh) — Terminal webhook chat client example
