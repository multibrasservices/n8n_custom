# Étape 1 : Partir de la base n8n officielle
FROM docker.n8n.io/n8nio/n8n:2.1.1

# Étape 2 : Mettre le costume d'admin pour pouvoir installer des choses
USER root

# Étape 3 : Installer l'outil Gemini CLI
RUN npm install -g @google/gemini-cli

# Étape 4 : Mettre à jour les paquets et installer pip avec 'apt' (pas 'apk')
RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Étape 5 : Installer les paquets Python en forçant l'installation dans l'environnement système
RUN pip install --break-system-packages pandas openpyxl

# Étape 6 (TRÈS IMPORTANT) : Remettre le costume de l'utilisateur normal
USER node
