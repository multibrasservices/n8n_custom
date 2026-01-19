# Image n8n avec Puppeteer pour automatiser claude.ai
FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Installation de Chromium et dépendances (Debian)
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    xdg-utils \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Variables d'environnement pour Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Installation de Puppeteer
RUN npm install -g puppeteer-core

# Création du dossier pour les sessions Chrome
RUN mkdir -p /home/node/.claude-browser/session \
    && chown -R node:node /home/node/.claude-browser

USER node
