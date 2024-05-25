import { NestFactory } from '@nestjs/core';
import compression from '@fastify/compress';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';


async function bootstrap() {
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter(),)
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
  await app.register(compression);
  await app.listen(process.env.PORT, '0.0.0.0');
}
bootstrap();
