# llm-lab

To run Flowise with recommendations (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile flow up -d
```

To run N8N with recommendations (Postgres, Redis):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile n8n up -d
```

Other profiles you can run:

* [Chroma](https://github.com/chroma-core/chroma) (--profile chroma)
* [Qdrant](https://github.com/qdrant/qdrant) (--profile qdrant)
* [OpenwebUI](https://github.com/open-webui/open-webui) (--profile openwebui)
* [Kafka](https://kafka.apache.org/) (--profile kafka)
* [Ollama](https://ollama.com/) over Nvidia (--profile ollama-gpu)
* Ollama over CPU or AMD GPU (--profile ollama-cpu)
* [Whisper](https://github.com/openai/whisper) over Nvidia (--profile whisper-gpu)
* Whisper over CPU (--profile whisper)
* [Crawl4ai](https://crawl4ai.com/) on AMD64 (--profile crawl4ai-amd64)
* Crawl4ai on ARM64 (--profile crawl4ai-arm64)

Example:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile openwebui --profile ollama-gpu up -d
```
