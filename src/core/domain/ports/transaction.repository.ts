import Transaction from "../entities/transaction.entity";

export interface TransactionRepository {
    save(transaction: Transaction): Promise<Transaction>;

    findOne(id: number): Promise<Transaction | null>;

    findAll(): Promise<Transaction[]>

    delete(id: number): Promise<boolean>

    update(id: number, transaction: Transaction): Promise<Transaction>

    count(): Promise<number>
}
 