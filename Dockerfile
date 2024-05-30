# Utilisation de l'image Node.js 14 en tant qu'image de base
FROM node:21.6.1-alpine

# Installation de pnpm de manière globale
RUN npm install -g pnpm

# Création d'un répertoire de travail dans le conteneur
WORKDIR /app

# Copie du package.json et du pnpm-lock.yaml dans le répertoire de travail
COPY package.json /app/


# Copie de tout le contenu de l'application dans le répertoire de travail
COPY . /app/

# Installation des dépendances avec pnpm
RUN pnpm install

# Compilation de l'application
RUN pnpm build

# Exposition du port 3000
EXPOSE 3000


# Commande pour démarrer l'application Nest.js
CMD [ "pnpm", "dev" ]