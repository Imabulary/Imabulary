import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma';

@Injectable()
export class PackagesService {
  constructor(private readonly prisma: PrismaService) {}

  findAll() {
    return this.prisma.packages.findMany();
  }
}
