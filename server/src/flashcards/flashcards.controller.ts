import {
  Body,
  Controller,
  Delete,
  Get,
  MaxFileSizeValidator,
  ParseFilePipe,
  Post,
  Put,
  Query,
  Req,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { PaginationPipe } from 'src/pipes/pagination.pipe';
import { Filters, ServerPagination } from 'src/shared';
import { Request } from 'express';
import { FlashCardsService } from './flashcards.service';
import type { Users } from '@prisma/client';
import { DisorganizeFlashcardsDTO, OrganizeFlashcardsDTO } from './dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { ImageCompressPipe, ImageCompressionResult } from 'src/pipes';

const MAX_PROFILE_PICTURE_SIZE_IN_BYTES = 5 * 1024 * 1024; // 5 megabytes

@UseGuards(AuthGuard)
@Controller('flashcards')
export class FlashCardsController {
  constructor(private readonly flashCardsService: FlashCardsService) {}

  @Post('scan')
  @UseInterceptors(FileInterceptor('file'))
  scan(
    @Req() request: Request,
    @UploadedFile(
      new ParseFilePipe({
        validators: [
          new MaxFileSizeValidator({
            maxSize: MAX_PROFILE_PICTURE_SIZE_IN_BYTES,
          }),
        ],
      }),
      ImageCompressPipe,
    )
    { file, fileName }: ImageCompressionResult,
  ) {
    const user: Users = request['user'];

    return this.flashCardsService.scan(user.id, fileName, file);
  }

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
