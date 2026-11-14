# Hermes Agent + LM Studio

## Step 1: Start the LM Studio Server

* Open **LM Studio** and go to the **Developer** tab (the console icon on the left menu).
* Load the model you want to use.
* Click **Start Server**.

**Notes:**
* LM Studio listens on port `1234` by default. Enable **Serve on Local Network** so the `hermes` container can reach LM Studio over the host LAN IP (`http://<host-lan-ip>:1234/v1`).
* Disable **Just-in-Time Model Loading**.

## Step 2: Add LM Studio to Hermes

Run the interactive setup inside the `hermes` container and select **LM Studio** (or a custom OpenAI-compatible endpoint pointing to `http://<host-lan-ip>:1234/v1`):

```bash
docker exec -it hermes hermes setup
```
