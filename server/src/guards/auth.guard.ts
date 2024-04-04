import {
  CanActivate,
  ExecutionContext,
  Injectable,
  UnauthorizedException,
} from '@nestjs/common';
import admin from 'firebase-admin';
import { UsersService } from '../users';
import { getMaybe } from '../utils';
import {
  UNAUTHORIZED_ERROR_MESSAGE,
  UNDEFINED_TOKEN_ERROR_MESSAGE,
  UNDEFINED_USER_ERROR_MESSAGE,
} from './utils';

@Injectable()
export class AuthGuard implements CanActivate {
  constructor(private readonly users: UsersService) {}

  async canActivate(context: ExecutionContext) {
    try {
      const request = context.switchToHttp().getRequest();
      const token = getMaybe('[0].headers.authorization', context.getArgs())
        .map<string>((token) => token.split(' ')[1])
        .unwrapOr(null);

      if (!token) {
        throw new UnauthorizedException(UNDEFINED_TOKEN_ERROR_MESSAGE);
      }

      const decodedToken = await admin.auth().verifyIdToken(token);
      const externalId = decodedToken.uid;

      const user = await this.users.findOne({ externalId });

      if (!user) {
        throw new UnauthorizedException(
          UNDEFINED_USER_ERROR_MESSAGE.replace(':externalId', externalId),
        );
      }

      request['user'] = user;

      return true;
    } catch (error) {
      throw new UnauthorizedException(UNAUTHORIZED_ERROR_MESSAGE, {
        cause: error,
      });
    }
  }
}
