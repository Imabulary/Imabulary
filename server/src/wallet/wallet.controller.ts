import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { Users } from '@prisma/client';
import { AuthGuard } from 'src/guards';
import { WalletService } from './wallet.service';

@UseGuards(AuthGuard)
@Controller('wallet')
export class WalletController {
  constructor(private readonly walletService: WalletService) {}

  // LINK server/openapi/paths/wallet/wallet.yaml
  @Get('/')
  wallet(@Req() request: Request) {
    const user: Users = request['user'];

    return this.walletService.findOneAndValidate(user.id);
  }
}
