# API Buicorporation

## Description

Ceci est une API simple pour gérer les transactions en utilisant NestJS, Postgres, et Docker.

## Installation

1. Clonez le dépôt :
   ```sh
   git clone <repository-url>
   cd buicorporation-api

2. Run the application using Docker:
   ```sh
   docker-compose up --build

3. The API will be available at http://localhost:3000.


#### 5. Documentation

- Create sequence diagrams to describe the flow of the application, especially for the CQRS implementation.
- Document your code as you go, explaining the purpose of each module, controller, and service.

### Example Sequence Diagram

```mermaid
sequenceDiagram

    participant Client
    participant API
    participant Service
    participant Database

    Client->>API: POST /transactions
    API->>Service: Create Transaction
    Service->>Database: Insert Transaction
    Database-->>Service: Transaction Created
    Service-->>API: Transaction Created
    API-->>Client: 201 Created
