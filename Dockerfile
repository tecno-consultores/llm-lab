FROM n8nio/n8n:latest
ENV PATH="/bin:/usr/local/bin:/root/.local/bin:${PATH}"
USER root

RUN apk add --no-cache curl python3

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN chmod a+rx /bin/uv /bin/uvx && mkdir -p /data/mcp && chown -R node:node /data/mcp

RUN npm install -g @modelcontextprotocol/server-postgres

USER node
RUN /bin/uv venv /home/node/venv
ENV VIRTUAL_ENV=/home/node/venv
ENV PATH="/home/node/venv/bin:/home/node/.local/bin:$PATH"

ENTRYPOINT ["tini", "--", "node", "/usr/local/bin/n8n"]

