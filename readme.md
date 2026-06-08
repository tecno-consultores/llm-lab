# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tecno-consultores/llm-lab)

To run N8N on AMD64/ARM64 (with Postgres and Redis):

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner up -d
```

Profiles you can run:

| Project | AMD64 | ARM64 | Other | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- |
| [N8N](https://github.com/n8n-io/n8n) | Y | Y | | postgres / redis | --profile n8n |
| N8N-worker | Y | Y | | N8N| --profile n8n-worker |
| N8N-runner (code sandbox) | Y | Y | | N8N | --profile n8n-runner |
| [Qdrant](https://github.com/qdrant/qdrant) | Y | Y | | | --profile qdrant |
| [OpenwebUI](https://github.com/open-webui/open-webui) | Y | Y | | postgres / redis | --profile openwebui |
| [Ollama](https://github.com/ollama/ollama) | Y | N | Nvidia-gpu | | --profile ollama-gpu |
| Ollama | Y | Y | AMD-gpu | | --profile ollama-cpu |
| [EvolutionAPI](https://doc.evolution-api.com/v1/en/get-started/introduction) | Y | Y | |  postgres / redis | --profile evolutionapi |
| [Flowise](https://github.com/flowiseai/flowise) | Y | Y | |  postgres / redis | --profile flowise |
| [Opencode](https://github.com/anomalyco/opencode) | Y | Y | | | --profile opencode |
| [hermes-agent](https://github.com/nousresearch/hermes-agent) | Y | Y |  | | --profile hermes |

Complementary services:

| Project | AMD64 | ARM64 | Other | Depends on | Profile |
| -------- | ------- | ------- | ------- | ------- | ------- |
| [n8n-openai-bridge](https://github.com/sveneisenschmidt/n8n-openai-bridge/) | Y | N | | openwebui / n8n | --profile openaibridge |
| [Whisper](https://github.com/openai/whisper) | Y | N | Nvidia-gpu | | --profile whisper-gpu |
| Whisper | Y | Y | Nvidia-gpu | | --profile whisper |
| [Crawl4ai](https://github.com/unclecode/crawl4ai) | Y | N | | | --profile crawl4ai-amd64 |
| Crawl4ai | N | Y | | | --profile crawl4ai-arm64 |
| [Searxng](https://github.com/searxng/searxng) | Y | Y | | | --profile searxng |
| [Browserless](https://github.com/browserless/browserless) | Y | Y | | | --profile browserless |
| [MongoDB](https://www.mongodb.com) | Y | N | | | --profile mongodb |
| [Rabbitmq](https://github.com/rabbitmq/rabbitmq-server) | Y | Y | | | --profile rabbit |
| [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) | Y | Y | | | --profile proxy |
| Postgres | Y | Y | | | --profile postgres |
| Redis | Y | Y | | | --profile redis |

Healthcheck, ports and URLs 

| Name | healthcheck| Port | Example |
| -------- | ------- | ------- | ------- |
| N8N | yes | 5678 | http://127.0.0.1:5678 |
| Qdrant | yes | 6333 | http://127.0.0.1:6333/dashboard |
| OpenwebUI | yes | 8383 | http://127.0.0.1:8383 |
| NGINX proxy manager | yes | 81 | http://127.0.0.1:81 |
| Searxng | yes | 8181 | http://127.0.0.1:8181 |
| EvolutionAPI | yes | 9191 | http://127.0.0.1:9191/manager |
| Flowise | yes | 3001 | http://127.0.0.1:3001 |
| Opencode | yes | 4096 | http://127.0.0.1:4096 |
| Redis Insight | yes | 8001 | http://127.0.0.1:8001 |
| Hermes Agent Dashboard | yes | 9119 | http://127.0.0.1:9119 |
| Hermes Agent API | yes | 8642 | http://127.0.0.1:8642/v1 |
| Rabbitmq broker | | 5672 | http://127.0.0.1:5672 |
| Rabbitmq management | | 15672 | http://127.0.0.1:15672 |
| Browserless | yes | 3000 | http://127.0.0.1:3000 |
| Whisper | | 9000 | http://127.0.0.1:9000 |
| Crawl4ai | yes | 11235 | http://127.0.0.1:11235 |

To run N8N with OpenwebUI: 

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
```

------

To stop and remove all containers use:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile "*" down
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=tecno-consultores/llm-lab&type=Date)](https://www.star-history.com/#tecno-consultores/llm-lab&Date)
