import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig } from './infrastructure/database/typeorm.config';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TransactionModule } from './infrastructure/modules/transaction.module';
@Module({
  imports: [
    ConfigModule.forRoot({isGlobal: true,}),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => typeOrmConfig(configService),
      inject: [ConfigService],
    }),
    TransactionModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
