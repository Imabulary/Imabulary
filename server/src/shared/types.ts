export type ClientPagination = {
  page?: number;
  limit?: number;
};

export type ServerPagination = {
  skip: number;
  take: number;
};

export type Filters<
  S = Record<string, unknown>,
  E = Record<string, unknown>,
> = {
  [key: string]: {
    equals: string;
    some: S;
    every: E;
  };
};
