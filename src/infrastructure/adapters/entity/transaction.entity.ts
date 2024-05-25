import { Column, Entity, EntitySchema, PrimaryGeneratedColumn } from "typeorm";

// create entity for transaction
@Entity()
export class TransactionEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    amount: number;

    @Column()
    description: string;

    @Column()
    type: string;

    @Column()
    created_at: Date;

}