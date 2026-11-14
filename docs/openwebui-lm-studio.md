# OpenWebUI + LM Studio

## Step 1: Start the LM Studio Server

* Open **LM Studio** and go to the **Developer** tab (the console icon on the left menu).
* Load the model you want to use.
* Click **Start Server**.

**Notes:**
* LM Studio listens on port `1234` by default. Enable **Serve on Local Network** (and **CORS** if needed) so containers can reach the host service.
* Disable **Just-in-Time Model Loading** for predictable response latency.

## Step 2: Add LM Studio to OpenWebUI

1. Ensure `ENABLE_OPENAI_API=true` is set in `.env` before starting `--profile openwebui`.
2. Open **OpenWebUI** in your browser and log in as an administrator.
3. Click your **profile picture** in the bottom-left corner and select **Admin Panel → Settings → Connections**.
4. Under **OpenAI API**, click **+** (**Add Connection**).
5. Fill in the connection details:
   * **API Base URL:**
     * If LM Studio runs on the **same Docker host**: `http://host.docker.internal:1234/v1` *(inside the container, `localhost` refers to the container itself, not the host)*.
     * If LM Studio runs on **another machine**: `http://<lm-studio-ip>:1234/v1`.
   * **API Key:** Enter a dummy value (for example `lm-studio`) if your LM Studio server does not require authentication.
6. Click **Save**.
