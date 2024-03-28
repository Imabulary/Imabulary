import { Injectable, PipeTransform } from '@nestjs/common';
import * as path from 'path';
import * as sharp from 'sharp';

export type ImageCompressionResult = { fileName: string; file: Buffer };

@Injectable()
export class ImageCompressPipe
  implements
    PipeTransform<Express.Multer.File, Promise<ImageCompressionResult>>
{
  async transform(image: Express.Multer.File) {
    const originalName = path.parse(image.originalname).name;
    const extension = path.extname(image.originalname);
    const fileName = Date.now() + '-' + originalName + extension;

    const file = await sharp(image.buffer)
      .resize(800)
      .png({ quality: 80, effort: 3 })
      .jpeg({ progressive: true, quality: 80 })
      .webp({ effort: 3, quality: 80 })
      .toBuffer();

    return { file, fileName };
  }
}
