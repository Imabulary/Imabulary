import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

export interface Response<R> {
  result: R;
  meta?: {
    pagination?: {
      total: number;
    };
  };
}

@Injectable()
export class ResponseInterceptor<R> implements NestInterceptor<R, Response<R>> {
  intercept(
    context: ExecutionContext,
    next: CallHandler,
  ): Observable<Response<R>> {
    return next.handle().pipe(
      map((response) =>
        response.result
          ? {
              result: response.result,
              meta: { pagination: { total: response.total } },
            }
          : { result: response },
      ),
    );
  }
}
