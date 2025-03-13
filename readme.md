# llm-lab

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

To run Flowise with recommendations on AMD64/ARM64 (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file env.example --profile flowise up -d
```

To run N8N with recommendations on AMD64/ARM64 (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file env.example --profile n8n up -d
```

Other profiles you can run:

* [Chroma](https://github.com/chroma-core/chroma) on AMD64/ARM64 (--profile chroma)
* [Qdrant](https://github.com/qdrant/qdrant) on AMD64/ARM64 (--profile qdrant)
* [OpenwebUI](https://github.com/open-webui/open-webui) on AMD64/ARM64 (--profile openwebui)
* [Kafka](https://github.com/apache/kafka) on AMD64/ARM64 (--profile kafka)
* [Ollama](https://github.com/ollama/ollama) on Nvidia (--profile ollama-gpu)
    + Ollama on AMD64/ARM64 or AMD GPU (--profile ollama-cpu)
* [Whisper](https://github.com/openai/whisper) on Nvidia (--profile whisper-gpu)
    + Whisper on CPU (--profile whisper)
* [Crawl4ai](https://github.com/unclecode/crawl4ai) on AMD64 (--profile crawl4ai-amd64)
    + Crawl4ai on ARM64 (--profile crawl4ai-arm64)
* [OpenHands](https://github.com/All-Hands-AI/OpenHands) on AMD64/ARM64 (--profile openhands)
* [NGINX proxy manager](https://github.com/NginxProxyManager/nginx-proxy-manager) on AMD64/ARM64 (--profile proxy)
* [Searxng](https://github.com/searxng/searxng) on AMD64/ARM64 (--profile searxng)

Example:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile openwebui --profile ollama-gpu up -d
```

Before running OpenHands for the first time on Linux you must run the following command:

```bash
echo "127.0.0.1 host.docker.internal" >> /etc/hosts
```
