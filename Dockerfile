# On part de l'image qui fonctionne
FROM docker.n8n.io/n8nio/n8n:2.1.1
USER root
# Installation de util-linux (pour script) et du CLI Claude
RUN apk update && apk add --no-cache util-linux
RUN npm install -g @anthropic-ai/claude-code
# Création des dossiers de session et réglage des permissions
RUN mkdir -p /home/node/.claude/compte1 /home/node/.claude/compte2 && \
    chown -R node:node /home/node/.claude
USER node
