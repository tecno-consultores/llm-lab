# llm-lab

To run all services with nvidia capabilities:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile nvidia up -d
```

To run all services with another gpu/cpu:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile others up -d
```

To run minimal services (Flowise, N8N, Redis, Postgres, Qdrant):

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile minimal up -d
```

To run the extras that need nvidia gpu like Whisper:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras-gpu up -d
```

To run the extras Kafka, Whisper:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras up -d
```
