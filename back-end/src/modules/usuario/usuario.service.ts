import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../prisma/prisma.service';

@Injectable()
export class UsuarioService {
  constructor(private readonly prisma: PrismaService) {}

  getServiceStatus() {
    return {
      module: 'usuario',
      prismaConnected: this.prisma !== undefined,
    };
  }
}
