# Hermes Agent + Ollama

1. Ensure both `--profile hermes` and an Ollama profile (for example `--profile ollama-cpu`, `--profile ollama-nvidia`, or `--profile ollama-amd`) are running.
2. Select a model provider inside the `hermes` container:

   ```bash
   docker exec -it hermes hermes model
   ```

3. Choose **Custom endpoint** and enter:

   ```text
   http://ollama:11434/v1
   ```

4. Leave the API key blank when prompted.
