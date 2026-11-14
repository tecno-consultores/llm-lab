# OpenWebUI + OmniRoute

Made by: [Tecno Consultores](https://www.tecnoconsultores.net/)

To connect OpenWebUI with OmniRoute:

1. Ensure `ENABLE_OPENAI_API=true` is set in your `.env` file before starting `--profile openwebui` and `--profile omniroute`.
2. Open OpenWebUI in your browser and go to **Admin Panel → Settings → Connections**.
3. Under **OpenAI API**, enable the connection and click the **gear** icon (or **+** to add a connection).
4. Set the **API Base URL** to:

   ```text
   http://omniroute:20128/v1
   ```

5. Paste your OmniRoute API key into the **API Key / Bearer** field.
6. Click **Save**.
