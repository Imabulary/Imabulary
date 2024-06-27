import { Awards } from '@prisma/client';
import { MILLISECONDS_IN_HOUR } from './constants';

export function checkAwardAvailability({
  award,
  currentTime,
  pointer,
}: {
  award: Awards;
  currentTime: string;
  pointer: number;
}): boolean {
  const { lastAwardedAt } = award;
  const timeDifference =
    new Date(currentTime).getTime() - new Date(lastAwardedAt).getTime();
  const hoursDifference = timeDifference / MILLISECONDS_IN_HOUR;

  return hoursDifference >= pointer;
}
