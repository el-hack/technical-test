import { Inject, Injectable } from "@nestjs/common";
import Transaction from "src/core/domain/entities/transaction.entity";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";
import { InjectionToken } from "../../InjectionToken";

@Injectable()
export class UpdateTransactionsUseCase {
    constructor(@Inject(InjectionToken.TRANSACTION_REPOSITORY) private readonly transactionRepository: TransactionRepository) { }

    async execute(id: number, transaction: Transaction) {
        return this.transactionRepository.update(id, transaction);
    }
}