# Bui client



## Table des matières

- [Introduction](#introduction)
- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du Projet](#structure-du-projet)
- [Déploiement avec Docker](#déploiement-avec-docker)

## Introduction

`Bui client` est une application web développée avec Next.js, un framework React pour les applications web modernes. Elle utilise Docker pour faciliter le déploiement et la gestion des dépendances.

## Fonctionnalités

- Créer une transaction
- Modifier une transaction
- Supprimer une transaction
- Recupérer la liste des toutes les transaction

## Prérequis

Avant de commencer, assurez-vous d'avoir déjà lancer les APIs qui se trouve sur la branch el-hack-api


## Installation

1. Clonez le dépôt :
   ```sh
   git clone https://github.com/el-hack/technical-test.git
   cd technical-test
   ```


2. Se mettre sur la branch de l'API :
   ```sh
   git switch el-hack-api
   ```


2. Copier le contenue de .env.exemple pour le mettre dans un fichier .en :
   ```sh
   git switch el-hack-api
   ```


## Utilisation

Pour lancer l'application en utilisant Docker Compose :
```bash
docker-compose up --build
```

Le client sera disponible sur http://localhost:3000.