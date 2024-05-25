import { TypeOrmModuleOptions } from '@nestjs/typeorm';
import Transaction from 'src/core/domain/entities/transaction.entity';
import { ConfigService } from '@nestjs/config';
export const typeOrmConfig = (configService: ConfigService): TypeOrmModuleOptions => ({
    type: 'postgres',
    host: configService.get('POSTGRES_HOST'),
    port: configService.get<number>('POSTGRES_PORT'),
    username: configService.get('POSTGRES_USER'),
    password: configService.get('POSTGRES_PASSWORD'),
    database: configService.get('POSTGRES_DB'),
    autoLoadEntities: true,
    synchronize: true,
});