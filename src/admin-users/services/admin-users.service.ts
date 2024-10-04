import {
    BadRequestException,
    Injectable,
    UnauthorizedException,
} from '@nestjs/common';
import * as bcrypt from 'bcrypt';
import { JwtService } from '@nestjs/jwt';
import { cryptoConstants } from 'src/utils/constants/crypto';
import { AdminUser } from 'src/sqlEntity/admin_users.entity';
import logger from 'src/core/logger';

const saltOrRounds = cryptoConstants.saltOrRounds;

@Injectable()
export class AdminUsersService {
    constructor(private jwtService: JwtService) {}

    async register(body: { email: string; password: string }) {
        const existingUser = await AdminUser.findOne({
            where: {
                email: body.email,
            },
        });
        if (!existingUser) {
            const newUser = new AdminUser();
            newUser.email = body.email;
            newUser.password = await bcrypt.hash(body.password, saltOrRounds);
            await this.signUserAndSave(newUser);
            return newUser;
        } else {
            throw new BadRequestException('user already exists');
        }
    }

    async login(body: { email: string; password: string }) {
        const user = await AdminUser.findOne({
            where: {
                email: body.email,
            },
        });
        if (user) {
            logger.info('user', user);
            const isMatch = await bcrypt.compare(body.password, user.password);
            if (isMatch) {
                await this.signUserAndSave(user);
                return user;
            } else {
                throw new UnauthorizedException('wrong password');
            }
        } else {
            throw new UnauthorizedException('user email not exists');
        }
    }

    async getProfile(userObject: any) {
        return await AdminUser.findOne({
            where: {
                email: userObject.email,
            },
        });
    }

    async forgotPassword(body: { email: string }) {
        const userModel = await AdminUser.findOne({
            where: {
                email: body.email,
            },
        });
        if (userModel) {
            //logic to send email or otp
            return 'you can reset your password';
        } else {
            throw new BadRequestException('invalid email id');
        }
    }

    async resetPassword(body: {
        email: string;
        password: string;
        confirm_password: string;
    }) {
        if (body.password !== body.confirm_password) {
            throw new BadRequestException('password mismatch');
        }
        const userModel = await AdminUser.findOne({
            where: {
                email: body.email,
            },
        });
        if (userModel) {
            userModel.password = await bcrypt.hash(body.password, saltOrRounds);
            return this.signUserAndSave(userModel);
        } else {
            throw new BadRequestException('invalid email id');
        }
    }

    private async signUserAndSave(userModel: AdminUser) {
        userModel.last_login = new Date();
        const payload = { sub: userModel.id, email: userModel.email };
        userModel.token = await this.jwtService.signAsync(payload);
        return userModel.save();
    }
}
