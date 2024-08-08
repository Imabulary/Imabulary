import { Controller, Get, Put, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { WalletService } from './wallet.service';
import { Users } from '@prisma/client';

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

  @Put('/collect')
  collectAward(@Req() request: Request) {
    const user: Users = request['user'];

    return this.walletService.collectAward(user.id);
  }
}
