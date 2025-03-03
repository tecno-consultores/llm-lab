# llm-lab

To run [flowise](https://flowiseai.com/) and [N8N](https://n8n.io/) with all dependencies:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile complete up -d
```

To run Flowise with dependencies (Postgres, Redis, [Chroma](https://github.com/chroma-core/chroma)):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile flow up -d
```

To run N8N with dependencies (Postgres, Redis, [Qdrant](https://github.com/qdrant/qdrant)):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile n8n up -d
```

To run the extras that need nvidia gpu like Whisper:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras-gpu up -d
```

To run the extras [Kafka](https://kafka.apache.org/), [Whisper](https://github.com/openai/whisper) and [OpenwebUI](https://github.com/open-webui/open-webui):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras up -d
```

To run [Ollama](https://ollama.com/) over Nvidia:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-gpu up -d
```

To run Ollama over CPU or AMD GPU:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-cpu up -d
```
