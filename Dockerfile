FROM docker.n8n.io/n8nio/n8n:2.1.1

USER root

# Playwright installe ses propres dépendances et navigateur
RUN npx playwright install chromium --with-deps

ENV PLAYWRIGHT_BROWSERS_PATH=/root/.cache/ms-playwright

# Création du dossier pour les sessions
RUN mkdir -p /home/node/.claude-browser/session \
    && chown -R node:node /home/node/.claude-browser

USER node
