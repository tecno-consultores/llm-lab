# crawl4ai

* para iniciar la tarea:

```bash
curl -i -X POST http://crawl4ai:11235/crawl -H "Authorization: Bearer TOKEN" -H "Content-Type: application/json" -d '{"urls": ["https://example.com"]}'
```

* para obtener el resultado:

```bash
curl -i -X GET http://crawl4ai:11235/task/el-id-que-recibiste H "Authorization: Bearer TOKEN"
```
