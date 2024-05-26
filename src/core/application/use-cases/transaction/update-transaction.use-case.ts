import { Inject, Injectable } from "@nestjs/common";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";

@Injectable()
export class UpdateTransactionsUseCase {
    constructor(@Inject('TransactionRepository') private readonly transactionRepository: TransactionRepository) { }

    async execute(transaction: any) {
        return this.transactionRepository.update(transaction);
    }
}