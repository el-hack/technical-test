import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { InfrastructureModule } from './infrastructure/infrastructure.module';
@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: 'localhost',
      port: 5432,
      username: 'root',
      password: 'root',
      database: 'test',
      // entities: [],
      synchronize: true,
      autoLoadEntities: true,
    }),
    InfrastructureModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
