# Image n8n officielle (Debian/Ubuntu)
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Mise à jour et installation de Node.js et du CLI Claude via APT
RUN apt-get update && apt-get install -y nodejs npm && \
    npm install -g @anthropic-ai/claude-cli && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Création des dossiers pour tes deux comptes
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

USER node
