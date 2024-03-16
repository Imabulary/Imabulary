import { Test, TestingModule } from '@nestjs/testing';
import { VisionController } from '../vision.controller';
import { VisionService } from '../vision.service';

describe('VisionController', () => {
  let controller: VisionController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [VisionController],
      providers: [VisionService],
    }).compile();

    controller = module.get<VisionController>(VisionController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
