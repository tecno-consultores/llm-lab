# Ollama

1. Start an Ollama profile (`--profile ollama-cpu`, `--profile ollama-nvidia`, or `--profile ollama-amd`).
2. Create a custom model using a `Modelfile` (see [Modelfile.example](./Modelfile.example)):

   ```bash
   docker cp docs/Modelfile.example ollama:/tmp/Modelfile
   docker exec -it ollama ollama create prueba -f /tmp/Modelfile
   ```

## Models Used for Testing

* `qwen3.5:9b`
* `hermes3:8b`
* `gemma4:e2b-it-qat`
* `nomic-embed-text-v2-moe`
* `gemma-4-12B-coder-fable5-composer2.5-v1-GGUF` (from Hugging Face)

Pull a registry model:

```bash
docker exec -it ollama ollama pull gemma4:e2b-it-qat
```

Run a Hugging Face GGUF model:

```bash
docker exec -it ollama ollama run hf.co/yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M
```

## Disable Thinking Output in Interactive Sessions

Inside an `ollama run` prompt session:

```text
/set nothink
/save
```
