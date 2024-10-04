import { createLogger, format, transports } from 'winston';
const strFormatter = require('string-format'); //eslint-disable-line

function transform(info) {
    const args = info[Symbol.for('splat')];
    if (args) {
        let strFormat = '{} ';
        args.forEach((element, index) => {
            if (element !== undefined) {
                strFormat += '{} ';
                if (element && typeof element === 'object') {
                    args[index] = JSON.stringify(element);
                }
            }
        });
        info['message'] = strFormatter(strFormat, info['message'], ...args);
    }
    return info;
}

function utilFormatter() {
    return { transform };
}
const logObject = {
    level: 'info',
    format: format.combine(
        format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
        utilFormatter(),
        format.printf(
            ({ level, message, label, timestamp }) =>
                `${timestamp} ${label || '-'} [${level}]: ${message}`,
        ),
    ),
    transports: [
        new transports.Console({
            level: 'info',
            format: format.combine(
                format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
                utilFormatter(),
                format.printf(
                    ({ level, message, label, timestamp }) =>
                        `${timestamp} ${label || '-'} [${level}]: ${message}`,
                ),
            ),
        }),
    ],
};
const logger = createLogger(logObject);

export default logger;
