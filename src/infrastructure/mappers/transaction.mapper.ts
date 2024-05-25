import Transaction from "src/core/domain/entities/transaction.entity";
import { TransactionEntity } from "../adapters/entity/transaction.entity";

export default class TransactionMapper {
    public static toDomain( transactionEntity: TransactionEntity): Transaction {
        const transaction = new Transaction(
            transactionEntity.amount,
            transactionEntity.description,
            transactionEntity.type,
            transactionEntity.created_at,
        )

        transaction.setCreatedAt(new Date(transactionEntity.created_at))
        return transaction
    }

    public static toDomains(transactions: TransactionEntity[]): Transaction[] {
        return transactions.map((transaction) => TransactionMapper.toDomain(transaction))
    }

    public static toEntity(transaction: Transaction): TransactionEntity {
        const transactionEntity = new TransactionEntity()
        transactionEntity.amount = transaction.amount
        transactionEntity.description = transaction.description
        transactionEntity.type = transaction.type
        transactionEntity.created_at = transaction.created_at
        return transactionEntity
    }
}