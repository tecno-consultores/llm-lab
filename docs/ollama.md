# ollama

to create model:

```bash
ollama create prueba -f Modelfile
```

This is a list of the models used for testing

* qwen3.5:9b
* hermes3:8b
* gemma4:e2b-it-qat
* nomic-embed-text-v2-moe
* gemma-4-12B-coder-fable5-composer2.5-v1-GGUF (from huggingface)

```bash
ollama pull gemma4:e2b-it-qat
```

+ To download from huggingface:

```bash
ollama run hf.co/yuxinlu1/gemma-4-12B-coder-fable5-composer2.5-v1-GGUF:Q4_K_M
```

to deactivate the thought inside ollama:

```bash
/set nothink
/save
```
