# Security Policy

At Tecno Consultores, we prioritize the confidentiality, integrity, and availability of the automation and AI infrastructures deployed through **LLM-Lab**. This policy defines supported branches, deployment hardening prerequisites, and our responsible vulnerability disclosure process.

## Supported Versions

Security and configuration updates are maintained on active branches only:

| Branch / Version | Receives Security Updates | Notes |
| ---------------- | ------------------------- | ----- |
| `main` | ✅ Yes | Verified stable release state |
| `develop` | ✅ Yes | Active integration branch |
| `*-legacy` / older commits | ❌ No | Frozen archives — migrate to `main` or `develop` |

*Important: LLM-Lab orchestrates third-party upstream container images (`N8N`, `OpenWebUI`, `Ollama`, `Qdrant`, `KeyDB`, `PostgreSQL`, `EvolutionAPI`, `Hermes Agent`, `OpenCode`, `Browserless`, `SearXNG`, `OmniRoute`, `NGINX Proxy Manager`). Infrastructure administrators are responsible for periodically pulling updated images (`docker compose pull`) and verifying changelogs before upgrades.*

---

## Mandatory Pre-Deployment Security Controls

> [!IMPORTANT]
> The repository provides default placeholders to keep local evaluation easy. Review and apply the controls below before exposing any service beyond `localhost` or running in production.

1. **Regenerate `./secrets/*.txt` Before Any Deployment:**
   The files under `./secrets/` (`n8n_encryption_key.txt`, `n8n_jwt_secret.txt`, `n8n_runners_token.txt`, `pg_password.txt`) are tracked as bootstrap placeholders in Git. **Never use those default values in any real environment.** Regenerate them locally and tell Git to ignore your local modifications so real secrets are never committed:

   ```bash
   git update-index --skip-worktree secrets/n8n_encryption_key.txt secrets/n8n_jwt_secret.txt secrets/n8n_runners_token.txt secrets/pg_password.txt
   ```

2. **Keep PostgreSQL Passwords Synchronized Across Secrets and `.env`:**
   In the current `docker-compose.yml`, `postgres` and `n8n` read the database password from `./secrets/pg_password.txt` (`/run/secrets/postgres_pass`), whereas `openwebui` and `evolutionapi` read `${POSTGRES_PASSWORD}` from `.env`. Whenever you rotate `./secrets/pg_password.txt`, **update `POSTGRES_PASSWORD` in `.env` with the exact same value**.

3. **Harden Exposed Ports, Authentication, and Privileged Sockets:**
   * Keep internal databases (`postgres`, `keydb`) unexposed on host interfaces and place public web UIs behind `proxy` (NGINX Proxy Manager) with TLS enabled, binding direct service ports to `127.0.0.1` when a reverse proxy is used.
   * Enable authentication before exposing internal tools: uncomment `OPENCODE_SERVER_USERNAME` / `OPENCODE_SERVER_PASSWORD` for `opencode` (port `4096`), enable `TOKEN=${BROTOKEN}` for `browserless` (port `3000`), and restrict or protect `qdrant` (`6333`/`6334`) and `keydb` (`6379`) on untrusted networks.
   * Note that `acp-orchestrator` (`Hermes-OpenCode Bridge`) mounts `/var/run/docker.sock` and `sandbox-runner` runs with `privileged: true`; enable those profiles only on trusted, network-isolated hosts.

---

## Generating Secrets & Keys

Use `umask 077` when writing secret files so they are readable only by their owner.

### Generate a 32-character alphanumeric secret file (`./secrets/*.txt`)

```bash
(umask 077 && tr -dc 'A-Za-z0-9_' </dev/urandom | head -c 32 > ./secrets/filename.txt)
```

*(Ensure there is no trailing newline if the consuming application passes the file verbatim; `head -c 32` produces exact 32-byte output without a newline.)*

### Generate `JWT_SECRET` for OmniRoute

```bash
openssl rand -base64 48
```

### Generate `API_KEY_SECRET` and `STORAGE_ENCRYPTION_KEY` for OmniRoute

```bash
openssl rand -hex 32
```

---

## Reporting a Vulnerability

We appreciate responsible, private disclosure of security issues (such as exposed credentials, unintended port exposure, container privilege escalation, or command injection in helper scripts).

### Reporting Channels

1. **Via GitHub Security Advisories (Preferred):** Open the repository's **Security** tab and click **Report a vulnerability** to create a private encrypted advisory with the maintainers.
2. **Direct Maintainer Contact:** If you cannot use GitHub Security Advisories, contact the Tecno Consultores maintainer team privately via the official support channels listed on [tecnoconsultores.net](https://www.tecnoconsultores.net/) or the maintainer profile in [AUTHORS.md](./AUTHORS.md).

**Please DO NOT open a public Issue to report a security vulnerability.**

### Response Process

Once a report is received:
* We will acknowledge receipt within a reasonable timeframe.
* We will investigate and reproduce the issue privately in an isolated environment.
* We will prepare and publish a remediation patch directly to the repository, accompanied by a Security Advisory when applicable.
