import { isSingle } from '../lodash-extension';

describe('lodash-extension', () => {
  describe('isSingle', () => {
    it('should return false if falsy value was provided or array is empty', () => {
      const result1 = isSingle(null);
      const result2 = isSingle(undefined);
      const result3 = isSingle([]);

      expect(result1).toBe(false);
      expect(result2).toBe(false);
      expect(result3).toBe(false);
    });

    it('should return true if provided array contains 1 item', () => {
      const result1 = isSingle([null]);
      const result2 = isSingle([undefined]);
      const result3 = isSingle(['']);
      const result4 = isSingle([{ test: 'hello world' }]);
      const result5 = isSingle([123]);

      expect(result1).toBe(true);
      expect(result2).toBe(true);
      expect(result3).toBe(true);
      expect(result4).toBe(true);
      expect(result5).toBe(true);
    });

    it('should return false if provided array contains more then 1 item', () => {
      const result = isSingle([
        null,
        undefined,
        '',
        { test: 'hello world' },
        123,
      ]);

      expect(result).toBe(false);
    });
  });
});
