export default class User{
    private id?: number
    readonly name: string
    readonly email: string
    readonly password: string
    readonly created_at?: Date
    constructor(
        name: string,
        email: string,
        password: string,
        created_at?: Date,
        id?: number,
    ) {
        this.id = id
        this.name = name
        this.email = email
        this.password = password
        this.created_at = created_at
    }
}