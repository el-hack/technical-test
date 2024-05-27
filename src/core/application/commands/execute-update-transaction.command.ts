import { CommandHandler, ICommand, ICommandHandler } from "@nestjs/cqrs"
import { UpdateTransactionsUseCase } from "../use-cases/transaction/update-transaction.use-case"
import Transaction from "src/core/domain/entities/transaction.entity"

export class UpdateTransactionCommand implements ICommand {
    public id: number
    public status: string
    public description: string
    public amount: number
    public type: string

    constructor(id: number, status: string, description: string, amount: number, type: string) {
        this.id = id
        this.status = status
        this.description = description
        this.amount = amount
        this.type = type
    }
}


@CommandHandler(UpdateTransactionCommand)
export class UpdateTransactionCommandHandler implements ICommandHandler<UpdateTransactionCommand> {
    constructor(private readonly useCase: UpdateTransactionsUseCase) { }
    async execute(command: UpdateTransactionCommand) {
        const transaction = new Transaction(command.amount, command.description, command.type, command.status)
        return this.useCase.execute(command.id, transaction)
    }
}