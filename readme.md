# llm-lab

To run with nvidia capabilities:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile nvidia up -d
```

To run with another gpu/cpu:

```bash
docker compose -f docker-compose.yml --env-file .env-example --profile others up -d
```
