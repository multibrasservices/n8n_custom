# On utilise la version stable d'n8n (basée sur Alpine)
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Installation de Node.js, npm et du CLI Claude via apk (Base Alpine)
RUN apk update && apk add --no-cache \
    nodejs \
    npm \
    && npm install -g @anthropic-ai/claude-cli

# Création des répertoires pour séparer les sessions des deux comptes Claude
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

# On repasse sur l'utilisateur node pour la sécurité
USER node
