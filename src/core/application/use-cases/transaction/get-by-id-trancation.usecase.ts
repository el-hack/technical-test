import { Inject, Injectable } from "@nestjs/common";
import { InjectionToken } from "../../InjectionToken";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";

@Injectable()
export class GetTransactionByIdUseCase {
    constructor(@Inject(InjectionToken.TRANSACTION_REPOSITORY) private readonly transactionRepository: TransactionRepository) { }

    async execute(id: number) {
        return this.transactionRepository.findOne(id)
    }
}