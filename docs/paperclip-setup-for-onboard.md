# Paperclip Onboarding Setup (Archived)

> [!WARNING]
> **Archived Service:** The `paperclip` container and `--profile paperclip` were removed from `docker-compose.yml` in commit `a2194cb`. This guide is retained strictly as historical reference.

## 1. Start Dependencies

Start the reverse proxy and OmniRoute profiles before onboarding:

```bash
docker compose -f docker-compose.yml --env-file .env --profile proxy --profile omniroute up -d
```

Complete onboarding inside OmniRoute and generate an API key.

## 2. Create a Local Lab SSL Certificate

> [!CAUTION]
> Generating a self-signed certificate for `/CN=api.openai.com` is intended **exclusively for isolated local lab interception**. Do not install custom root/override certificates for third-party domains on shared or production hosts.

Run on the host:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout openai.key -out openai.crt -subj "/CN=api.openai.com"
```

## 3. Configure NGINX Proxy Manager

1. Log in to the NGINX Proxy Manager web panel (`http://127.0.0.1:81`).
2. Go to **SSL Certificates → Add SSL Certificate → Custom**, upload `openai.crt` and `openai.key`, and save.
3. Go to **Hosts → Proxy Hosts → Add Proxy Host**. On the **Details** tab set:
   * **Domain Names:** `api.openai.com`
   * **Scheme:** `http`
   * **Forward Hostname / IP:** `omniroute`
   * **Forward Port:** `20128`
4. On the **SSL** tab, select the custom certificate you imported, enable **Force SSL**, and save.

## 4. Starting Paperclip (Legacy)

On legacy commits prior to `a2194cb`, the container was started with:

```bash
docker compose -f docker-compose.yml --env-file .env --profile paperclip up -d
```
