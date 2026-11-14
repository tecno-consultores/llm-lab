# OpenCode + Hermes

Start `--profile opencode` alongside `--profile hermes`. Inside the Docker network, OpenCode serves its OpenAPI specification at port `4096`:

```bash
curl -s -L -H "Accept: application/json" "http://opencode:4096/doc"
```

> [!NOTE]
> If you uncomment `OPENCODE_SERVER_USERNAME` and `OPENCODE_SERVER_PASSWORD` in `docker-compose.yml`, pass `-u "${OPENCODE_SERVER_USERNAME}:${OPENCODE_SERVER_PASSWORD}"` to `curl`.
