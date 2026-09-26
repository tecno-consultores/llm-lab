# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tecno-consultores/llm-lab)

To run N8N (with Postgres and KeyDB) and OpenwebUI:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
```

Profiles you can run:

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- | ------- |
| [N8N](https://github.com/n8n-io/n8n) | ✅ | ✅ | | ✅ | postgres / KeyDB | --profile n8n |
| N8N-worker | ✅ | ✅ | | | N8N| --profile n8n-worker |
| N8N-runner (code sandbox) | ✅ | ✅ | | | N8N | --profile n8n-runner |
| N8N-AI-SANDBOX | ✅ | ✅ | | | N8N | --profile n8n-ai-sandbox |
| [OpenwebUI](https://github.com/open-webui/open-webui) | ✅ | ✅ | | ✅ | postgres / KeyDB | --profile openwebui |
| [Ollama](https://github.com/ollama/ollama) | ✅ | ❌ | Nvidia | | | --profile ollama-nvidia |
| Ollama | ✅ | ❌ | AMD | | | --profile ollama-amd |
| Ollama | ✅ | ✅ | | | | --profile ollama-cpu |
| [EvolutionAPI](https://github.com/evolution-foundation/evolution-api) | ✅ | ✅ | |  | postgres / KeyDB | --profile evolutionapi |
| [Opencode](https://github.com/anomalyco/opencode) | ✅ | ✅ | | ✅ | | --profile opencode |
| [Hermes-agent](https://github.com/nousresearch/hermes-agent) | ✅ | ✅ |  | ✅ | | --profile hermes |
| [Paperclip](https://github.com/paperclipai/paperclip) | ✅ | ✅ |  | ❌ | postgres | --profile paperclip |

Complementary services:

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- | ------- |
| [Searxng](https://github.com/searxng/searxng) | ✅ | ✅ | | | | --profile searxng |
| [Browserless](https://github.com/browserless/browserless) | ✅ | ✅ | | | | --profile browserless |
| [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) | ✅ | ✅ | | | | --profile proxy |
| [Postgres](https://hub.docker.com/_/postgres) | ✅ | ✅ | | | | --profile postgres |
| [KeyDB](https://github.com/snapchat/keydb) | ✅ | ✅ | | | | --profile keydb |
| [OmniRoute](https://github.com/diegosouzapw/OmniRoute) | ✅ | ✅ | | | | --profile omniroute |
| [Hermes-opencode-bridge](https://github.com/tecno-consultores/hermes-opencode-bridge) | ✅ | ✅ | | | hermes / opencode | --profile acp-orchestrator |
| [Qdrant](https://github.com/qdrant/qdrant) | ✅ | ✅ | | | | --profile qdrant |

Healthcheck, ports and URLs:

| Name | healthcheck| Port | GUI | Api dentro de Docker |
| -------- | ------- | ------- | ------- | ------- |
| N8N | ✅ | 5678 | http://127.0.0.1:5678 | http://n8n:5678/api/v1 |
| Qdrant | ✅ | 6333 | http://127.0.0.1:6333/dashboard | http://qdrant:6333 |
| OpenwebUI | ✅ | 8383 | http://127.0.0.1:8383 | |
| NGINX proxy manager | ✅ | 81 | http://127.0.0.1:81 | http://proxy:81/api |
| Searxng | ✅ | 8189 | http://127.0.0.1:8189 | |
| EvolutionAPI | ✅ | 9191 | http://127.0.0.1:9191/manager | http://evolutionapi:9191/swagger |
| Opencode | ✅ | 4096 | http://127.0.0.1:4096 | http://opencode:4096/doc |
| Hermes Agent | ✅ | 8642 - 9119 | http://127.0.0.1:9119 | http://hermes:8642/v1 |
| Browserless | ✅ | 3000 | | http://browserless:3000/docs |
| OmniRoute | ✅ | 20128 | http://127.0.0.1:20128 | http://omniroute:20128/v1 |
| Hermes-opencode-bridge | ✅ | 8000 | | http://acp-orchestrator:8000/v1/agent/task |
| Paperclip | ✅ | 3100 | http://localhost:3100 | |
------

To stop and remove all containers use:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile "*" down
```

**NOTES**:
* Starting with PostgreSQL **18**, the database directory structure changes; please take these changes into account when upgrading from earlier versions.
