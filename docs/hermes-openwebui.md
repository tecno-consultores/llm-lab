# Hermes Agent + OpenWebUI

To use OpenWebUI as a frontend for Hermes Agent:

1. Ensure `ENABLE_OPENAI_API=true` is set in `.env` and start both profiles (`--profile hermes --profile openwebui`).
2. Open OpenWebUI in your browser and go to **Admin Settings → Connections → OpenAI**.
3. Click **+ Add Connection** and enter:
   * **URL:** `http://hermes:8642/v1` *(or `http://<host-ip>:8642/v1` if running on separate hosts)*
   * **API Key:** The value configured for `hapikey` in your `.env` file.
4. Click **Save**.
