import { Module } from '@nestjs/common';
import { AppController } from './app.controller';

import { UsuarioModule } from './modules/usuario/usuario.module';
import { PrismaModule } from './prisma/prisma.module';

@Module({
  imports: [PrismaModule, UsuarioModule],
  controllers: [AppController],
})
export class AppModule {}
