import { Injectable } from "@nestjs/common";
import { TransactionEntity } from "../entity/transaction.entity";
import { InjectRepository } from "@nestjs/typeorm";
import { Repository } from "typeorm";
import TransactionMapper from "src/infrastructure/mappers/transaction.mapper";
import Transaction from "src/core/domain/entities/transaction.entity";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";

@Injectable()
export class TransactionRepositoryTypeOrm implements TransactionRepository {
    constructor(@InjectRepository(TransactionEntity)
    private readonly repository: Repository<TransactionEntity>) {
    }
    public async save(transaction: Transaction): Promise<Transaction> {
        const transactionEntity = TransactionMapper.toEntity(transaction);
        transactionEntity.created_at = new Date();
        const transactionCreated = await this.repository.save(transactionEntity);
        return TransactionMapper.toDomain(transactionCreated);
    }
    public async findOne(id: number): Promise<Transaction | null> {
        console.log(id)
        const transaction = await this.repository.findOne({ where: { id: id } });
        if (!transaction) {
            throw new Error("Transaction not found");
        }
        return transaction ? TransactionMapper.toDomain(transaction) : null
    }
   public async findAll(): Promise<Transaction[]> {
       const transactions = await this.repository.find();
       return TransactionMapper.toDomains(transactions);
    }
    public async delete(id: number): Promise<boolean> {
        console.log(id)
       const transaction = await this.repository.delete(id);
       if (transaction.affected === 0) {
           throw new Error("Transaction not found");
       }
       console.log(`Transaction ${id} deleted`)
       return  true
    }
  public async  update(id: number, transaction: Transaction): Promise<Transaction> {
        const transactionEntity = TransactionMapper.toEntity(transaction);
      await this.repository.update(id, transactionEntity);
      const updatedTransaction = await this.repository.findOne({where: {id: id}});
      return TransactionMapper.toDomain(updatedTransaction);
    }
    count(): Promise<number> {
        throw new Error("Method not implemented.");
    }

}