# OpenCode + Ollama

1. Start an Ollama profile (for example `--profile ollama-cpu`, `--profile ollama-nvidia`, or `--profile ollama-amd`) and pull the target model inside the `ollama` container:

   ```bash
   docker compose -f docker-compose.yml --env-file .env --profile ollama-cpu up -d
   docker exec -it ollama ollama pull qwen3.5:9b
   ```

2. Copy `env.example` to `.env` if you have not already done so, then set `ollamamodel` and `ollamaquant` to match the model tag you pulled (for example `ollamamodel="qwen3.5"` and `ollamaquant="9b"`). `docker-compose.yml` injects both into `OPENCODE_CONFIG_CONTENT` automatically.

3. Start OpenCode:

   ```bash
   docker compose -f docker-compose.yml --env-file .env --profile opencode up -d
   ```

4. Access OpenCode on `http://127.0.0.1:4096` (enable `OPENCODE_SERVER_USERNAME` and `OPENCODE_SERVER_PASSWORD` in `docker-compose.yml` before exposing this port outside `localhost`).
