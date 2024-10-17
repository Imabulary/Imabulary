import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { Prisma, Users } from '@prisma/client';
import { Request } from 'express';
import { AuthGuard } from 'src/guards';
import { PaginationPipe } from 'src/pipes';
import { Filters, ServerPagination } from 'src/shared';
import { CreateSetDto, UpdateSetDto } from './dto/set.dto';
import { SetsService } from './sets.service';

@UseGuards(AuthGuard)
@Controller('sets')
export class SetsController {
  constructor(private readonly setsService: SetsService) {}

  @Post()
  create(@Req() request: Request, @Body() createSetDto: CreateSetDto) {
    const user: Users = request['user'];

    return this.setsService.create(user.id, createSetDto);
  }

  @Get()
  findAll(
    @Req() request: Request,
    @Query('pagination', PaginationPipe) pagination: ServerPagination,
    @Query('filters') filters: Filters<Prisma.CardsWhereInput>,
  ) {
    const user: Users = request['user'];

    return this.setsService.findAll(user.id, pagination, filters);
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.setsService.findOne({ id });
  }

  @Patch(':id')
  update(
    @Req() request: Request,
    @Param('id') id: string,
    @Body() updateSetDto: UpdateSetDto,
  ) {
    const user: Users = request['user'];

    return this.setsService.update(id, user.id, updateSetDto);
  }

  @Delete(':id')
  remove(@Req() request: Request, @Param('id') id: string) {
    const user: Users = request['user'];

    return this.setsService.remove(id, user.id);
  }
}
