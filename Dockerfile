# On garde TA version 2.1.1 mais sur une base Debian pour avoir apt-get
FROM n8nio/n8n:2.1.1

USER root

# Installation des outils nécessaires
RUN apt-get update && apt-get install -y \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g @anthropic-ai/claude-cli \
    && rm -rf /var/lib/apt/lists/*

# Création des dossiers pour tes deux comptes Claude
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

USER node
