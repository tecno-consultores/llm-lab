## Step 1: Start the LM Studio Server
* Open **LM Studio** and go to the **Developer** tab (the (console) icon on the left menu).
* Load the model you want to use.
* Click **Start Server**.

Notes:
* the server address and port, which is usually http://localhost:1234. (If LM Studio and Open WebUI are on different computers, check "allow network access" or "CORS").
* disable **Just-in-Time Model Loading**.

## Step 2: Add LM Studio to Open WebUI
* Open **OpenWebUI** in your browser and log in.
* Click your **profile picture** in the bottom left corner and select **Admin Panel**.
* Go to **Connections** in the settings menu.
* Scroll to the **OpenAI API** section and click the **+ icon** (Add Connection).
* Fill in the connection details:
  * **API Base URL**: http://localhost:1234/v1 (replace localhost with your machine's IP address if they are on different machines).
  * **API Key**: You can leave this blank or type a single space (LM Studio doesn't require a key by default).
* Click Save.
