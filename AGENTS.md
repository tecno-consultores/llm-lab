# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2026 Jesus Palencia <sinfallas@gmail.com> (Creado en Tecno Consultores)

# 🤖 AI Agent Directives & Technical Governance — llm-lab

<!-- QA_11X_MCP_CONNECTOR_START -->
## 🤖 Central QA 11X Skill & MCP Server Connector (`@sinfallas/mcp-qa-11x`)

> **OUTPUT LANGUAGE & HIGH-IQ TOKEN ECONOMY:** Interact and explain reasoning in the **user's prompt language**; write commit messages and human-facing docs matching the **existing language of `README.md` and `CHANGELOG.md`** (explicitly ignoring `AGENTS.md` and `.agents/**`, which remain in concise English for token economy; default to prompt language on empty repos). Apply *3-Tier Progressive Disclosure* (load global skill `references/*.md` and local `.agents/rules/domain_*.md` on-demand only), *Graphify AST-First & Windowed-Read-Second* (for ANY code/architecture Q&A or pre-change, query `graphify-out/graph.json` & `GRAPH_REPORT.md` via `inspect_ast_blast_radius` / `inspect_blast_radius.py` BEFORE `grep` or `read_file` with `StartLine`/`EndLine` 40–80 lines; never read full files `>150` lines blindly), *Zero Redundant Re-Read*, *Parallel Tool Batching*, and *Subagent Context Isolation* (`<=20` line summary return).

This project (`llm-lab`) enforces the **Level-11X Quality & DevSecOps Standard** (stacks: `bash-scripts`).

1. **3-Path Proportional Execution (`DOCS_ONLY` vs. `MICRO_CHANGE` vs. `CODE_CHANGE` / `FULL_11X`):**
   - **`DOCS_ONLY` Fast-Path (ONLY `*.md` / `docs/` changed):** DO NOT run test suites (`run_ephemeral_qa`) and DO NOT rebuild AST graphs (`./scripts/actualizar-grafos-graphify.sh`). Only sync docs/`CHANGELOG.md`, run `certify_11x_gate`, and stage/commit locally (`QA-GIT-GATE-01`: never auto-run `git push`).
   - **`MICRO_CHANGE` Surgical-Path (`<= 3` files, 0 new API/ORM changes, `LOW` AST Blast Radius `< 5` callers):** Use an inline 3-line plan, run `inspect_ast_blast_radius`, execute affected stack `run_ephemeral_qa` in Docker (**Rule Zero**), update stack AST graph, sync `CHANGELOG.md`, run `certify_11x_gate`, and commit locally without automatic `git push`.
   - **`CODE_CHANGE` (`FULL_11X`) Architectural-Path (`> 3` files, new API/UI, ORM migrations, security, or `MED`/`HIGH` Blast Radius):** Execute all 11 steps below inside ephemeral Docker (**Rule Zero** — never run `pytest`, `vitest`, `npm`, `pnpm`, `uv`, or linters on host OS).
2. **Global Corporate Skills & MCP Tools (`@sinfallas/mcp-qa-11x`):** Consume the 5 global skills (`qa-11x-architect`, `qa-11x-docker-certifier`, `docker-trivy-keydb-hardening`, `graphify-ast-navigator`, `refactoring-ui`) without duplicating them in local `.agents/skills/`. Use `inspect_project_config`, `audit_test_pyramid_gaps`, `inspect_ast_blast_radius`, `audit_security_stig_owasp`, `run_ephemeral_qa` (`skip_if_docs_only: true` supported), `certify_11x_gate`, `clean_workspace_11x`, `reconcile_agents_governance`, and `propose_skill_evolution_pr` (on QA-escape bug fixes, proactively include `💡 Oportunidad de Mejora Detectada para el Estándar QA 11X` and invoke `propose_skill_evolution_pr`).
3. **Mandatory 11-Step Execution & Closure Workflow (Non-Negotiable for Architectural Code Changes):**
   - **Step 1 (Plan):** Invoke `/plan` or plan artifact before modifying code.
   - **Step 2 (Active Task):** Track real-time progress (`- [ ]` -> `- [x]`) in `.agents/ACTIVE_TASK.md` (compact `<= 40 lines`).
   - **Step 3 (AST Graph Q&A & Pre-Change):** Query `inspect_ast_blast_radius` (`inspect_blast_radius.py`); if `graphify-out/graph.json` is missing, create it first via `./scripts/actualizar-grafos-graphify.sh`.
   - **Step 4 (Governance & Cleanup):** Sync `AGENTS.md`, `.agents/`, `scripts/limpieza.sh`, and `.gitignore`.
   - **Step 5 (11X Tests + Karate Labs):** Create unit (`>= 95%` coverage), integration, and **Karate Labs BDD (`.feature`)** tests.
   - **Step 6 (Full Suite Execution):** Run all suites in ephemeral Docker (`Rule Zero` / `run_ephemeral_qa`, 0 warnings).
   - **Step 7–9 (Docs, Changelog & Roadmap):** Sync `docs/specs/`, `README.md`, `TESTING.md`, `CHANGELOG.md`, and `ROADMAP.md`.
   - **Step 10 (Post-Change AST Graph):** Run `./scripts/actualizar-grafos-graphify.sh` (incremental per modified stack).
   - **Step 11 (Certify & Local Commit):** Run `certify_11x_gate` and `clean_workspace_11x`, mark `.agents/ACTIVE_TASK.md` `COMPLETED (100%)` (suggest `/compact`), and create a local `git commit` (`QA-GIT-GATE-01`: never auto-run `git push`).
<!-- QA_11X_MCP_CONNECTOR_END -->

## Domain Context — llm-lab

- **Profile-Based Compose Stack:** `docker-compose.yml` + `env.example` (copied to `.env`) orchestrate modular AI/automation profiles (`n8n`, `openwebui`, `hermes`, `opencode`, `omniroute`, `evolutionapi`, `postgres`, `keydb`, `qdrant`, `searxng`, `browserless`, `proxy`, `acp-orchestrator`).
- **Ollama Profile Mutual Exclusion:** `ollama-nvidia`, `ollama-amd`, and `ollama-cpu` share `container_name: ollama`; never combine multiple `ollama-*` profiles or use `--profile "*"` with `docker compose`.
- **Git Gate (`QA-GIT-GATE-01`):** Stop at certified local `git commit` unless the user explicitly instructs a remote `git push` (active development targets `develop`; `main` tracks stable releases).
