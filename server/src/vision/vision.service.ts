import vision from '@google-cloud/vision';
import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';
import { get, identity, isEmpty } from 'lodash';
import * as adminAccount from '../../admin-account.json';
import {
  OBJECT_IS_NOT_RECOGNIZABLE_ERROR,
  VISION_GENERIC_ERROR,
} from './utils';
import { fromNullable } from '@sweet-monads/maybe';

@Injectable()
export class VisionService {
  private readonly visionClient = new vision.ImageAnnotatorClient({
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

    if (isEmpty(objects)) {
      throw new BadRequestException(OBJECT_IS_NOT_RECOGNIZABLE_ERROR, {
        cause: `Image: ${imageUrl}`,
      });
    }

    const handledObjects = objects.map((object) => ({
      name: object.description,
      score: fromNullable(Math.round(object.score * 100) / 100)
        .map<number>(identity)
        .unwrapOr(object.score),
    }));

    return handledObjects;
  }
}
