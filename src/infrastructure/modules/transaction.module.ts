import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { TransactionController } from "src/interface/controllers/transaction.controller";
import { TransactionRepositoryTypeOrm } from "../adapters/repositories/transaction.repository.typeorm";
import { TransactionEntity } from "../adapters/entity/transaction.entity";
import { CreateTransactionUseCase } from "src/core/application/use-cases/transaction/create-transaction.usecase";
import { GetAllTransactionsUseCase } from "src/core/application/use-cases/transaction/get-all-transactions.use-case";
import { DeleteTransactionUseCase } from "src/core/application/use-cases/transaction/delete-transaction.use-case";
import { UpdateTransactionsUseCase } from "src/core/application/use-cases/transaction/update-transaction.use-case";
import { InjectionToken } from "src/core/application/InjectionToken";
import { CqrsModule } from "@nestjs/cqrs";
import { CreateTransactionCommandHandler } from "src/core/application/commands/execute-create-transaction.command";
import { GetAllTransactionsQueryHandler } from "src/core/application/queries/get-all-transactions.query";
import { UpdateTransactionCommandHandler } from "src/core/application/commands/execute-update-transaction.command";
import { DeleteTransactionCommandHandler } from "src/core/application/commands/execute-delete-transaction.command";
import { GetByIdTransactionQueryHandler } from "src/core/application/queries/get-by-id-transaction.query";
import { GetTransactionByIdUseCase } from "src/core/application/use-cases/transaction/get-by-id-trancation.usecase";

export const CommandHandlers = [CreateTransactionCommandHandler, UpdateTransactionCommandHandler, DeleteTransactionCommandHandler]

export const QueryHandlers = [GetAllTransactionsQueryHandler, GetByIdTransactionQueryHandler]

export const UseCases = [CreateTransactionUseCase, GetAllTransactionsUseCase, DeleteTransactionUseCase, UpdateTransactionsUseCase, GetTransactionByIdUseCase]

@Module({
    controllers: [TransactionController],
    providers: [...CommandHandlers, ...UseCases, ...QueryHandlers, {
        provide: InjectionToken.TRANSACTION_REPOSITORY,
        useClass: TransactionRepositoryTypeOrm
    }],
    exports: [],
    imports: [
        TypeOrmModule.forFeature([TransactionEntity]),
        CqrsModule,
    ],
})
export class TransactionModule { }
