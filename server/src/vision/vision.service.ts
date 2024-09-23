import vision from '@google-cloud/vision';
import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';
import { get, upperFirst } from 'lodash';
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
    const [result] = await this.visionClient.labelDetection(imageUrl);

    const objects = get(result, 'labelAnnotations');
    const error = get(result, 'error');

    if (error) {
      throw new InternalServerErrorException(VISION_GENERIC_ERROR, {
        cause: error,
      });
    }

    if (!objects.length) {
      throw new BadRequestException(OBJECT_IS_NOT_RECOGNIZABLE_ERROR, {
        cause: `Image: ${imageUrl}`,
      });
    }

    const handledObjects = objects.map((object) => ({
      name: object.description,
      score: object.score,
    }));

    if (objects.length > 1) {
      return handledObjects;
    }

    const signleObjectName = objects[0].description;

    return upperFirst(signleObjectName);
  }
}
