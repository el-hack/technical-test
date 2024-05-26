import internal from "stream"

export default class User{
     id?: number
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

   public generateNewId() {
        return Math.random().toString(36).substring(2, 9)
    }
}

export interface UserPayload {
    name: string
    email: string
    password: string
}