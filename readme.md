# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

To run N8N on AMD64/ARM64 (with Postgres and Redis):

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker up -d
```

Profiles you can run:

* [N8N](https://github.com/n8n-io/n8n) on AMD64/ARM64 (--profile n8n)
    + N8N-worker on AMD64/ARM64 (--profile n8n-worker)
* [Qdrant](https://github.com/qdrant/qdrant) on AMD64/ARM64 (--profile qdrant)
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
* [EvolutionAPI](https://doc.evolution-api.com/v1/en/get-started/introduction) on AMD64/ARM64 (--profile evolutionapi)

Example:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker --profile openwebui up -d
```

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=tecno-consultores/llm-lab&type=Date)](https://www.star-history.com/#tecno-consultores/llm-lab&Date)
