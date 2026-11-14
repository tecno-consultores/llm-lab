# OpenWebUI + N8N Webhook

1. In `N8N`, create a workflow with a **Webhook** trigger configured to use the `POST` method.
   * Note the webhook URL. When OpenWebUI and N8N run on the same Docker network, you can use the internal URL `http://n8n:5678/webhook/<your-path>`.
2. Open **OpenWebUI** in your browser.
3. Go to **Admin Settings → Functions** and click **New Function**.
4. Delete the default example code, then set the function name and description.
5. Copy and paste the contents of the recommended async Pipe implementation (`v0.3.0`, `aiohttp`): [title n8n Pipe Function-2.txt](./title%20n8n%20Pipe%20Function-2.txt).
   *(The earlier synchronous `v0.2.0` variant using `requests` is archived at [n8n Pipe Function.txt](./n8n%20Pipe%20Function.txt) for reference only.)*
6. Click **Save** and confirm when prompted.
7. Click the **gear** icon on the new function to configure its **Valves**:
   * **N8N Url:** Your N8N webhook URL
   * **N8N Bearer Token:** Your webhook authorization token
8. Click **Save** and enable the function.
