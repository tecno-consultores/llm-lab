# Contributing to LLM-Lab

Thank you for your interest in contributing to **LLM-Lab**! This project, maintained by Tecno Consultores, aims to offer a robust ecosystem using Docker Compose for the integrated deployment of N8N, OpenWeb UI, Qdrant, Ollama, EvolutionAPI, and other key automation and Artificial Intelligence services.

Your help is fundamental for this infrastructure to continue growing and facilitating the automation of production-oriented workflows.

---

## 🚀 How to Get Started



1. **Fork** this repository and clone it to your local machine.
2. **Workspace Environment:** We recommend operating on a stable Linux distribution (such as Ubuntu 24.04 LTS). Make sure you have `docker` and the `docker-compose` plugin installed.
3. **Variable Configuration:** Copy the example file to configure your credentials and base paths:

```bash
   cp env.example .env
```

4. **Starting Services via Profiles:** The project uses Docker Compose profiles (`--profile`) to optimize the use of hardware resources (CPU and GPU). For example, to bring up the basic automation stack and vector database:

```bash
   docker compose --env-file .env --profile n8n --profile n8n-worker --profile qdrant up -d
```

---

## 🛠️ Areas of Contribution

* **Bug Reporting and Fixing:** If a container experiences dependency failures, restart loops, or port collisions (such as conflicts on port `8642` for Hermes Agent or `15672` for RabbitMQ), open an *Issue* detailing the logs of the affected container (`docker logs <container_name>`).
* **Infrastructure Optimization:** Suggestions for improving Docker-oriented internal networks (`networks`), persistent volume storage, or orchestration in high-concurrency environments.
* **Integration of New Profiles:** Templates or optimized configurations for new local models (alternative inference engines like LM-Studio or Ollama optimized for Nvidia/AMD GPUs) and autonomous agents.
* **Documentation:** Corrections in the `README.md`, step-by-step deployment guides, or practical use cases.

---

## 🔄 Networks and Persistence in Production

If you are collaborating on the integration of high-availability webhooks or massive messaging gateways (like EvolutionAPI), keep network configurations in mind. If the deployment environment features upstream load balancing (such as multi-WAN configurations with ECMP and Layer 4 hashing on edge routers), be sure to document whether the service requires strict session persistence or specific reverse proxy configurations (NGINX Proxy Manager).

---

## 📝 Pull Request Lifecycle

1. Create a descriptive branch for your change: `git checkout -b feature/name-of-your-improvement` or `git checkout -b fix/description-of-the-error`.
2. Make clean and atomic changes. Be sure to update the `env.example` file if you introduce new environment variables.
3. Test the complete startup of the modified profile before committing.
4. Submit the *Pull Request* (PR) directed to the main development branch.
5. The maintainers will review the Compose architecture and approve the deployment after validating its stability.

Please review the [Code of Conduct](https://github.com/tecno-consultores/llm-lab/CODE_OF_CONDUCT.md) before submitting your first contribution.
