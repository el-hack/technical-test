# buimobile
# NomDuProjet

Une brève description de votre projet Flutter.

## Table des matières

- [Introduction](#introduction)
- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Structure du Projet](#structure-du-projet)

## Introduction

`NomDuProjet` est une application mobile développée en Flutter. Elle permet de [décrire ce que fait l'application].

## Fonctionnalités

- Créer une transaction
- Modifier une transaction
- Supprimer une transaction
- Recupérer la liste des toutes les transaction

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Un éditeur de code (VS Code, IntelliJ, Android Studio, etc.)

## Installation

1. Clonez le dépôt :

    ```bash
    git clone https://github.com/el-hack/technical-test.git
    ```

2. Accédez au répertoire du projet :

    ```bash
    cd nom-du-repo
    ```

3. Switcher sur la branch concerné :

    ```bash
    git switch el-hack-mobile
    ```

3. Installez les dépendances :

    ```bash
    flutter pub get
    ```

## Utilisation

Pour exécuter l'application sur un simulateur ou un appareil connecté :

```bash
flutter run
```


## Structure du Projet

```bash
lib/
├── constant/
│   ├── color_constant.dart
│   └── string_constant.dart
├── core/
│   ├── application/
│   │   ├── blocs/
│   │   │   └── transaction/
│   │   │       ├── transaction_bloc.dart
│   │   │       ├── transaction_event.dart
│   │   │       └── transaction_state.dart
│   │   └── service_locator.dart
│   └── domain/
│       ├── entities/
│       │   └── transaction.dart
│       ├── repositories/
│       │   └── transaction_repository.dart
│       └── usecases/
│           ├── create_transaction.dart
│           ├── delete_transaction.dart
│           ├── get_transaction.dart
│           └── update_transaction.dart
├── infrastructure/
│   ├── pages/
│   └── widgets/
│       ├── data/
│       ├── domain/
│       └── presentation/
├── injection_container.dart
├──  main.dart
└──  theme.dart

```
