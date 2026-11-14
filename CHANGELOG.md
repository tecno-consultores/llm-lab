# Changelog

All notable changes to **LLM-Lab** will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Standardized repository governance files (`AGENTS.md`, `TESTING.md`, `CHANGELOG.md`, `.github/CODEOWNERS`, `.github/PULL_REQUEST_TEMPLATE.md`, and `.github/ISSUE_TEMPLATE/`).
- Categorized documentation index in [`docs/README.md`](./docs/README.md).
- `group_add` configuration for GPU (`video`) and Docker (`${DOCKER_GID}`) access in `docker-compose.yml` (`f0beb03`).

### Changed
- Renamed root and documentation governance files to standard uppercase (`README.md`, `CONTRIBUTING.md`, `SECURITY.md`, `docs/README.md`).
- Updated `OPENCODE_CONFIG_CONTENT` environment variable parameterization (`3189a15`) and Ollama/OmniRoute settings in `env.example` (`99c2438`).
- Uncommented `OPENAI_API_KEY` mapping in `docker-compose.yml` (`60b8bb6`).
- Unified repository documentation in English and aligned `README.md` port, healthcheck, and profile dependency tables with the active `docker-compose.yml` definitions.
- Cleaned up duplicate and obsolete entries in `.gitignore` and `.dockerignore`.

### Removed
- Raw `git log` dump file (`changelog`), replaced by this semantic `CHANGELOG.md`.
- Network aliases from the `proxy` service (`002d182`).
- `paperclip` container service from active Compose profiles (`a2194cb`; setup guide retained in `docs/paperclip-setup-for-onboard.md` as archived reference).

### Fixed
- Fixed `ENABLE_TITLE_GENERATION` (`${...}`) interpolation, `ENABLE_EASTER_EGGS=false` assignment, internal `searxng:8080` URL for `n8n`, `proxy` memory limit (`512M`), and removed obsolete `links:` and duplicate environment entries in `docker-compose.yml`.
- Fixed `searxng_api_documentation` variable reference typo and removed unused/duplicate `OLLAMA_NO_CLOUD` and `DEEPGRAM_API_KEY` entries in `env.example`.
- Removed obsolete `paperclip` database creation/grant lines from `init/init.sh`.

## [0.4.0] - 2026-09-26

### Added
- `OmniRoute` profile (`--profile omniroute`) with encryption and WS environment configuration (`87fca42`).
- `Hermes-OpenCode Bridge` (`--profile acp-orchestrator`) for ACP orchestration.
- `N8N-AI-SANDBOX` mTLS/DinD profiles (`--profile n8n-ai-sandbox`) including `sandbox-certs`, `sandbox-api`, and `sandbox-runner` (`f7e3f1e`, `354ef8b`).
- Secret generation instructions in `SECURITY.md` (`c14409d`).

### Changed
- Split `ollama-amd` (ROCm) and `ollama-cpu` into separate Compose profiles (`5f585c1`).
- Migrated in-memory broker/cache service to `KeyDB` (`f2d162a`).

### Removed
- Archived `Flowise` (`1705800`), `MongoDB` and `RabbitMQ` (`73b5144`), and `Whisper` (`957109e`) into dedicated `*-legacy` branches.

## [0.3.0] - 2026-06-29

### Added
- `Hermes Agent`, `OpenCode`, `Browserless`, `SearXNG` inline configuration, and `EvolutionAPI` profiles.
- Docker secrets integration (`./secrets/*.txt`) for `N8N` and `PostgreSQL` (`2fd9d86`).
- OpenWebUI to N8N Webhook async Pipe integration and operational guides in `docs/`.

## [0.2.0] - 2025-03-03

### Changed
- Reorganized modular `--profile` service architecture, ARM/CPU support adjustments, and environment variable cleanup.

## [0.1.0] - 2024-12-28

### Added
- Initial `llm-lab` Docker Compose stack (`N8N`, `OpenWebUI`, `Ollama`, `PostgreSQL`, `Qdrant`, and `NGINX Proxy Manager`) licensed under GPL-2.0.
