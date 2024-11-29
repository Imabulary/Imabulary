import { BadRequestException } from '@nestjs/common';
import { PaginationPipe } from '../pagination.pipe';
import { ClientPagination, ServerPagination } from 'src/shared/types';

describe('PaginationPipe', () => {
  let pipe: PaginationPipe;

  beforeEach(() => {
    pipe = new PaginationPipe();
  });

  it('should return default values when no pagination is provided', () => {
    const result = pipe.transform({});
    expect(result).toEqual<ServerPagination>({ take: 100, skip: 0 });
  });

  it('should correctly handle zero values for page and limit', () => {
    const pagination: ClientPagination = { page: 0, limit: 0 };
    const result = pipe.transform(pagination);
    expect(result).toEqual<ServerPagination>({ take: 0, skip: 0 });
  });

  it('should transform valid page and limit values correctly', () => {
    const pagination: ClientPagination = { page: 2, limit: 20 };
    const result = pipe.transform(pagination);
    expect(result).toEqual<ServerPagination>({ take: 20, skip: 20 });
  });

  it('should throw an error if limit exceeds 100', () => {
    const pagination: ClientPagination = { page: 1, limit: 200 };
    expect(() => pipe.transform(pagination)).toThrow(BadRequestException);
  });

  it('should handle non-numeric page and limit values', () => {
    const pagination: ClientPagination = {
      page: '10' as any,
      limit: '10' as any,
    };

    const result = pipe.transform(pagination);

    expect(result).toEqual<ServerPagination>({ take: 10, skip: 90 });
  });

  it('should default to 0 for negative page values', () => {
    const pagination: ClientPagination = { page: -3, limit: 20 };
    const result = pipe.transform(pagination);
    expect(result).toEqual<ServerPagination>({ take: 20, skip: 0 });
  });

  it('should default to 0 for negative limit values', () => {
    const pagination: ClientPagination = { page: 2, limit: -5 };
    const result = pipe.transform(pagination);
    expect(result).toEqual<ServerPagination>({ take: 0, skip: 0 });
  });
});
