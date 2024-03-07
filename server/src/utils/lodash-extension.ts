import { Maybe, fromNullable } from '@sweet-monads/maybe';
import { curry, get } from 'lodash';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const getMaybe: (...args: any[]) => Maybe<any> = curry(
  <O>(path: string, object: O) => fromNullable(get(object, path)),
);
