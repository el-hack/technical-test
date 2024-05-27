import { Inject, Injectable } from "@nestjs/common";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";
import { InjectionToken } from "../../InjectionToken";

@Injectable()
export class DeleteTransactionUseCase {
    constructor(@Inject(InjectionToken.TRANSACTION_REPOSITORY) private readonly transactionRepository: TransactionRepository) { }

    async execute(id: number) {
        return this.transactionRepository.delete(id);
    }
}