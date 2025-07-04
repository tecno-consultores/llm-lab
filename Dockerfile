FROM n8nio/n8n:latest
ENV PATH="/bin:/usr/local/bin:/root/.local/bin:${PATH}"
USER root

RUN apk add --no-cache curl git build-base chromium bash tar xz util-linux coreutils
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN chmod a+rx /bin/uv /bin/uvx && mkdir -p /data/mcp && chown -R node:node /data/mcp

USER node
ENTRYPOINT ["tini", "--", "node", "/usr/local/bin/n8n"]

