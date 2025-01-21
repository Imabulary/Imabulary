import { Test, TestingModule } from '@nestjs/testing';
import { ProductsService } from '../products.service';
import { ProductsRepository } from '../products.repository';
import { ProductMisconfigurationException } from '../utils';
import { PrismaService } from 'src/prisma';

describe('ProductsService', () => {
  let service: ProductsService;
  let repository: ProductsRepository;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [ProductsService, ProductsRepository, PrismaService],
    }).compile();

    service = module.get<ProductsService>(ProductsService);
    repository = module.get<ProductsRepository>(ProductsRepository);
  });

  describe('findOne', () => {
    it('should throw ProductMisconfigurationException if product was not found by the provided `where` condition', () => {
      repository.findOne = jest.fn().mockResolvedValue(null);

      const where = { internalId: '123' };

      expect(async () => {
        await service.findOne(where);
      }).rejects.toThrow(new ProductMisconfigurationException(where));
    });

    it('should return found product', async () => {
      const productFixture = { internalId: '123' };

      repository.findOne = jest.fn().mockResolvedValue(productFixture);

      const product = await service.findOne(productFixture);

      expect(product).toEqual(productFixture);
    });
  });
});
