# Ta version spécifique de n8n
FROM n8nio/n8n:2.1.1

USER root

# Installation de Node, npm et Claude CLI sur la base Alpine
RUN apk update && apk add --no-cache nodejs npm \
    && npm install -g @anthropic-ai/claude-cli

USER node
