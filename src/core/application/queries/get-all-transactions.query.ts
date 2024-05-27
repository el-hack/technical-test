import { IQueryHandler, QueryHandler } from "@nestjs/cqrs";
import Transaction from "src/core/domain/entities/transaction.entity";
import { GetAllTransactionsUseCase } from "../use-cases/transaction/get-all-transactions.use-case";

export class GetAllTransactionsQuery {
    constructor() { }
}

@QueryHandler(GetAllTransactionsQuery)
export class GetAllTransactionsQueryHandler implements IQueryHandler<GetAllTransactionsQuery> {
    constructor(private readonly useCase: GetAllTransactionsUseCase) { }

    async execute(query: GetAllTransactionsQuery): Promise<Transaction[]> {
        return await this.useCase.execute()
    }
}