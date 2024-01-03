import { Injectable, PipeTransform } from '@nestjs/common';
import * as sharp from 'sharp';

@Injectable()
export class ImageCompressPipe
  implements PipeTransform<Express.Multer.File, Promise<Buffer>>
{
  async transform(image: Express.Multer.File) {
    const file = await sharp(image.buffer)
      .resize(800)
      .jpeg({ progressive: true, quality: 80 })
      .webp({ effort: 3, quality: 80 })
      .toBuffer();

    return file;
  }
}
