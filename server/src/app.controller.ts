import {
  Controller,
  Post,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { AppService } from './app.service';
import { ImageCompressPipe, ImageCompressionResult } from './pipes';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Post('upload')
  @UseInterceptors(FileInterceptor('file'))
  upload(
    @UploadedFile(ImageCompressPipe) { file, fileName }: ImageCompressionResult,
  ) {
    return this.appService.uploadToExternalStorage(fileName, file);
  }
}
