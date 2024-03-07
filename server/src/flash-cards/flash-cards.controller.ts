import { Controller, Get, Query } from '@nestjs/common';
import { FlashCardsService } from './flash-cards.service';
import { ServerPagination } from 'src/shared/types';
import { PaginationPipe } from 'src/pipes/pagination.pipe';

@Controller('flash-cards')
export class FlashCardsController {
  constructor(private readonly flashCardsService: FlashCardsService) {}

  @Get('/')
  findAll(@Query('pagination', PaginationPipe) pagination: ServerPagination) {
    return this.flashCardsService.findAll(pagination);
  }
}
