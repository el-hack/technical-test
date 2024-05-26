import { Inject, Injectable } from "@nestjs/common";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";

@Injectable()
export class DeleteTransactionUseCase {
    constructor(@Inject('TransactionRepository') private readonly transactionRepository: TransactionRepository) { }

    async execute(id: string) {
        return this.transactionRepository.delete(id);
    }
}