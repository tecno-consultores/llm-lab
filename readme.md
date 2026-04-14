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
* [n8n-openai-bridge](https://github.com/sveneisenschmidt/n8n-openai-bridge/) on AMD64 (--profile openaibridge)
* [OpenwebUI](https://github.com/open-webui/open-webui) on AMD64/ARM64 (--profile openwebui)
* [Kafka](https://github.com/apache/kafka) on AMD64/ARM64 (--profile kafka)
* [Ollama](https://github.com/ollama/ollama) on Nvidia (--profile ollama-gpu)
    + Ollama on AMD64/ARM64 or AMD GPU (--profile ollama-cpu)
* [Whisper](https://github.com/openai/whisper) on Nvidia (--profile whisper-gpu)
    + Whisper on CPU (--profile whisper)
* [Crawl4ai](https://github.com/unclecode/crawl4ai) on AMD64 (--profile crawl4ai-amd64)
    + Crawl4ai on ARM64 (--profile crawl4ai-arm64)
* [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) on AMD64/ARM64 (--profile proxy)
* [Searxng](https://github.com/searxng/searxng) on AMD64/ARM64 (--profile searxng)
* [MongoDB](https://www.mongodb.com) on AMD64 (--profile mongodb)
* [EvolutionAPI](https://doc.evolution-api.com/v1/en/get-started/introduction) on AMD64/ARM64 url example: http://127.0.0.1:9191 (--profile evolutionapi)
* [Flowise](https://github.com/flowiseai/flowise) on AMD64/ARM64 url example: http://127.0.0.1:3001 (--profile flowise)
* [Opencode](https://github.com/anomalyco/opencode) on AMD64 url example: http://127.0.0.1:4096 (--profile opencode)
* [OpenClaw](https://github.com/openclaw/openclaw) on AMD64 url example: http://127.0.0.1:18789 (--profile openclaw)


To run N8N with OpenwebUI: 

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
```

To access **Redis Insight**, go to http://x.x.x.x:port where x.x.x.x is the IP address of the instance and port is the number set in the environment variables file. The default is 8001.



| Name | Port | Example |
| -------- | ------- | ------- |
| N8N | 5678 | http://127.0.0.1:5678 |
| Qdrant | 6333 | http://127.0.0.1:6333/dashboard |
| OpenwebUI | 8383 | http://127.0.0.1:8383 |
| NGINX proxy manager | 81 | http://127.0.0.1:81 |
| Searxng | 8181 | http://127.0.0.1:8181 |
| EvolutionAPI | 8181 | http://127.0.0.1:8181 |

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=tecno-consultores/llm-lab&type=Date)](https://www.star-history.com/#tecno-consultores/llm-lab&Date)
