import {
    CallHandler,
    ExecutionContext,
    Injectable,
    NestInterceptor,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

// eslint-disable-next-line @typescript-eslint/no-unused-vars
export interface Response<T> {
    statusCode: number;
    message: string;
    data: any;
}

@Injectable()
export class TransformInterceptor<T>
    implements NestInterceptor<T, Response<T>>
{
    intercept(
        context: ExecutionContext,
        next: CallHandler<T>,
    ): Observable<Response<T>> {
        return next.handle().pipe(
            map((data: any) => ({
                statusCode: context.switchToHttp().getResponse().statusCode,
                responseCode: context.switchToHttp().getResponse().statusCode,
                message: (data && data.message) || '',
                data: data && data.data ? data.data : data || {},
            })),
        );
    }
}
