import { ServerPagination } from 'src/shared';
import { SetsFilters } from '../dto/set.dto';

export type SetsFindAllArgs = {
  pagination: ServerPagination;
  filters?: SetsFilters;
};
