import {
  BadRequestException,
  InternalServerErrorException,
} from '@nestjs/common';
import { Test, TestingModule } from '@nestjs/testing';
import {
  OBJECT_IS_NOT_RECOGNIZABLE_ERROR,
  VISION_GENERIC_ERROR,
} from '../utils';
import { VisionService } from '../vision.service';

describe('VisionService', () => {
  let service: VisionService;

  const mockVisionClient = (
    localizedObjectAnnotations?: { name: string }[],
    error?: { code: number; message: string },
  ) => {
    Reflect.set(service, 'visionClient', {
      objectLocalization: jest
        .fn()
        .mockResolvedValue([{ localizedObjectAnnotations, error }]),
    });
  };

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [VisionService],
    }).compile();

    service = module.get<VisionService>(VisionService);
  });

  it('should return an object name recognized on the image', async () => {
    mockVisionClient([{ name: 'Apple' }]);

    const object = await service.analyze('https://google.com');

    expect(object).toBe('Apple');
  });

  it('should throw InternalServerErrorException in case an error was returned by the vision client', async () => {
    mockVisionClient(null, { code: 1, message: 'Vision client error' });

    expect(async () => {
      await service.analyze('https://google.com');
    }).rejects.toThrow(new InternalServerErrorException(VISION_GENERIC_ERROR));
  });

  it('should throw BadRequestException in case object on the photo was not recognized', async () => {
    mockVisionClient(null);

    expect(async () => {
      await service.analyze('https://google.com');
    }).rejects.toThrow(
      new BadRequestException(OBJECT_IS_NOT_RECOGNIZABLE_ERROR),
    );
  });
});
