import { Maybe, fromNullable } from '@sweet-monads/maybe';
import { curry, get, isEmpty } from 'lodash';

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const getMaybe: (...args: any[]) => Maybe<any> = curry(
  <O>(path: string, object: O) => fromNullable(get(object, path)),
);

/**
 * Checks if an array contains exactly one element.
 *
 * @template A - The type of elements within the array.
 *
 * @param array - The array to check.
 *
 * @returns Returns `true` if the array has exactly one element;
 * returns `false` if the array is empty or contains more than one element.
 *
 * @example
 * isSingle([1]); // Returns: true
 * isSingle([1, 2]); // Returns: false
 * isSingle([]); // Returns: false
 * isSingle(null); // Returns: false
 */
export const isSingle = <A>(array: A[]) =>
  isEmpty(array) ? false : array.length === 1;
