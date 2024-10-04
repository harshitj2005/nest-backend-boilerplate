import { Logger, QueryRunner, AdvancedConsoleLogger } from 'typeorm';
import logger from './logger';

type LoggerOptions =
    | boolean
    | 'all'
    | ('query' | 'schema' | 'error' | 'warn' | 'info' | 'log' | 'migration')[];
const paramLimit = 100;
const queryLimit = 100;

export class MySqlLogger extends AdvancedConsoleLogger implements Logger {
    constructor(options?: LoggerOptions) {
        super(options);
    }

    logQuery(query: string, parameters?: any[], queryRunner?: QueryRunner) {
        let logText = query;
        const paramTextEllipsis = parameters?.map((param) => {
            //only cut off string and length longer than 100
            if (typeof param === 'string' && param.length > paramLimit) {
                return param.substring(0, paramLimit) + '...';
            }
            return param;
        });
        if (logText.length > queryLimit)
            // Truncate the log text if it's too long:
            logText = logText.substring(0, queryLimit) + '...';
        super.logQuery(logText, paramTextEllipsis, queryRunner);
    }

    /**
     * Perform logging using given logger, or by default to the console.
     * Log has its own level and message.
     */
    log(
        level: 'log' | 'info' | 'warn' | 'query' | 'schema',
        message: any,
        queryRunner?: QueryRunner,
    ) {
        switch (level) {
            case 'log':
                logger.verbose(message);
                break;
            case 'info':
                logger.info(message);
                break;
            case 'warn':
                logger.warn(message);
                break;
            case 'query':
                logger.verbose(message);
                break;
            case 'schema':
                logger.verbose(message);
                break;
        }
    }
}
