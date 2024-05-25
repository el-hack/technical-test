import Transaction from "../transaction";

export interface TransactionRepository {
    save(transaction: Transaction): Promise<Transaction>;

    findOne(id: number): Promise<Transaction | null>;

    findAll(): Promise<Transaction[]>

    delete(id: string): Promise<void>

    update(transaction: Transaction): Promise<Transaction>

    count(): Promise<number>
}
