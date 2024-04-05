import vision from '@google-cloud/vision';
import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';
import { get } from 'lodash';
import * as adminAccount from '../../admin-account.json';
import {
  OBJECT_IS_NOT_RECOGNIZABLE_ERROR,
  VISION_GENERIC_ERROR,
} from './utils';

@Injectable()
export class VisionService {
  private visionClient = new vision.ImageAnnotatorClient({
    credentials: adminAccount,
  });

  async analyze(imageUrl: string) {
    const [result] = await this.visionClient.objectLocalization(imageUrl);

    const object = get(result, 'localizedObjectAnnotations[0].name');
    const error = get(result, 'error');

    if (error) {
      throw new InternalServerErrorException(VISION_GENERIC_ERROR, {
        cause: error,
      });
    }

    if (!object) {
      throw new BadRequestException(OBJECT_IS_NOT_RECOGNIZABLE_ERROR, {
        cause: `Image: ${imageUrl}`,
      });
    }

    return object;
  }
}
