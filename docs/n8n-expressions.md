# n8n-expressions

* generic UTC date and time:
```bash
{{ new Date().toISOString() }}
```

* date and time VE:
```bash
{{ new Date().toLocaleString('es-VE') }}
```

* date and time:
```bash
{{ $now }}
```

* date and time in EPOCH format:
```bash
{{ Date.now(); }}
```

* query:
```bash
{{ $json.query }}
```

* from-ai:
```bash
{{ $fromAI("name", "The commenter's name", "string", "Jane Doe") }}
```

* webhook openwebui chat input:
```bash
{{ $json.body.chatInput }}
```

* random number:
```bash
{{parseInt(Math.random()*10000000000000000)}}
```
cker exec -it --user root n8n sh
5) npm install -g example1 example2
