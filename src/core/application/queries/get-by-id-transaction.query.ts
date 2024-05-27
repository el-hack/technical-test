import { IQueryHandler, QueryHandler } from "@nestjs/cqrs";
import { GetTransactionByIdUseCase } from "../use-cases/transaction/get-by-id-trancation.usecase";
import Transaction from "src/core/domain/entities/transaction.entity";

export class GetByIdTransactionQuery {
    constructor(public readonly id: number) { }
}

@QueryHandler(GetByIdTransactionQuery)
export class GetByIdTransactionQueryHandler implements IQueryHandler<GetByIdTransactionQuery> {
    constructor(private readonly useCase: GetTransactionByIdUseCase) { }
    execute(query: GetByIdTransactionQuery): Promise<Transaction> {
        return this.useCase.execute(query.id)
    }
}