import { Module } from "@nestjs/common";
import { CreateUserUseCase } from "src/core/application/use-cases/user/create-user.use-case";
import UserRepositoryTypeOrm from "../adapters/repositories/user.repository.typeorm";
import { TypeOrmModule } from "@nestjs/typeorm";
import { UserEntity } from "../adapters/entity/user.entity";

@Module({
    imports: [TypeOrmModule.forFeature([UserEntity])],
    controllers: [],
    providers: [
        CreateUserUseCase,
        {
            provide: 'UserRepository',
            useValue: UserRepositoryTypeOrm
        }
    ],
    exports: [CreateUserUseCase],
})
export class UserModule {}