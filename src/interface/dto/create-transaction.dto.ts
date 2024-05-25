import { IsNotEmpty } from "class-validator";
import Transaction from "src/core/domain/entities/transaction.entity";

export default class CreateTransactionDto extends Transaction{
    @IsNotEmpty()
    amount: number;

    @IsNotEmpty()
    description: string;
    
    @IsNotEmpty()
    type: string;
}