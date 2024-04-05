import {
  Controller,
  MaxFileSizeValidator,
  ParseFilePipe,
  Post,
  UploadedFile,
  UseInterceptors,
  UseGuards,
  Req,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { Request } from 'express';
import { AppService } from './app.service';
import { ImageCompressPipe, ImageCompressionResult } from './pipes';
import { AuthGuard } from './guards';
import { Users } from '@prisma/client';

const MAX_PROFILE_PICTURE_SIZE_IN_BYTES = 5 * 1024 * 1024; // 5 megabytes

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('upload')
  @UseGuards(AuthGuard)
  @UseInterceptors(FileInterceptor('file'))
  handleImage(
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

    return this.appService.handleImage(user.id, fileName, file);
  }
}
