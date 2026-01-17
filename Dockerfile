# On part d'une image Node officielle (elle a forcément npm et apt-get)
FROM node:20-bullseye

# Installation de n8n en version 2.1.1 et du CLI Claude
RUN npm install -g n8n@2.1.1 @anthropic-ai/claude-cli

# n8n utilise le port 5678 par défaut
EXPOSE 5678

# On lance n8n
CMD ["n8n", "start"]
