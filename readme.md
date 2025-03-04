# llm-lab

To run [flowise](https://flowiseai.com/) and [N8N](https://n8n.io/) with all recommendations:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile complete up -d
```

To run Flowise with recommendations (Postgres, Redis, [Chroma](https://github.com/chroma-core/chroma)):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile flow up -d
```

To run N8N with recommendations (Postgres, Redis, [Qdrant](https://github.com/qdrant/qdrant)):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile n8n up -d
```

To run [OpenwebUI](https://github.com/open-webui/open-webui):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile openwebui up -d
```

To run [Kafka](https://kafka.apache.org/):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile kafka up -d
```

To run [Ollama](https://ollama.com/) over Nvidia:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-gpu up -d
```

To run Ollama over CPU or AMD GPU:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-cpu up -d
```

To run Whisper over Nvidia:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile whisper-gpu up -d
```

To run [Whisper](https://github.com/openai/whisper):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile whisper up -d
```

To run [crawl4ai](https://crawl4ai.com/) on AMD64:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile crawl4ai-amd64 up -d
```

To run crawl4ai on ARM64:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile crawl4ai-arm64 up -d
```
