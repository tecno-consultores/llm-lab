# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tecno-consultores/llm-lab)

To run N8N on AMD64/ARM64 (with Postgres and Redis):

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner up -d
```

Profiles you can run:

* [N8N](https://github.com/n8n-io/n8n) on AMD64/ARM64 (--profile n8n)
    + N8N-worker on AMD64/ARM64 (--profile n8n-worker)
    + N8N-runner (code sandbox) on AMD64/ARM64 (--profile n8n-runner)
* [Qdrant](https://github.com/qdrant/qdrant) on AMD64/ARM64 (--profile qdrant)
* [OpenwebUI](https://github.com/open-webui/open-webui) on AMD64/ARM64 (--profile openwebui)
* [Ollama](https://github.com/ollama/ollama) on Nvidia (--profile ollama-gpu)
    + Ollama on AMD64/ARM64 or AMD GPU (--profile ollama-cpu)
* [EvolutionAPI](https://doc.evolution-api.com/v1/en/get-started/introduction) on AMD64/ARM64 (--profile evolutionapi)
* [Flowise](https://github.com/flowiseai/flowise) on AMD64/ARM64 (--profile flowise)
* [Opencode](https://github.com/anomalyco/opencode) on AMD64/ARM64 (--profile opencode)
* [hermes-agent](https://github.com/nousresearch/hermes-agent) on AMD64/ARM64 (--profile hermes)

Complementary services:

* [n8n-openai-bridge](https://github.com/sveneisenschmidt/n8n-openai-bridge/) on AMD64 (--profile openaibridge)
* [Whisper](https://github.com/openai/whisper) on Nvidia (--profile whisper-gpu)
    + Whisper on CPU AMD64/ARM64 (--profile whisper)
* [Crawl4ai](https://github.com/unclecode/crawl4ai) on AMD64 (--profile crawl4ai-amd64)
    + Crawl4ai on ARM64 (--profile crawl4ai-arm64)
* [Searxng](https://github.com/searxng/searxng) on AMD64/ARM64 (--profile searxng)
* [Browserless](https://github.com/browserless/browserless) on AMD64/ARM64 (--profile browserless)
* [MongoDB](https://www.mongodb.com) on AMD64 (--profile mongodb)
* [Rabbitmq](https://github.com/rabbitmq/rabbitmq-server) on AMD64/ARM64 (--profile rabbit)
* [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) on AMD64/ARM64 (--profile proxy)

| Name | healthcheck| Port | Example |
| -------- | ------- | ------- | ------- |
| N8N | yes | 5678 | http://127.0.0.1:5678 |
| Qdrant | yes | 6333 | http://127.0.0.1:6333/dashboard |
| OpenwebUI | yes | 8383 | http://127.0.0.1:8383 |
| NGINX proxy manager | yes | 81 | http://127.0.0.1:81 |
| Searxng | yes | 8181 | http://127.0.0.1:8181 |
| EvolutionAPI | | 9191 | http://127.0.0.1:9191/manager |
| Flowise | yes | 3001 | http://127.0.0.1:3001 |
| Opencode | yes | 4096 | http://127.0.0.1:4096 |
| Redis Insight | yes | 8001 | http://127.0.0.1:8001 |
| Hermes Agent Dashboard | yes | 9119 | http://127.0.0.1:9119 |
| Hermes Agent API | yes | 8642 | http://127.0.0.1:8642/v1 |
| Rabbitmq broker | | 5672 | http://127.0.0.1:5672 |
| Rabbitmq management | | 15672 | http://127.0.0.1:15672 |
| Browserless | yes | 3000 | http://127.0.0.1:3000 |

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
