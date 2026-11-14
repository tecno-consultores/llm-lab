# Hermes Agent

Made by: [Tecno Consultores](https://www.tecnoconsultores.net/)

Start the Hermes profile before running interactive CLI commands:

```bash
docker compose -f docker-compose.yml --env-file .env --profile hermes up -d
```

* Run initial setup:

  ```bash
  docker exec -it hermes hermes setup
  ```

* Open the Hermes CLI inside the container:

  ```bash
  docker exec -it hermes hermes
  ```

* Launch Hermes with the terminal dashboard (`--tui`):

  ```bash
  docker exec -it hermes hermes --tui
  ```
