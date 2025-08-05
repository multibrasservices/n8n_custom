# Partir de l'image n8n officielle
FROM docker.n8n.io/n8nio/n8n:1.97.1

# Passer en root pour installer
USER root

# Installer Gemini CLI
RUN npm install -g @google/gemini-cli

# TRÈS IMPORTANT : Repasser à l'utilisateur par défaut
USER node
