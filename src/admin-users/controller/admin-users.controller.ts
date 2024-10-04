import {
    Body,
    Controller,
    Get,
    Post,
    Request,
    UseGuards,
    ValidationPipe,
} from '@nestjs/common';
import logger from 'src/core/logger';
import {
    AdminUserForgotPasswordRequest,
    AdminUserRegisterRequest,
    AdminUserResetPasswordRequest,
} from '../dto/admin-user.dto';
import { AdminUsersService } from '../services/admin-users.service';
import { AdminUserGuard } from 'src/guards/admin-user.guard';

@Controller('admin-users')
export class AdminUsersController {
    constructor(private adminUsersService: AdminUsersService) {}

    @Post('/register')
    async register(@Body(new ValidationPipe()) body: AdminUserRegisterRequest) {
        try {
            return this.adminUsersService.register(body);
        } catch (e) {
            logger.error('error orrured in register', e);
            throw e;
        }
    }

    @Post('/login')
    async login(@Body(new ValidationPipe()) body: AdminUserRegisterRequest) {
        try {
            return this.adminUsersService.login(body);
        } catch (e) {
            logger.error('error occured in login', e);
            throw e;
        }
    }

    @UseGuards(AdminUserGuard)
    @Get('profile')
    async profile(@Request() req) {
        try {
            return this.adminUsersService.getProfile(req.user);
        } catch (e) {
            logger.error('error occured in get profile', e);
            throw e;
        }
    }

    @Post('/forgot_password')
    async forgotPassword(
        @Body(new ValidationPipe()) body: AdminUserForgotPasswordRequest,
    ) {
        try {
            return this.adminUsersService.forgotPassword(body);
        } catch (e) {
            logger.error('error occured in forgotpassword', e);
            throw e;
        }
    }

    @Post('/reset_password')
    async resetPassword(
        @Body(new ValidationPipe()) body: AdminUserResetPasswordRequest,
    ) {
        try {
            return this.adminUsersService.resetPassword(body);
        } catch (e) {
            logger.error('error occured in forgotpassword', e);
            throw e;
        }
    }
}
