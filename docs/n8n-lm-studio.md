## Step 1: Start the LM Studio Server
* Open **LM Studio** and go to the **Developer** tab (the (console) icon on the left menu).
* Load the model you want to use.
* Click **Start Server**.

Notes:
* the server address and port, which is usually http://localhost:1234. (If LM Studio and Open WebUI are on different computers, check "allow network access" or "CORS").
* disable **Just-in-Time Model Loading**.

## Step 2: Add LM Studio to N8N
* Create a new openai credential
  + Set the base url to: **http://server-ip:1234**
  + And Allowed HTTP Request Domains to: **all**
