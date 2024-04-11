import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseGuards,
  Req,
  Query,
} from '@nestjs/common';
import { Request } from 'express';
import { SetsService } from './sets.service';
import { CreateSetDto, UpdateSetDto } from './dto/set.dto';
import { AuthGuard } from 'src/guards';
import { Users } from '@prisma/client';
import { AppService } from 'src/app.service';
import { PaginationPipe } from 'src/pipes';
import { ServerPagination } from 'src/shared';

@Controller('sets')
export class SetsController {
  constructor(
    private readonly setsService: SetsService,
    private readonly appService: AppService,
  ) {}

  @UseGuards(AuthGuard)
  @Post()
  create(@Req() request: Request, @Body() createSetDto: CreateSetDto) {
    const user: Users = request['user'];

    return this.setsService.create(user.id, createSetDto);
  }

  @UseGuards(AuthGuard)
  @Get()
  findAll(
    @Req() request: Request,
    @Query('pagination', PaginationPipe) pagination: ServerPagination,
  ) {
    const user: Users = request['user'];

    return this.appService.findAll('sets', user.id, pagination);
  }

  @UseGuards(AuthGuard)
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.setsService.findOne({ id });
  }

  @UseGuards(AuthGuard)
  @Patch(':id')
  update(
    @Req() request: Request,
    @Param('id') id: string,
    @Body() updateSetDto: UpdateSetDto,
  ) {
    const user: Users = request['user'];

    return this.setsService.update(id, user.id, updateSetDto);
  }

  @UseGuards(AuthGuard)
  @Delete(':id')
  remove(@Req() request: Request, @Param('id') id: string) {
    const user: Users = request['user'];

    return this.setsService.remove(id, user.id);
  }
}
