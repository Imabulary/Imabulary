import { randomUUID } from 'crypto';

export const formatFileName = (fileName: string) => {
  return `${randomUUID}_${fileName}`;
};
