import { Inject } from "@nestjs/common"
import { CommandHandler, ICommand, ICommandHandler } from "@nestjs/cqrs"
import { TransactionRepository } from "src/core/domain/ports/transaction.repository"
import { InjectionToken } from "../InjectionToken"
import Transaction from "src/core/domain/entities/transaction.entity"
import { CreateTransactionUseCase } from "../use-cases/transaction/create-transaction.usecase"

export class CreateTransactionCommand implements ICommand {
    public status: string
    public description: string
    public amount: number
    public type: string


    constructor(status: string, description: string, amount: number, type: string) {
        this.status = status
        this.description = description
        this.amount = amount
        this.type = type
    }
}

@CommandHandler(CreateTransactionCommand)
export class CreateTransactionCommandHandler implements ICommandHandler<CreateTransactionCommand> {
    constructor(private readonly useCase: CreateTransactionUseCase) { }
    async execute(command: CreateTransactionCommand) {
        const transaction = new Transaction(command.amount, command.description, command.type, command.status)
        return this.useCase.execute(transaction)
    }
}