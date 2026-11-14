# Contributing to LLM-Lab

Thank you for your interest in contributing to **LLM-Lab**! Maintained by [Tecno Consultores](https://www.tecnoconsultores.net/), this project provides a modular Docker Compose ecosystem for deploying `N8N`, `OpenWebUI`, `Qdrant`, `Ollama`, `EvolutionAPI`, `Hermes Agent`, `OpenCode`, `OmniRoute`, and supporting infrastructure services.

Your contributions help keep this stack reliable, reproducible, and secure for self-hosted and production-oriented AI automation workflows.

---

## Getting Started

1. **Fork & Clone:** Fork this repository and clone your fork locally.
2. **Workspace Environment:** We recommend a stable Linux distribution (such as Ubuntu 24.04 LTS) with Docker Engine and the `docker-compose-plugin` installed.
3. **Environment Configuration:** Copy the template file and customize your credentials, ports, and URLs (never use `env.example` directly in production):

   ```bash
   cp env.example .env
   ```

4. **Regenerate Local Secrets:** Before starting stateful services (`postgres`, `n8n`, `openwebui`, `omniroute`), regenerate every file in `./secrets/` and synchronize `POSTGRES_PASSWORD` in `.env` as documented in [SECURITY.md](./SECURITY.md).
5. **Start Services via Profiles:** Use `--profile` flags to launch only the services you need:

   ```bash
   docker compose -f docker-compose.yml --env-file .env --profile n8n --profile n8n-worker --profile qdrant up -d
   ```

---

## Areas of Contribution

* **Bug Reporting & Fixes:** If a container hits dependency errors, restart loops, or host port collisions (for example `8642`/`9119` for `Hermes Agent`, `5678`/`5679` for `N8N`, `20128` for `OmniRoute`, or `4096` for `OpenCode`), open an Issue with the affected profile, Compose output, and sanitized logs (`docker logs <container_name>`).
* **Infrastructure & Hardening:** Improvements to network segmentation, healthchecks, non-root execution, volume persistence, or resource limits in `docker-compose.yml`.
* **New Service Profiles:** Well-tested templates and documentation for additional inference engines (e.g., Ollama on Nvidia/AMD/CPU, LM Studio) or AI orchestration tools.
* **Documentation:** Corrections and updates across [README.md](./README.md) and [docs/README.md](./docs/README.md).

---

## Networks & Persistence in Production

When integrating public webhooks or messaging gateways (such as `EvolutionAPI` or `N8N`), carefully review reverse proxy and network routing behavior. If your deployment sits behind upstream load balancing (such as multi-WAN setups with ECMP and Layer 4 hashing), document whether the target service requires sticky session persistence or dedicated WebSocket/proxy headers in `NGINX Proxy Manager` (see [docs/custom-nginx-configuration.md](./docs/custom-nginx-configuration.md)).

---

## Pull Request Lifecycle

1. Create a descriptive branch from `develop`:
   * `feature/<short-description>`
   * `fix/<short-description>`
   * `docs/<short-description>`
2. Keep changes focused and atomic. If you add or rename environment variables in `docker-compose.yml`, update `env.example` accordingly.
3. Validate every modified profile before committing (see [TESTING.md](./TESTING.md)):

   ```bash
   docker compose -f docker-compose.yml --env-file .env --profile <profile> config -q
   ```

4. Use [Conventional Commits](https://www.conventionalcommits.org/) (`feat:`, `fix:`, `docs:`, `chore:`, `sec:`) and add a brief entry under `[Unreleased]` in [CHANGELOG.md](./CHANGELOG.md). Do **not** append raw `git log` dumps.
5. Verify that `.env`, private certificates (`*.key`, `*.pem`), and real credentials in `./secrets/*.txt` are **not** staged for commit.
6. Submit your Pull Request targeting the **`develop`** branch (`main` is reserved for verified releases; `*-legacy` branches are frozen historical archives).

Before participating, please review our [Code of Conduct](./CODE_OF_CONDUCT.md), [Security Policy](./SECURITY.md), and [Testing Guide](./TESTING.md).
