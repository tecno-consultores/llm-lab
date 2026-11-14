# Browserless + Hermes

Start `--profile browserless` alongside `--profile hermes`. To retrieve the Browserless OpenAPI/Swagger specification from inside the Docker network so Hermes can inspect the API:

```bash
curl -sL http://browserless:3000/docs/swagger-ui-init.js
```

> [!NOTE]
> If you enable `TOKEN=${BROTOKEN}` in `docker-compose.yml` for Browserless authentication, append `?token=${BROTOKEN}` to Browserless requests.
