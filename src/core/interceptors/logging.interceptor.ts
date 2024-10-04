import {
    CallHandler,
    ExecutionContext,
    Injectable,
    NestInterceptor,
} from '@nestjs/common';
import { Observable } from 'rxjs';
// import { tap } from 'rxjs/operators';
import logger from '../logger';

@Injectable()
export class LoggingInterceptor implements NestInterceptor {
    intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
        const startAt = process.hrtime();
        const request = context.switchToHttp().getRequest();
        const response = context.switchToHttp().getResponse();
        logger.info(
            `Request: ${request.method}:${request.url}, body:${JSON.stringify(
                request.body,
            )}`,
        );
        response.on('close', () => {
            const diff = process.hrtime(startAt);
            const responseTime = Math.round(diff[0] * 1e3 + diff[1] * 1e-6);
            logger.info(
                `Response: ${request.method}:${request.url}, ${response.statusCode}, ${responseTime} ms`,
            );
        });
        return next.handle();
        // .pipe(
        //     tap(() =>
        //         logger.info(
        //             `Response: ${request.method}:${request.url}, ${response.statusCode},  ms`,
        //         ),
        //     ),
        // );
    }
}
