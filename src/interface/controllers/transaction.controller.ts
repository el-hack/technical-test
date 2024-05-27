import { Body, Controller, Delete, Get, Param, Patch, Post } from "@nestjs/common";
import { CommandBus, QueryBus } from "@nestjs/cqrs";
import { CreateTransactionCommand } from "src/core/application/commands/execute-create-transaction.command";
import { DeleteTransactionCommand } from "src/core/application/commands/execute-delete-transaction.command";
import { UpdateTransactionCommand } from "src/core/application/commands/execute-update-transaction.command";
import { GetAllTransactionsQuery } from "src/core/application/queries/get-all-transactions.query";
import { GetByIdTransactionQuery } from "src/core/application/queries/get-by-id-transaction.query";
import { CreateTransactionUseCase } from "src/core/application/use-cases/transaction/create-transaction.usecase";
import { DeleteTransactionUseCase } from "src/core/application/use-cases/transaction/delete-transaction.use-case";
import { GetAllTransactionsUseCase } from "src/core/application/use-cases/transaction/get-all-transactions.use-case";
import { UpdateTransactionsUseCase } from "src/core/application/use-cases/transaction/update-transaction.use-case";
import { TransactionRepository } from "src/core/domain/ports/transaction.repository";
import CreateTransactionDto from "src/interface/dto/create-transaction.dto";

@Controller('transactions')
export class TransactionController {
    constructor(private readonly commandBus: CommandBus, private readonly queryBus: QueryBus) { }


    @Post('create')
    async save(@Body() transaction: CreateTransactionDto) {
        const command = new CreateTransactionCommand(transaction.status, transaction.description, transaction.amount, transaction.type)
        return this.commandBus.execute(command);
    }

    @Get('all')
    async findAll() {
        const query = new GetAllTransactionsQuery()
        return this.queryBus.execute(query);
    }

    // @Get('count')
    // async count(){
    //     return this.transactionRepository.count();
    // }

    @Get('show/:id')
    async findOne(@Param('id') id: number) {
        const query = new GetByIdTransactionQuery(id)
        return this.queryBus.execute(query);
    }

    @Delete('delete/:id')
    async delete(@Param('id') id: number) {
        console.log(id)
        const command = new DeleteTransactionCommand(id)
        return this.commandBus.execute(command);
    }

    @Patch('update/:id')
    async update(@Param('id') id: number, @Body() transaction: any) {
        const command = new UpdateTransactionCommand(id, transaction.status, transaction.description, transaction.amount, transaction.type)
        return this.commandBus.execute(command);
    }
}
