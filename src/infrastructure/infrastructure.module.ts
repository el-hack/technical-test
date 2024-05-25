import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { TransactionEntity } from "./adapters/entity/transaction.entity";
import { TransactionController } from "./controllers/transaction.controller";
import { TransactionRepositoryTypeOrm } from "./adapters/repositories/transaction.repository.typeorm";

@Module({
    controllers: [TransactionController],
    providers: [TransactionRepositoryTypeOrm],
    exports: [],
    imports: [
        TypeOrmModule.forFeature([TransactionEntity]),
    ],
})
export class InfrastructureModule {}
