# Étape 1 : Partir de la base n8n officielle (basée sur Alpine Linux)
FROM docker.n8n.io/n8nio/n8n:1.106.3
# Étape 2 : Mettre le costume d'admin pour pouvoir installer des choses
USER root

# Étape 3 : Installer l'outil Gemini CLI
RUN npm install -g @google/gemini-cli

# Étape 4 : Mettre à jour les paquets et installer pip avec 'apk'
RUN apk add --no-cache python3-dev py3-pip build-base

# --- DÉBUT DE LA CORRECTION FINALE ---
# Étape 5 : Installer les paquets Python en forçant l'installation dans l'environnement système
RUN pip install --break-system-packages pandas openpyxl
# --- FIN DE LA CORRECTION ---

# Étape 6 (TRÈS IMPORTANT) : Remettre le costume de l'utilisateur normal
USER node
