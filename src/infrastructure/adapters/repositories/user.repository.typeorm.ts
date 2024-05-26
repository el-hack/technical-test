import User from "src/core/domain/entities/user.entity";
import { UserRepository } from "src/core/domain/ports/user.repository";

export default class UserRepositoryTypeOrm implements UserRepository {
    findOne(id: number): Promise<User> {
        throw new Error("Method not implemented.");
    }
    findAll(): Promise<User[]> {
        throw new Error("Method not implemented.");
    }
    delete(id: string): Promise<void> {
        throw new Error("Method not implemented.");
    }
    update(user: User): Promise<User> {
        throw new Error("Method not implemented.");
    }
    count(): Promise<number> {
        throw new Error("Method not implemented.");
    }
    save(user: User): Promise<User> {

        return Promise.resolve(user);
    }

}