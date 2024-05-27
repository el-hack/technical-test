import { Column, Entity, EntitySchema, Generated, PrimaryGeneratedColumn } from "typeorm";

// create entity for transaction
@Entity()
export class TransactionEntity {
    @PrimaryGeneratedColumn('increment')
    id: number;

    @Column()
    amount: number;

    @Column()
    status: string;

    @Column()
    description: string;

    @Column()
    type: string;

    @Column()
    created_at: Date;

}