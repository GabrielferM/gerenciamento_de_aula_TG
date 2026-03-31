import { Controller, Get, Logger } from '@nestjs/common';
import { UsuarioService } from './usuario.service';

@Controller('usuario')
export class UsuarioController {
  private readonly logger = new Logger(UsuarioController.name);

  constructor(private readonly usuarioService: UsuarioService) {}

  @Get('status')
  getStatus() {
    this.logger.log('Status do modulo de usuario consultado');
    return this.usuarioService.getServiceStatus();
  }
}
