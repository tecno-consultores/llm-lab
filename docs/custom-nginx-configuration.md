# Custom NGINX Configuration (N8N Streaming & WebSockets)

Add this location block in **NGINX Proxy Manager** (or a custom NGINX server block) when proxying `N8N` with streaming responses and WebSocket push updates (`N8N_PUSH_BACKEND="websocket"`):

```nginx
location / {
   proxy_pass http://n8n:5678;
   proxy_http_version 1.1;
   proxy_set_header Upgrade $http_upgrade;
   proxy_set_header Connection "upgrade";
   proxy_set_header Host $host;
   proxy_set_header X-Real-IP $remote_addr;
   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
   proxy_set_header X-Forwarded-Proto $scheme;
   chunked_transfer_encoding off;
   proxy_buffering off;
   proxy_cache off;
}
```
