FROM docker.n8n.io/n8nio/n8n:1.97.1
USER root
RUN npm install -g @google/gemini-cli
USER node
