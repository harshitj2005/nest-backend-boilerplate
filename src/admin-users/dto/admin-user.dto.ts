import {
    IsDefined,
    IsString,
    IsEmail,
    IsStrongPassword,
} from 'class-validator';

export class AdminUserRegisterRequest {
    @IsDefined()
    @IsString()
    @IsEmail()
    email: string;

    @IsDefined()
    @IsString()
    @IsStrongPassword({
        minLength: 6,
        minSymbols: 1,
        minUppercase: 1,
        minNumbers: 1,
    })
    password: string;
}

export class AdminUserResetPasswordRequest {
    @IsDefined()
    @IsString()
    @IsEmail()
    email: string;

    @IsDefined()
    @IsString()
    @IsStrongPassword({
        minLength: 6,
        minSymbols: 1,
        minUppercase: 1,
        minNumbers: 1,
    })
    password: string;

    @IsDefined()
    @IsString()
    @IsStrongPassword({
        minLength: 6,
        minSymbols: 1,
        minUppercase: 1,
        minNumbers: 1,
    })
    confirm_password: string;
}

export class AdminUserForgotPasswordRequest {
    @IsDefined()
    @IsString()
    @IsEmail()
    email: string;
}
