## Summary

Describe what changed and why.

## Affected Profiles / Files

- Profile(s): <!-- e.g. n8n, openwebui, hermes, docs-only -->
- Target branch: `develop`

## Verification Checklist

- [ ] Validated modified Compose profiles (`docker compose -f docker-compose.yml --env-file env.example --profile <name> config -q`).
- [ ] Confirmed no `.env`, private keys, or real secrets (`./secrets/*.txt`) are included in the diff.
- [ ] Updated `README.md` and `docs/` if ports, URLs, environment variables, or service dependencies changed.
- [ ] Added an entry under `[Unreleased]` in `CHANGELOG.md`.
