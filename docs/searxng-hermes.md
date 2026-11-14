# SearXNG + Hermes

Start `--profile searxng` alongside `--profile hermes`. Inside the Docker network, SearXNG listens on port `8080` (`8189` is the commented host-side port). To perform a JSON search query against SearXNG:

```bash
curl -G "http://searxng:8080/search" \
  --data-urlencode "q=TEXT_TO_SEARCH" \
  --data-urlencode "format=json"
```
