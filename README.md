# Buicorporation's take-home test for Full Stack Engineer

Our stack is essentially based on Dart, Typescript, Postgres for the database and Redis for the cache.
The architecture used is DDH (Domain Driven Hexagonal).

## API

For the API, you'll use the NestJS framework

### Nestjs Structure    

```
.
├── core/
│   ├── application
│   └── domain
├── infrastructure
└── interface
```

### Docker

You need to dockerize the project, by creating these two files `Dockerfile` and `docker-compose.yml`

### Expected Endpoint

You are expected to implement at least one endpoint, `/transactions` that accepts HTTP `POST`, `GET`, `PUT` and `DELETE` requests from the client. You are free to choose the body and headers of that endpoint.

### README File

You need to update `README` file with instructions on how to use your program. Think of it as scratchboard. 
You are highly encouraged to discuss your approach, mention pitfalls you have seen but not fixed, alternative approaches that you may have discarded and for what reason.

### Documentation

Sequence diagrams are encouraged to describe your chosen approach, other than that you are welcomed to document your code as you would have done under normal circumstances.

### Configuration

Replace `NestJS` express to fastify and configure `compression`

### Approach

The use of `CQRS` is a plus in this exercise

## Client

## Mobile

### Flutter Structure

```
.
├── core/
│   ├── application
│   └── domain
├── infrastructure
└── interface
```
