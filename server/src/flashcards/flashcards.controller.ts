import {
  Body,
  Controller,
  Delete,
  Get,
  MaxFileSizeValidator,
  Param,
  ParseFilePipe,
  Post,
  Put,
  Query,
  Req,
  UploadedFile,
  UseGuards,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import type { Users } from '@prisma/client';
import { Request } from 'express';
import { AuthGuard } from 'src/guards';
import { ImageCompressPipe, ImageCompressionResult } from 'src/pipes';
import { PaginationPipe } from 'src/pipes/pagination.pipe';
import { Filters, ServerPagination } from 'src/shared';
import {
  CardDto,
  CreateFlashcardDTO,
  DislikeFlashcardDto,
  DisorganizeFlashcardsDTO,
  OrganizeFlashcardsDTO,
} from './dto';
import { FlashCardsService } from './flashcards.service';

const MAX_PICTURE_SIZE_IN_BYTES = 5 * 1024 * 1024; // 5 megabytes

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
            maxSize: MAX_PICTURE_SIZE_IN_BYTES,
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

  @Post('/:id/dislike')
  async dislike(
    @Req() request: Request,
    @Param('id') flashcardId: string,
    @Body() dislikeFlashcardDto: DislikeFlashcardDto,
  ) {
    const user: Users = request['user'];

    return this.flashCardsService.dislike(
      flashcardId,
      dislikeFlashcardDto,
      user.id,
    );
  }

  @Post('/:id/regenerate')
  regenerate(@Req() request: Request, @Param('id') flashcardId: string) {
    const user = request['user'];

    return this.flashCardsService.regenerate(flashcardId, user.id);
  }

  @Post('/create')
  async create(
    @Req() request: Request,
    @Body() createFlashcardDto: CreateFlashcardDTO,
  ) {
    const user: Users = request['user'];

    return this.flashCardsService.create(createFlashcardDto, user.id);
  }

  @Delete('/delete')
  async delete(@Body() regenerateDto: CardDto) {
    return this.flashCardsService.delete(regenerateDto.cardId);
  }
}
