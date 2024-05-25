import { Module } from "@nestjs/common";
import { TypeOrmModule } from "@nestjs/typeorm";
import { TransactionEntity } from "./adapters/entity/transaction.entity";
import { TransactionRepositoryTypeOrm } from "./adapters/repositories/transaction.repository.typeorm";
import { TransactionController } from "src/interface/controllers/transaction.controller";

@Module({
    controllers: [TransactionController],
    providers: [TransactionRepositoryTypeOrm],
    exports: [],
    imports: [
        TypeOrmModule.forFeature([TransactionEntity]),
    ],
})
export class InfrastructureModule {}
