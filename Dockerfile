# Étape 1 de la recette : Partir de la base n8n officielle
FROM docker.n8n.io/n8nio/n8n:1.97.1

# Étape 2 : Mettre le costume d'admin pour pouvoir installer des choses
USER root

# Étape 3 : Installer l'outil Gemini CLI
RUN npm install -g @google/gemini-cli

# Étape 4 : Installer les outils Python pour Excel
RUN pip install pandas openpyxl

# Étape 5 (TRÈS IMPORTANT) : Remettre le costume de l'utilisateur normal
# pour que les workflows soient accessibles
USER node
