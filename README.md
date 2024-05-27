# API Buicorporation

## Description

Ceci est une API simple pour gérer les transactions en utilisant NestJS, Postgres, et Docker.

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


3. Exécutez l'application à l'aide de Docker :
   ```sh
   docker-compose up --build
   ```

4. L'API sera disponible sur http://localhost:3333.


#### 5. Documentation

- Créer des diagrammes de séquence pour décrire le flux de l'application, notamment pour l'implémentation du CQRS.
- Document your code as you go, explaining the purpose of each module, controller, and service.

### Example Sequence Diagram

```mermaid
sequenceDiagram

   actor User
   participant Controller
   participant CommandBus
   participant CreateTransactionUseCase
   participant CreateTransactionHandler
   participant TransactionRepository

   User -> Controller: POST /transactions
   activate Controller
   Controller -> CommandBus: execute(CreateTransactionCommand)
   activate CommandBus
   CommandBus -> CreateTransactionHandler: execute(CreateTransactionCommand)
   activate CreateTransactionHandler
   CreateTransactionHandler -> CreateTransactionUseCase: execute(CreateTransactionCommand)
   activate CreateTransactionUseCase
   CreateTransactionUseCase -> TransactionRepository: createTransaction()
   activate TransactionRepository
   TransactionRepository --> CreateTransactionUseCase: transaction created
   deactivate TransactionRepository
   CreateTransactionUseCase --> CreateTransactionHandler: transaction created
   deactivate CreateTransactionUseCase
   CreateTransactionHandler --> CommandBus: void
   deactivate CreateTransactionHandler
   CommandBus --> Controller: void
   deactivate CommandBus
   Controller --> User: 201 Created
   deactivate Controller
```

## Diagramme de Séquence pour la Récupération de Toutes les Transactions

```mermaid
sequenceDiagram

   actor User
   participant Controller
   participant QueryBus
   participant GetAllTransactionsQuery
   participant GetAllTransactionsHandler
   participant TransactionRepository

   User -> Controller: GET /transactions
   activate Controller
   Controller -> QueryBus: execute(GetAllTransactionsQuery)
   activate QueryBus
   QueryBus -> GetAllTransactionsHandler: execute(GetAllTransactionsQuery)
   activate GetAllTransactionsHandler
   GetAllTransactionsHandler -> TransactionRepository: findAll()
   activate TransactionRepository
   TransactionRepository --> GetAllTransactionsHandler: transactions found
   deactivate TransactionRepository
   GetAllTransactionsHandler --> QueryBus: transactions found
   deactivate GetAllTransactionsHandler
   QueryBus --> Controller: transactions
   deactivate QueryBus
   Controller --> User: 200 OK
   deactivate Controller
```

## Diagramme de Séquence pour la Mise à Jour d'une Transaction

```mermaid
sequenceDiagram

   actor User
   participant Controller
   participant CommandBus
   participant UpdateTransactionUseCase
   participant UpdateTransactionHandler
   participant TransactionRepository

   User -> Controller: PUT /transactions/:id
   activate Controller
   Controller -> CommandBus: execute(UpdateTransactionCommand)
   activate CommandBus
   CommandBus -> UpdateTransactionHandler: execute(UpdateTransactionCommand)
   activate UpdateTransactionHandler
   UpdateTransactionHandler -> UpdateTransactionUseCase: execute(UpdateTransactionCommand)
   activate UpdateTransactionUseCase
   UpdateTransactionUseCase -> TransactionRepository: updateTransaction()
   activate TransactionRepository
   TransactionRepository --> UpdateTransactionUseCase: transaction updated
   deactivate TransactionRepository
   UpdateTransactionUseCase --> UpdateTransactionHandler: transaction updated
   deactivate UpdateTransactionUseCase
   UpdateTransactionHandler --> CommandBus: void
   deactivate UpdateTransactionHandler
   CommandBus --> Controller: void
   deactivate CommandBus
   Controller --> User: 200 OK
   deactivate Controller
```

## Diagramme de Séquence pour la Suppression d'une Transaction

```mermaid
sequenceDiagram

   actor User
   participant Controller
   participant CommandBus
   participant DeleteTransactionUseCase
   participant DeleteTransactionHandler
   participant TransactionRepository

   User -> Controller: DELETE /transactions/:id
   activate Controller
   Controller -> CommandBus: execute(DeleteTransactionCommand)
   activate CommandBus
   CommandBus -> DeleteTransactionHandler: execute(DeleteTransactionCommand)
   activate DeleteTransactionHandler
   DeleteTransactionHandler -> DeleteTransactionUseCase: execute(DeleteTransactionCommand)
   activate DeleteTransactionUseCase
   DeleteTransactionUseCase -> TransactionRepository: deleteTransaction()
   activate TransactionRepository
   TransactionRepository --> DeleteTransactionUseCase: transaction deleted
   deactivate TransactionRepository
   DeleteTransactionUseCase --> DeleteTransactionHandler: transaction deleted
   deactivate DeleteTransactionUseCase
   DeleteTransactionHandler --> CommandBus: void
   deactivate DeleteTransactionHandler
   CommandBus --> Controller: void
   deactivate CommandBus
   Controller --> User: 204 No Content
   deactivate Controller
```

## Diagramme de Séquence pour la Recherche d'une Transaction par ID

```mermaid
sequenceDiagram

   actor User
   participant Controller
   participant TransactionRepository

   User -> Controller: GET /transactions/:id
   activate Controller
   Controller -> TransactionRepository: findOne(id)
   activate TransactionRepository
   TransactionRepository --> Controller: transaction found
   deactivate TransactionRepository
   Controller --> User: 200 OK
   deactivate Controller
```


## Exemple d'Utilisation

Voici comment vous pouvez utiliser chaque cas d'utilisation dans notre application :


### Créer une Transaction

Pour créer une nouvelle transaction, vous pouvez envoyer une requête POST à l'endpoint /transactions avec les détails de la transaction dans le corps de la requête.

Exemple de requête HTTP :

   ```sh
   POST /transactions
   Content-Type: application/json

   {
   "amount": 100.00,
   "description": "Achat en ligne",
   "date": "2024-05-27"
   }
   ```