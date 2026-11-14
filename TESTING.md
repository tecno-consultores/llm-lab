# Testing & Verification Guide

This guide documents how to validate **LLM-Lab** Docker Compose profiles, shell scripts, and security posture using ephemeral containers (**Rule Zero**: keep host tooling minimal and reproducible).

---

## 1. Docker Compose Schema & Profile Validation

Validate individual profiles or compatible combinations before committing changes:

```bash
# Validate core automation profiles
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-worker config -q
docker compose -f docker-compose.yml --env-file env.example --profile n8n --profile n8n-runner config -q
docker compose -f docker-compose.yml --env-file env.example --profile openwebui config -q
docker compose -f docker-compose.yml --env-file env.example --profile omniroute config -q
docker compose -f docker-compose.yml --env-file env.example --profile acp-orchestrator config -q
```

You can also validate all standard single-service profiles in a loop:

```bash
for p in n8n n8n-worker n8n-ai-sandbox openwebui ollama-nvidia ollama-amd ollama-cpu evolutionapi opencode hermes searxng browserless proxy postgres keydb omniroute acp-orchestrator qdrant; do
  echo "Checking profile: $p"
  docker compose -f docker-compose.yml --env-file env.example --profile "$p" config -q
done
```

> [!NOTE]
> **Known Compose Constraints (current `docker-compose.yml`):**
> * Do **not** run `docker compose --profile "*"` (including `--profile "*" down`), because `ollama-nvidia`, `ollama-amd`, and `ollama-cpu` are mutually exclusive and share `container_name: ${ohostname}`. Use `docker compose -f docker-compose.yml --env-file .env down --remove-orphans` instead.
> * Always pass `--profile n8n` alongside `--profile n8n-runner` (`n8n-worker` depends on `n8n`, which is not tagged with `n8n-runner`).
> * Avoid invoking `--profile openaibridge` alone; it is a legacy profile tag on `n8n`/`openwebui` without `postgres`/`keydb` attached.

---

## 2. Shell Script Static Analysis (Rule Zero)

Run `ShellCheck` inside an ephemeral container against all shell scripts in the repository:

```bash
docker run --rm -v "$(pwd):/mnt:ro" -w /mnt koalaman/shellcheck:stable \
  install.sh init/init.sh docs/ttyia.sh
```

---

## 3. Infrastructure & Secret Scanning (Rule Zero)

Scan `docker-compose.yml`, `legacy/Dockerfile`, and repository history for misconfigurations or leaked credentials:

```bash
# IaC misconfiguration scan (Trivy)
docker run --rm -v "$(pwd):/workspace:ro" -w /workspace aquasec/trivy:latest config .

# Secret scan (Gitleaks)
docker run --rm -v "$(pwd):/repo:ro" -w /repo zricethezav/gitleaks:latest detect --source /repo --no-git
```

*(Note: verify that local `.env` and regenerated `./secrets/*.txt` values are never committed; see [SECURITY.md](./SECURITY.md).)*

---

## 4. Runtime Healthcheck & Endpoint Verification

After starting a profile with `docker compose --env-file .env --profile <profile> up -d`, inspect container health:

```bash
docker compose -f docker-compose.yml --env-file .env ps
```

Services **with** Compose-level `healthcheck` definitions report `(healthy)` automatically (`postgres`, `keydb`, `n8n`, `n8n-worker`, `n8n-runner`, `sandbox-api`, `sandbox-runner`, `qdrant`, `ollama-*`, `proxy`, `searxng`, `evolutionapi`, `opencode`, `hermes`, `browserless`).

Services **without** a Compose-level `healthcheck` currently require direct HTTP checks after startup:

* **OpenWebUI:** `curl -fsS http://127.0.0.1:${PORT:-8383}/health`
* **OmniRoute:** `curl -fsS http://127.0.0.1:${omniport:-20128}/api/v1` (or open `http://127.0.0.1:${omniport:-20128}`)
* **Hermes-OpenCode Bridge (`acp-orchestrator`):** verify container logs with `docker logs acp-orchestrator` and endpoint reachability on port `8000`.
