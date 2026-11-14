# OpenWebUI + Ollama

To connect OpenWebUI with Ollama:

1. Ensure `ENABLE_OLLAMA_API="true"` is set in your `.env` file before starting `--profile openwebui` and an Ollama profile.
2. Open OpenWebUI in your browser.
3. Go to **Admin Settings → Connections**.
4. Enable **Ollama API**.
5. Click the **gear** icon to configure the connection:
   * **URL:** `http://ollama:11434`
   * Click the **refresh** icon next to the URL field to verify connectivity.
6. Click **Save**.
