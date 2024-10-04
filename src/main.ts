import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import logger from './core/logger';
import { ConfigService } from './ConfigService';

async function bootstrap() {
    const app = await NestFactory.create(AppModule);
    // Starts listening for shutdown hooks
    app.enableShutdownHooks();

    await app.listen(ConfigService.PORT);
    logger.info(`3D Spool Service Started Running ON ${ConfigService.PORT}`);
}
bootstrap();
