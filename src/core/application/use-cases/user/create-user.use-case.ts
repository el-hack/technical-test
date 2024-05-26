import { Inject, Injectable } from "@nestjs/common";
import User, { UserPayload } from "src/core/domain/entities/user.entity";
import { UserRepository } from "src/core/domain/ports/user.repository";

@Injectable()
export class CreateUserUseCase {
    constructor(@Inject('UserRepository') private readonly userRepository :UserRepository) { }

    execute(payload: UserPayload): User {
        const user = new User(payload.email, payload.name, payload.password)
        this.userRepository.save(user)
        return user
    } 

}