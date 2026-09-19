# hermes mcp examples

## omniroute

```yaml
  omniroute_mcp:
    url: "http://omniroute:20128/api/mcp/stream"
    headers:
      Authorization: "token_here"
```

## proxmox

```yaml
  nandi-proxmox-mcp:
    command: npx
    args:
      - -y
      - nandi-proxmox-mcp
      - run
    env:
      PROXMOX_HOST: 192.168.1.1
      PROXMOX_USER: root
      PROXMOX_REALM: pam
      PROXMOX_TOKEN_NAME: hermes
      PROXMOX_TOKEN_SECRET: token_here
      PROXMOX_SSH_HOST: 192.168.1.1
      PROXMOX_SSH_USER: root
      PROXMOX_SSH_KEY_PATH: /opt/data/.ssh/proxmox_key
      PROXMOX_ALLOW_INSECURE_TLS: 'true'
      PVE_ACCESS_TIER: full
```
