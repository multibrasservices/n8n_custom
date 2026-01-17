# On force l'utilisation de la version basée sur Debian pour avoir accès à apt-get
FROM docker.n8n.io/n8nio/n8n:2.1.1-debian

USER root

# Maintenant apt-get va fonctionner
RUN apt-get update && apt-get install -y \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @anthropic-ai/claude-cli \
    && rm -rf /var/lib/apt/lists/*

# Création des répertoires pour les sessions Claude
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

USER node
