import { Module } from '@nestjs/common';
import { CacheModule } from '@nestjs/cache-manager';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ThrottlerModule } from '@nestjs/throttler';
import { AppController } from './home/app.controller';
import { AppService } from './home/app.service';
import { ConfigService } from './ConfigService';
import { CoreModule } from './core/core.module';
import { AdminUsersModule } from './admin-users/admin-users.module';

@Module({
    imports: [
        CacheModule.register({
            isGlobal: true,
        }),
        ThrottlerModule.forRoot([
            {
                ttl: 1000, //in milliseconds, we are allowing 50 requests per second only
                limit: 50,
            },
        ]),
        TypeOrmModule.forRoot({
            type: 'mysql',
            host: ConfigService.DB.HOST,
            port: ConfigService.DB.PORT,
            username: ConfigService.DB.USERNAME,
            password: ConfigService.DB.PASSWORD,
            database: ConfigService.DB.NAME,
            entities: [__dirname + '/**/sqlEntity/*{.ts,.js}'],
            synchronize: false,
            logging: true,
        }),
        CoreModule,
        AdminUsersModule,
    ],
    controllers: [AppController],
    providers: [AppService],
})
export class AppModule {}
