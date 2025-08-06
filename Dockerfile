# Étape 1 : Partir de la base n8n officielle (basée sur Alpine Linux)
FROM docker.n8n.io/n8nio/n8n:1.97.1

# Étape 2 : Mettre le costume d'admin pour pouvoir installer des choses
USER root

# Étape 3 : Installer l'outil Gemini CLI
RUN npm install -g @google/gemini-cli

# --- DÉBUT DE LA CORRECTION FINALE POUR PYTHON ---
# Étape 4 : Mettre à jour les paquets et installer pip avec 'apk', le gestionnaire d'Alpine
# 'apk add' est l'équivalent de 'apt-get install'
# '--no-cache' est une bonne pratique pour garder l'image légère
RUN apk add --no-cache python3-dev py3-pip build-base

# Étape 5 : Maintenant que pip est là, installer les outils Python pour Excel
RUN pip install pandas openpyxl
# --- FIN DE LA CORRECTION ---

# Étape 6 (TRÈS IMPORTANT) : Remettre le costume de l'utilisateur normal
USER node
