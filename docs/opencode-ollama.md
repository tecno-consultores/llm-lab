# opencode - ollama

* Start Olama and download the model you want to use with the Olama Pull command.
* Edit the docker-compose.yml file and look for the line with the comment: OPENCODE_CONFIG_CONTENT and uncomment it
* On the same line look for EXAMPLEMODEL:EXAMPLEb and replace it with the model that you downloaded in Ollama
* On the same line, look for EXAMPLE_NAME and replace it with the name with which you want the connection to appear within opencode
* Now run opencode using the following command:

```bash
docker compose -f docker-compose.yml --env-file env.example --profile opencode up -d
```
