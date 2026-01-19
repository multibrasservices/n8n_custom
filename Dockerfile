# Image n8n avec Puppeteer pour automatiser claude.ai
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Installation de Chromium et dépendances
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Variables d'environnement pour Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Installation de Puppeteer
RUN npm install -g puppeteer-core

# Création du dossier pour les sessions Chrome
RUN mkdir -p /home/node/.claude-browser/session \
    && chown -R node:node /home/node/.claude-browser

USER node
