import User from "../entities/user.entity";

export interface UserRepository {
    save(user: User): Promise<User>;    
    findOne(id: number): Promise<User | null>;
    findAll(): Promise<User[]>;
    delete(id: string): Promise<void>;
    update(user: User): Promise<User>;
    count(): Promise<number>;
}

export interface IJwtServicePayload {
    email: string;
}

export interface IJwtService {
    checkToken(token: string): Promise<any>;
    createToken(payload: IJwtServicePayload, secret: string, expiresIn: string): string;
}