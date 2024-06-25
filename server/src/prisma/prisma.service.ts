import { Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';
import { createUserMiddleware } from './middlewares/create-user-middleware';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect();

    this.$use((params, next) => createUserMiddleware(params, next, this));
  }
}
