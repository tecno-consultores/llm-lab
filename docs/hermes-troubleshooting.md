# Hermes Troubleshooting

* **Session reservation errors (`could not safely reserve this session`):**
  Inspect ownership and permissions inside `/opt/data` and grant least-privilege access to the runtime user rather than `777`:

  ```bash
  docker exec -u 0 hermes chown -R "$(id -u):$(id -g)" /opt/data/
  docker exec -u 0 hermes chmod -R u+rwX,go+rX,go-w /opt/data/
  docker compose -f docker-compose.yml --env-file .env --profile hermes restart hermes
  ```

  *(Adjust the `chown` UID/GID to match the user running inside the `hermes` container if different from your host user.)*

* **`SOUL.md` not loaded:**
  Verify that `/opt/data/SOUL.md` exists inside the `hermes` volume with exact uppercase spelling (`SOUL.md`), is readable by the Hermes process, and then restart the `hermes` container.
