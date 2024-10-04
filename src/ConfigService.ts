import { config } from 'dotenv';
config();

export class ConfigService {
    public static readonly DB = {
        NAME: process.env.MYSQL_DB_NAME,
        HOST: process.env.MYSQL_HOSTNAME,
        PORT: parseInt(process.env.MYSQL_PORT) || 3306,
        DIALECT: process.env.DIALECT || 'mysql',
        USERNAME: process.env.MYSQL_USERNAME,
        PASSWORD: process.env.MYSQL_PASSWORD,
    };
    public static readonly PORT = process.env.PORT || 5000;
    public static readonly NODE_ENV = process.env.NODE_ENV || 'development';
    public static readonly ENV = process.env.NODE_ENV || 'development';
}
