# llm-lab

To run Flowise with recommendations (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile flowise up -d
```

To run N8N with recommendations (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile n8n up -d
```

Other profiles you can run:

* [Chroma](https://github.com/chroma-core/chroma) (--profile chroma)
* [Qdrant](https://github.com/qdrant/qdrant) (--profile qdrant)
* [OpenwebUI](https://github.com/open-webui/open-webui) (--profile openwebui)
* [Kafka](https://github.com/apache/kafka) (--profile kafka)
* [Ollama](https://github.com/ollama/ollama) over Nvidia (--profile ollama-gpu)
* Ollama over CPU or AMD GPU (--profile ollama-cpu)
* [Whisper](https://github.com/openai/whisper) over Nvidia (--profile whisper-gpu)
* Whisper over CPU (--profile whisper)
* [Crawl4ai](https://github.com/unclecode/crawl4ai) on AMD64 (--profile crawl4ai-amd64)
* Crawl4ai on ARM64 (--profile crawl4ai-arm64)
* [OpenHands](https://github.com/All-Hands-AI/OpenHands) (--profile openhands)

Example:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile openwebui --profile ollama-gpu up -d
```
