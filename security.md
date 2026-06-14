# Security Policy

At Tecno Consultores, we prioritize the confidentiality, integrity, and availability of the automation infrastructures deployed through **LLM-Lab**. This policy describes the patch lifecycle and the process for reporting vulnerabilities.

## Supported Versions

Due to the modular nature of this Docker Compose-based ecosystem, security updates are applied continuously on the main branch.

| Version | Receives Security Updates |
| ------- | ------------------------- |
| `main`  | ✅ Yes                    |
| Legacy / Older versions | ❌ No (We recommend migrating to `main`) |

*Important: LLM-Lab orchestrates third-party services (N8N, OpenWebUI, Ollama, Qdrant, RabbitMQ, etc.). It is the infrastructure administrator's responsibility to regularly execute `docker compose pull` to mitigate vulnerabilities inherited from official upstream images.*

## Reporting a Vulnerability

We appreciate the responsible and collaborative disclosure of security flaws (Responsible Disclosure). If you detect critical issues, such as credentials exposed by default in the `env.example` file, network configurations that inadvertently expose sensitive internal ports to the host, or code injection flaws in individual automation scripts:

### Reporting Channels

1. **Via GitHub (Preferred):** Use the native private advisories feature by clicking on the **"Security"** tab of the repository and selecting **"Report a vulnerability"**. This opens a secure and encrypted communication channel directly with the project administrators.
2. **Direct Contact:** If you cannot use the GitHub interface, communicate privately with the Tecno Consultores infrastructure team through the official corporate channels designated for technical support.

**Please DO NOT open a public Issue to report a security vulnerability.** This exposes the community to active exploits before a countermeasure or update can be released in the container images.

### Response Process
Once the report is received:
* We will acknowledge receipt of the advisory within a reasonable timeframe.
* We will work privately in an isolated environment to reproduce and mitigate the attack vector.
* We will publish the corresponding patch directly in the repository accompanied, if applicable, by a Security Advisory.

-------------------------------

To generate a random password on Linux: 

```bash
dd if=/dev/urandom bs=1 count=64 2>/dev/null | base64 -w 0 | tr -dc _A-Z-a-z-0-9 | cut -c 1-32
```

To recreate the secrets files, execute the following:

```bash
echo -n $(dd if=/dev/urandom bs=1 count=64 2>/dev/null | base64 -w 0 | tr -dc _A-Z-a-z-0-9 | cut -c 1-32) > ./secrets/filename.txt 
```
