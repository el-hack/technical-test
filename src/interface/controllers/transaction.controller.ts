import { Body, Controller, Get, Param, Post } from "@nestjs/common";
import { TransactionRepositoryTypeOrm } from "src/infrastructure/adapters/repositories/transaction.repository.typeorm";
import CreateTransactionDto from "src/interface/dto/create-transaction.dto";

@Controller('transactions')
export class TransactionController { 
    constructor(private readonly transactionRepository: TransactionRepositoryTypeOrm) { }


    @Post('create')
    async save(@Body() transaction: CreateTransactionDto) {
        return this.transactionRepository.save(transaction);
    }
    
    @Get('all')
    async findAll(){
        return this.transactionRepository.findAll();
    }

    @Get('count')
    async count(){
        return this.transactionRepository.count();
    }

    @Get(':id')
    async findOne(id: number){
        return this.transactionRepository.findOne(id);
    }

    @Get('delete/:id')
    async delete(id: string){
        return this.transactionRepository.delete(id);
    }

    @Get('update/:id')
    async update(@Param('id') id: number, @Body() transaction: any){
        return this.transactionRepository.update(transaction);
    }
}
