# On part de l'image qui fonctionne (la version verte)
FROM docker.n8n.io/n8nio/n8n:2.1.1

# On passe en root pour avoir les droits d'installation
USER root

# Installation du CLI Claude officiel
RUN npm install -g @anthropic-ai/claude-code

# On repasse sur l'utilisateur par défaut de n8n pour la sécurité
USER node
