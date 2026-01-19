# Image Playwright (basée sur Ubuntu avec Chromium pré-installé)
FROM mcr.microsoft.com/playwright:v1.52.0-noble

# Installation de Node.js 20 et n8n
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g n8n@2.1.1 puppeteer-core && \
    rm -rf /var/lib/apt/lists/*

# Variables d'environnement pour Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/ms-playwright/chromium-1173/chrome-linux/chrome

# Créer l'utilisateur node
RUN useradd -m -s /bin/bash node

# Création du dossier pour les sessions Chrome
RUN mkdir -p /home/node/.claude-browser/session \
    && chown -R node:node /home/node/.claude-browser \
    && chown -R node:node /home/node

# Dossier de travail n8n
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n

USER node
WORKDIR /home/node

# Exposer le port n8n
EXPOSE 5678

# Lancer n8n
CMD ["n8n", "start"]
