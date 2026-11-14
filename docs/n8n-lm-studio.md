# N8N + LM Studio

## Step 1: Start the LM Studio Server

* Open **LM Studio** and go to the **Developer** tab (the console icon on the left menu).
* Load the model you want to use.
* Click **Start Server**.

**Notes:**
* LM Studio listens on port `1234` by default. Enable **Serve on Local Network** so the `n8n` and `n8n-worker` containers can reach the LM Studio host IP.
* Disable **Just-in-Time Model Loading** to prevent model-load timeouts during workflow execution.

## Step 2: Add LM Studio to N8N

1. In N8N, create a new **OpenAI** (or OpenAI-compatible) credential.
2. Set the **Base URL** to:

   ```text
   http://<server-lan-ip>:1234/v1
   ```

   *(Avoid `http://localhost:1234/v1` inside N8N because `localhost` resolves to the N8N container itself.)*
3. Configure **Allowed HTTP Request Domains** to match `<server-lan-ip>` (avoid `all` in production environments).
