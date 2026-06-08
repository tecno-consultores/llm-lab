# Security Policy[cite: 7]

At Tecno Consultores, we prioritize the confidentiality, integrity, and availability of the automation infrastructures deployed through **LLM-Lab**.[cite: 7] This policy describes the patch lifecycle and the process for reporting vulnerabilities.[cite: 7]

## Supported Versions[cite: 7]

Due to the modular nature of this Docker Compose-based ecosystem, security updates are applied continuously on the main branch.[cite: 7]

| Version | Receives Security Updates |
| ------- | ------------------------- |
| `main`  | ✅ Yes                    |
| Legacy / Older versions | ❌ No (We recommend migrating to `main`) |

*Important: LLM-Lab orchestrates third-party services (N8N, OpenWebUI, Ollama, Qdrant, RabbitMQ, etc.).[cite: 7] It is the infrastructure administrator's responsibility to regularly execute `docker compose pull` to mitigate vulnerabilities inherited from official upstream images.*[cite: 7]

## Reporting a Vulnerability[cite: 7]

We appreciate the responsible and collaborative disclosure of security flaws (Responsible Disclosure).[cite: 7] If you detect critical issues, such as credentials exposed by default in the `env.example` file, network configurations that inadvertently expose sensitive internal ports to the host, or code injection flaws in individual automation scripts:[cite: 7]

### Reporting Channels[cite: 7]

1. **Via GitHub (Preferred):** Use the native private advisories feature by clicking on the **"Security"** tab of the repository and selecting **"Report a vulnerability"**.[cite: 7] This opens a secure and encrypted communication channel directly with the project administrators.[cite: 7]
2. **Direct Contact:** If you cannot use the GitHub interface, communicate privately with the Tecno Consultores infrastructure team through the official corporate channels designated for technical support.[cite: 7]

**Please DO NOT open a public Issue to report a security vulnerability.**[cite: 7] This exposes the community to active exploits before a countermeasure or update can be released in the container images.[cite: 7]

### Response Process[cite: 7]
Once the report is received:[cite: 7]
* We will acknowledge receipt of the advisory within a reasonable timeframe.[cite: 7]
* We will work privately in an isolated environment to reproduce and mitigate the attack vector.[cite: 7]
* We will publish the corresponding patch directly in the repository accompanied, if applicable, by a Security Advisory.[cite: 7]
