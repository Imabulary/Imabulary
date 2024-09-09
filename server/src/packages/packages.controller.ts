import { Controller, Get, UseGuards } from '@nestjs/common';
import { PackagesService } from './packages.service';
import { AuthGuard } from 'src/guards';

@UseGuards(AuthGuard)
@Controller('packages')
export class PackagesController {
  constructor(private readonly packagesService: PackagesService) {}

  @Get('/')
  findAll() {
    return this.packagesService.findAll();
  }
}
