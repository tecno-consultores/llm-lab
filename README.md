# llm-lab

Made by: [Tecno Consultores](https://www.tecnoconsultores.net/)

[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/tecno-consultores/llm-lab)

## Quick Start

1. Copy the environment template and configure your credentials, URLs, and ports:

```bash
cp env.example .env
```

2. Regenerate all placeholder secret files in `./secrets/` (and keep `POSTGRES_PASSWORD` in `.env` synchronized with `./secrets/pg_password.txt`). See [SECURITY.md](./SECURITY.md) before any non-local deployment.

3. Start the core automation and UI stack (`N8N` with `PostgreSQL` + `KeyDB`, workers, runners, and `OpenWebUI`):

```bash
docker compose -f docker-compose.yml --env-file .env --profile n8n --profile n8n-worker --profile n8n-runner --profile openwebui up -d
```

---

## Core Profiles

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| ------- | ----- | ----- | --- | ------ | ---------- | ------- |
| [N8N](https://github.com/n8n-io/n8n) | ✅ | ✅ | | ✅ | `postgres`, `keydb` *(plus `n8n-worker` for queue execution)* | `--profile n8n` |
| N8N-worker | ✅ | ✅ | | | `postgres`, `keydb`, `n8n` | `--profile n8n-worker` |
| N8N-runner (code sandbox) | ✅ | ✅ | | | `postgres`, `keydb`, `n8n-worker` *(include `--profile n8n`)* | `--profile n8n --profile n8n-runner` |
| N8N-AI-SANDBOX | ✅ | ✅ | | | `sandbox-certs`, `sandbox-api`, `sandbox-runner` *(use with `n8n`)* | `--profile n8n-ai-sandbox` |
| [OpenWebUI](https://github.com/open-webui/open-webui) | ✅ | ✅ | | ✅ | `postgres`, `keydb` | `--profile openwebui` |
| [Ollama](https://github.com/ollama/ollama) (Nvidia) | ✅ | ❌ | Nvidia | | *Mutually exclusive with other `ollama-*` profiles* | `--profile ollama-nvidia` |
| Ollama (AMD ROCm) | ✅ | ❌ | AMD | | *Mutually exclusive with other `ollama-*` profiles* | `--profile ollama-amd` |
| Ollama (CPU) | ✅ | ✅ | | | *Mutually exclusive with other `ollama-*` profiles* | `--profile ollama-cpu` |
| [EvolutionAPI](https://github.com/evolution-foundation/evolution-api) | ✅ | ✅ | | | `postgres`, `keydb` | `--profile evolutionapi` |
| [OpenCode](https://github.com/anomalyco/opencode) | ✅ | ✅ | | ✅ | | `--profile opencode` |
| [Hermes Agent](https://github.com/nousresearch/hermes-agent) | ✅ | ✅ | | ✅ | | `--profile hermes` |

## Complementary Services

| Project | AMD64 | ARM64 | GPU | Ollama | Depends on | Profile |
| ------- | ----- | ----- | --- | ------ | ---------- | ------- |
| [SearXNG](https://github.com/searxng/searxng) | ✅ | ✅ | | | | `--profile searxng` |
| [Browserless](https://github.com/browserless/browserless) | ✅ | ✅ | | | | `--profile browserless` |
| [NGINX Proxy Manager](https://github.com/NginxProxyManager/nginx-proxy-manager) | ✅ | ✅ | | | | `--profile proxy` |
| [PostgreSQL](https://hub.docker.com/_/postgres) | ✅ | ✅ | | | | `--profile postgres` |
| [KeyDB](https://github.com/snapchat/keydb) | ✅ | ⚠️¹ | | | | `--profile keydb` |
| [OmniRoute](https://github.com/diegosouzapw/OmniRoute) | ✅ | ✅ | | | `keydb` | `--profile omniroute` |
| [Hermes-OpenCode Bridge](https://github.com/tecno-consultores/hermes-opencode-bridge) | ✅ | ✅ | | | `hermes`, `opencode` | `--profile acp-orchestrator` |
| [Qdrant](https://github.com/qdrant/qdrant) | ✅ | ✅ | | | | `--profile qdrant` |

¹ *KeyDB currently defaults to `eqalpha/keydb:x86_64_v6.3.3` in `docker-compose.yml`; uncomment `eqalpha/keydb:arm64_v6.3.3` for ARM64 hosts.*

---

## Healthchecks, Ports, and URLs

| Name | Healthcheck | Host Ports (Default) | GUI | Internal Docker URL |
| ---- | ----------- | -------------------- | --- | ------------------- |
| N8N | ✅ | `5678`, `5679` *(broker)* | `http://127.0.0.1:5678` | `http://n8n:5678/api/v1` |
| Qdrant | ✅ *(CLI check)* | `6333`, `6334` *(gRPC)* | `http://127.0.0.1:6333/dashboard` | `http://qdrant:6333` |
| OpenWebUI | ❌ | `8383` | `http://127.0.0.1:8383` | `http://openwebui:8080` |
| NGINX Proxy Manager | ✅ | `80`, `443`, `81` | `http://127.0.0.1:81` | `http://proxy:81/api` |
| SearXNG | ✅ | `8189` *(commented)* | — *(internal only by default)* | `http://searxng:8080` |
| EvolutionAPI | ✅ | `9191` | `http://127.0.0.1:9191/manager` | `http://evolutionapi:8080` |
| OpenCode | ✅ | `4096` | `http://127.0.0.1:4096` | `http://opencode:4096/doc` |
| Hermes Agent | ✅ | `8642`, `9119` | `http://127.0.0.1:9119` | `http://hermes:8642/v1` |
| Browserless | ✅ | `3000` *(commented)* | — *(internal only by default)* | `http://browserless:3000/docs` |
| OmniRoute | ❌ | `20128` | `http://127.0.0.1:20128` | `http://omniroute:20128/v1` |
| Hermes-OpenCode Bridge | ❌ | `8000` | — | `http://acp-orchestrator:8000/v1/agent/task` |
| PostgreSQL | ✅ | `5432` *(commented)* | — *(internal only by default)* | `postgres-ai:5432` |
| KeyDB | ✅ | `6379` *(commented)* | — *(internal only by default)* | `keydb:6379` |
| Ollama | ✅ | `11434` *(commented)* | — *(internal only by default)* | `http://ollama:11434` |

---

## Stopping & Removing Containers

To stop and remove all active containers and networks for this project:

```bash
docker compose -f docker-compose.yml --env-file .env down --remove-orphans
```

> [!NOTE]
> Do **not** pass `--profile "*"` with `docker compose`, because `ollama-nvidia`, `ollama-amd`, and `ollama-cpu` share `container_name: ollama` and cannot coexist in a single expanded profile set.

---

## Documentation & Governance

* [Documentation Index](./docs/README.md) — Service integrations, prompts, and troubleshooting guides
* [Contributing Guide](./CONTRIBUTING.md) — Branching model (`develop`), PR checklist, and Compose conventions
* [Security Policy](./SECURITY.md) — Secret rotation, hardening guidance, and vulnerability reporting
* [Testing & Verification Guide](./TESTING.md) — Compose validation, ShellCheck, Trivy/Gitleaks, and healthchecks
* [Changelog](./CHANGELOG.md) — Semantic release history
* [Code of Conduct](./CODE_OF_CONDUCT.md) — Community standards and enforcement
* [Authors](./AUTHORS.md) — Maintainers and contributors
* [License](./LICENSE) — GNU General Public License v2.0

**Notes:**
* Starting with PostgreSQL **18**, the data directory structure changes; review upstream migration instructions before upgrading existing volumes from earlier versions.
