import { BadRequestException, PipeTransform } from '@nestjs/common';
import { subtract, toNumber } from 'lodash';
import { ClientPagination, ServerPagination } from 'src/shared/types';
import { getMaybe } from 'src/utils';

export class PaginationPipe
  implements PipeTransform<ClientPagination, ServerPagination>
{
  transform(value: ClientPagination) {
    const page = getMaybe('page', value)
      .map(toNumber)
      .map((page) => subtract(page, 1))
      .map((page) => (page <= 0 ? 0 : page))
      .unwrapOr(0);

    const limit = getMaybe('limit', value)
      .map(toNumber)
      .map((limit) => (limit <= 0 ? 0 : limit))
      .unwrapOr(100);

    if (limit > 100) {
      throw new BadRequestException(
        'Limit value exceeded. It cannot be greater than 100',
      );
    }

    return {
      take: limit,
      skip: page * limit,
    };
  }
}
