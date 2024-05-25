export default class Transaction {
    private id?: number;
    readonly amount: number;
    readonly description: string;
    readonly type: string;
    created_at?: Date;
    constructor(
        amount: number,
        description: string,
        type: string,
        created_at?: Date,
        id?: number,
    ) {
        this.id = id;
        this.amount = amount;
        this.description = description;
        this.type = type;
        this.created_at = created_at;
    }

    public getId(): number | undefined {
        return this.id
    }

    public getAmount(): number {
        return this.amount
    }

    public setCreatedAt(createdAt: Date): void {
        this.created_at = createdAt
    }
}

// create interface for transaction
