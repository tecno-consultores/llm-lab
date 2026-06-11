# crawl4ai

To see the crawl4ai API documentation:

```bash
curl -s http://crawl4ai:11235/openapi.json
```

To execute a request to extract information from a website:

```bash
curl -X POST "http://crawl4ai:11235/crawl" -H "Content-Type: application/json" -H "Authorization: Bearer crawl4ai_token" -d '{"urls": "https://news.ycombinator.com", "extract_strategy": "CosineStrategy", "extraction_args": {"semantic_filter": "technology"}, "bypass_cache": true}'
```

To retrieve the extraction result:

```bash
curl -s -H "Authorization: Bearer $crawl4ai_token" "http://crawl4ai:11235/task/TASK_ID_HERE"
```
