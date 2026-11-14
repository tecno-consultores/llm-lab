# Hermes MCP Examples

Example MCP server blocks for Hermes Agent configuration. Replace placeholder tokens and adjust network permissions before using in production.

## OmniRoute

Ensure `--profile omniroute` is running on the same Docker network:

```yaml
  omniroute_mcp:
    url: "http://omniroute:20128/api/mcp/stream"
    headers:
      Authorization: "Bearer YOUR_OMNIROUTE_TOKEN"
```

## Proxmox

> [!NOTE]
> For production clusters, create a dedicated least-privilege Proxmox API token and verify TLS certificates (`PROXMOX_ALLOW_INSECURE_TLS: 'false'`) instead of using `root@pam` with `PVE_ACCESS_TIER: full`.

```yaml
  nandi-proxmox-mcp:
    command: npx
    args:
      - -y
      - nandi-proxmox-mcp
      - run
    env:
      PROXMOX_HOST: 192.168.1.1
      PROXMOX_USER: hermes-mcp
      PROXMOX_REALM: pve
      PROXMOX_TOKEN_NAME: hermes
      PROXMOX_TOKEN_SECRET: token_here
      PROXMOX_SSH_HOST: 192.168.1.1
      PROXMOX_SSH_USER: hermes-mcp
      PROXMOX_SSH_KEY_PATH: /opt/data/.ssh/proxmox_key
      PROXMOX_ALLOW_INSECURE_TLS: 'false'
      PVE_ACCESS_TIER: read-only
```
