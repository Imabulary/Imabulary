import {
  Body,
  Controller,
  Delete,
  Get,
  Put,
  Query,
  Req,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { PaginationPipe } from 'src/pipes/pagination.pipe';
import { Filters, ServerPagination } from 'src/shared';
import { Request } from 'express';
import { FlashCardsService } from './flashcards.service';
import type { Users } from '@prisma/client';
import { DisorganizeFlashcardsDTO, OrganizeFlashcardsDTO } from './dto';

@UseGuards(AuthGuard)
@Controller('flashcards')
export class FlashCardsController {
  constructor(private readonly flashCardsService: FlashCardsService) {}

  @Get('/')
  findAll(
    @Req() request: Request,
    @Query('pagination', PaginationPipe) pagination: ServerPagination,
    @Query('filters') filters: Filters,
  ) {
    const user: Users = request['user'];

    return this.flashCardsService.findAll(user.id, pagination, filters);
  }

  @Put('/organize')
  organize(@Body() organizeFlashcardsDto: OrganizeFlashcardsDTO) {
    return this.flashCardsService.organize(organizeFlashcardsDto);
  }

  @Delete('/disorganize')
  disorganize(@Body() disorganizeFlashcardsDto: DisorganizeFlashcardsDTO) {
    return this.flashCardsService.disorganize(disorganizeFlashcardsDto);
  }
}
