# llm-lab

To run with nvidia capabilities:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile nvidia up -d
```

To run with another gpu/cpu:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile others up -d
```

To run minimal services:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile minimal up -d
```

To run the extras that need GPU (nvidia) like Whisper:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras-gpu up -d
```

To run the extras like Kafka:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile extras up -d
```
