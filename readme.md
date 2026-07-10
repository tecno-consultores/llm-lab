# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tecno-consultores/llm-lab)

To run N8N (with Postgres and Dragonfly) and OpenwebUI:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
```

Profiles you can run:

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- | ------- |
| [N8N](https://github.com/n8n-io/n8n) | ✅ | ✅ | | ✅ | postgres / dragonfly | --profile n8n |
| N8N-worker | ✅ | ✅ | | | N8N| --profile n8n-worker |
| N8N-runner (code sandbox) | ✅ | ✅ | | | N8N | --profile n8n-runner |
| [Qdrant](https://github.com/qdrant/qdrant) | ✅ | ✅ | | | | --profile qdrant |
| [OpenwebUI](https://github.com/open-webui/open-webui) | ✅ | ✅ | | ✅ | postgres / dragonfly | --profile openwebui |
| [Ollama](https://github.com/ollama/ollama) | ✅ | ❌ | Nvidia | | | --profile ollama-gpu |
| Ollama | ✅ | ✅ | AMD | | | --profile ollama-cpu |
| [EvolutionAPI](https://github.com/evolution-foundation/evolution-api) | ✅ | ✅ | |  | postgres / dragonfly | --profile evolutionapi |
| [Flowise](https://github.com/flowiseai/flowise) | ✅ | ✅ | | ✅ | postgres / dragonfly | --profile flowise |
| [Opencode](https://github.com/anomalyco/opencode) | ✅ | ✅ | | ✅ | | --profile opencode |
| [hermes-agent](https://github.com/nousresearch/hermes-agent) | ✅ | ✅ |  | ✅ | | --profile hermes |

Complementary services:

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- | ------- |
| [n8n-openai-bridge](https://github.com/sveneisenschmidt/n8n-openai-bridge/) | ✅ | ❌ | | | openwebui / n8n | --profile openaibridge |
| [Whisper](https://github.com/openai/whisper) | ✅ | ❌ | Nvidia |  | | --profile whisper-gpu |
| Whisper | ✅ | ✅ | AMD | | | --profile whisper |
| [Crawl4ai](https://github.com/unclecode/crawl4ai) | ✅ | ❌ | | ✅ | | --profile crawl4ai-amd64 |
| Crawl4ai | ❌ | ✅ | | | | --profile crawl4ai-arm64 |
| [Searxng](https://github.com/searxng/searxng) | ✅ | ✅ | | | | --profile searxng |
| [Browserless](https://github.com/browserless/browserless) | ✅ | ✅ | | | | --profile browserless |
| [MongoDB](https://www.mongodb.com) | ✅ | ❌ | | | | --profile mongodb |
| [Rabbitmq](https://github.com/rabbitmq/rabbitmq-server) | ✅ | ✅ | | | | --profile rabbit |
| [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) | ✅ | ✅ | | | | --profile proxy |
| [Postgres](https://hub.docker.com/_/postgres) | ✅ | ✅ | | | | --profile postgres |
| [Dragonfly](https://github.com/dragonflydb/dragonfly) | ✅ | ✅ | | | | --profile dragonfly |

Healthcheck, ports and URLs:

| Name | healthcheck| Port | Service | Api |
| -------- | ------- | ------- | ------- | ------- |
| N8N | ✅ | 5678 | http://127.0.0.1:5678 | http://127.0.0.1:5678/api/v1 |
| Qdrant | ✅ | 6333 | http://127.0.0.1:6333/dashboard | http://127.0.0.1:6333 |
| OpenwebUI | ✅ | 8383 | http://127.0.0.1:8383 | |
| NGINX proxy manager | ✅ | 81 | http://127.0.0.1:81 | http://127.0.0.1:81/api |
| Searxng | ✅ | 8189 | http://127.0.0.1:8189 | |
| EvolutionAPI | ✅ | 9191 | http://127.0.0.1:9191/manager | http://127.0.0.1:9191/swagger |
| Flowise | ✅ | 3001 | http://127.0.0.1:3001 | http://127.0.0.1:3001/api/v1 |
| Opencode | ✅ | 4096 | http://127.0.0.1:4096 | http://127.0.0.1:4096/doc |
| Hermes Agent | ✅ | 8642 - 9119 | http://127.0.0.1:9119 | http://127.0.0.1:8642/v1 |
| Rabbitmq broker | ❌ | 5672 | http://127.0.0.1:5672 | |
| Rabbitmq management | ❌ | 15672 | http://127.0.0.1:15672 | http://127.0.0.1:15672/api/ |
| Browserless | ✅ | 3000 | | http://127.0.0.1:3000/docs |
| Whisper | ❌ | 9000 | | http://127.0.0.1:9000 |
| Crawl4ai | ✅ | 11235 | | http://127.0.0.1:11235/openapi.json |

------

To stop and remove all containers use:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile "*" down
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=tecno-consultores/llm-lab&type=Date)](https://www.star-history.com/#tecno-consultores/llm-lab&Date)
