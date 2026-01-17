# On utilise la version stable d'n8n
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Installation de Node.js et du CLI Claude via apt-get (Base Debian/Ubuntu)
RUN apt-get update && apt-get install -y \
    nodejs \
    npm \
    && npm install -g @anthropic-ai/claude-cli \
    && rm -rf /var/lib/apt/lists/*

# Création des répertoires pour séparer les sessions des deux comptes Claude
# Cela évite les conflits de cookies/sessions entre le compte 1 et le compte 2
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

# On repasse sur l'utilisateur node pour la sécurité
USER node
