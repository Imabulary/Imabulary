import { Controller, Get, Query, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { PaginationPipe } from 'src/pipes/pagination.pipe';
import { ServerPagination } from 'src/shared/types';
import { Request } from 'express';
import { FlashCardsService } from './flash-cards.service';

@Controller('flash-cards')
export class FlashCardsController {
  constructor(private readonly flashCardsService: FlashCardsService) {}

  @Get('/')
  @UseGuards(AuthGuard)
  findAll(
    @Req() request: Request,
    @Query('pagination', PaginationPipe) pagination: ServerPagination,
  ) {
    return this.flashCardsService.findAll(pagination);
  }
}
