import { Module } from '@nestjs/common';
import { AdminUsersService } from './services/admin-users.service';
import { AdminUsersController } from './controller/admin-users.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AdminUser } from 'src/sqlEntity/admin_users.entity';
import { JwtModule } from '@nestjs/jwt';
import { jwtConstants } from 'src/utils/constants/jwt';

@Module({
    imports: [
        TypeOrmModule.forFeature([AdminUser]),
        JwtModule.register({
            global: true,
            secret: jwtConstants.secret,
            signOptions: { expiresIn: '15d' },
        }),
    ],
    providers: [AdminUsersService],
    controllers: [AdminUsersController],
})
export class AdminUsersModule {}
