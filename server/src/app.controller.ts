import {
  Controller,
  MaxFileSizeValidator,
  ParseFilePipe,
  Post,
  UploadedFile,
  UseInterceptors,
  UseGuards,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { AppService } from './app.service';
import { ImageCompressPipe, ImageCompressionResult } from './pipes';
import { AuthGuard } from './guards';

const MAX_PROFILE_PICTURE_SIZE_IN_BYTES = 5 * 1024 * 1024; // 5 megabytes

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('upload')
  @UseGuards(AuthGuard)
  @UseInterceptors(FileInterceptor('file'))
  handleImage(
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
    return this.appService.handleImage(fileName, file);
  }
}
