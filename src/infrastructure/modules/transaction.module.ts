import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { TransactionController } from "src/interface/controllers/transaction.controller";
import { TransactionRepositoryTypeOrm } from "../adapters/repositories/transaction.repository.typeorm";
import { TransactionEntity } from "../adapters/entity/transaction.entity";
import { CreateTransactionUseCase } from "src/core/application/use-cases/transaction/create-transaction.usecase";
import { GetTransactionsUseCase } from "src/core/application/use-cases/transaction/get-transactions.use-case";

@Module({
    controllers: [TransactionController],
    providers: [TransactionRepositoryTypeOrm],
    exports: [],
    imports: [
        TypeOrmModule.forFeature([TransactionEntity]),
    ],
})
export class TransactionModule { }
