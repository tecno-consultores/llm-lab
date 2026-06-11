# hermes-agent

Made by: [Tecno Consultores 2023](https://www.tecnoconsultores.net/)

To run hermes initial setup, run

```bash
docker exec -it hermes hermes setup
```

To run Hermes from the terminal inside the container, run

```bash
docker exec -it hermes hermes
```

And to run Hermes with the dashboard for terminal

```bash
docker exec -it hermes hermes --tui
```

------

To use OpenWebUI as UI for hermes:

* Open Open WebUI in your browser.
* Go to ⚙️ Admin Settings → Connections → OpenAI.
* Click ➕ Add Connection.
* Enter the following:
  + URL	http://hermes-ip:8642/v1
  + API Key: the apikey in the env.example file

------

To connect hermes with ollama run:

```bash
docker exec -it hermes hermes model
```

select **Custom endpoint** and put the following url: **http://ollama:11434/v1** When prompted for the apikey, leave it blank.


