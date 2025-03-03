# llm-lab

To run [flowise](https://flowiseai.com/){:target="_blank"} and [N8N](https://n8n.io/){:target="_blank"} with all dependencies:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile complete up -d
```

To run Flowise with dependencies (Postgres, Redis, Chroma):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile flow up -d
```

To run N8N with dependencies (Postgres, Redis, Qdrant):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile n8n up -d
```

To run the extras that need nvidia gpu like Whisper:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras-gpu up -d
```

To run the extras Kafka, Whisper and OpenwebUI:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras up -d
```

To run Ollama over Nvidia:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-gpu up -d
```

To run Ollama over CPU or AMD GPU:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile ollama-cpu up -d
```
