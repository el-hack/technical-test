import { Column, Entity, EntitySchema, PrimaryGeneratedColumn } from "typeorm";

// create entity for transaction
@Entity()
export class UserEntity {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column()
    email: string;

    @Column()
    password: string;

    @Column()
    created_at: Date;
}