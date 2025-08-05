# 1. Partir de l'image n8n officielle que vous utilisez
FROM docker.n8n.io/n8nio/n8n:1.97.1

# --- AJOUT IMPORTANT ---
# Indiquer que le conteneur écoute sur le port 5678
EXPOSE 5678
# ---------------------

# 2. Passer temporairement en utilisateur root pour avoir les permissions d'installer
USER root

# 3. Lancer la commande d'installation de Gemini CLI
RUN npm install -g @google/gemini-cli

# 4. TRÈS IMPORTANT : Repasser à l'utilisateur 'node' par défaut pour que n8n retrouve ses données
USER node
