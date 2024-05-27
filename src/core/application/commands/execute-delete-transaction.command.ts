import { CommandHandler, ICommand, ICommandHandler } from "@nestjs/cqrs"
import { DeleteTransactionUseCase } from "../use-cases/transaction/delete-transaction.use-case"

export class DeleteTransactionCommand implements ICommand {
    public id: number
    constructor(id: number) {
        this.id = id
    }
}

@CommandHandler(DeleteTransactionCommand)
export class DeleteTransactionCommandHandler implements ICommandHandler<DeleteTransactionCommand> {
    constructor(private readonly useCase: DeleteTransactionUseCase) { }
    async execute(command: DeleteTransactionCommand) {
        return this.useCase.execute(command.id)
    }
}