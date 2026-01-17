# On garde ta version stable
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root
# On installe les outils pour Claude
RUN apk add --no-cache nodejs npm && \
    npm install -g @anthropic-ai/claude-cli

# On crée deux dossiers séparés pour tes deux comptes Claude
# Cela permet d'éviter que les sessions ne s'emmêlent
RUN mkdir -p /home/node/claude_compte_1 /home/node/claude_compte_2 && \
    chown -R node:node /home/node/claude_compte_1 /home/node/claude_compte_2

USER node
