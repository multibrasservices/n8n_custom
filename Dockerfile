# Étape 1 : Partir de la base n8n officielle
FROM docker.n8n.io/n8nio/n8n:1.97.1

# Étape 2 : Mettre le costume d'admin pour pouvoir installer des choses
USER root

# Étape 3 : Installer l'outil Gemini CLI
RUN npm install -g @google/gemini-cli

# --- DÉBUT DE LA CORRECTION POUR PYTHON ---
# Étape 4 : Mettre à jour les paquets et installer pip
# 'apt-get update' rafraîchit la liste des paquets disponibles
# 'apt-get install -y python3-pip' installe pip sans poser de question
RUN apt-get update && apt-get install -y python3-pip

# Étape 5 : Maintenant que pip est là, installer les outils Python pour Excel
RUN pip install pandas openpyxl
# --- FIN DE LA CORRECTION ---

# Étape 6 (TRÈS IMPORTANT) : Remettre le costume de l'utilisateur normal
USER node
