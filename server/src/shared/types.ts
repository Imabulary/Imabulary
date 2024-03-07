export type ClientPagination = {
  page?: number;
  limit?: number;
};

export type ServerPagination = {
  skip: number;
  take: number;
};
