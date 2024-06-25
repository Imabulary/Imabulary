import { Controller, Get, Req, UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
import { WalletService } from './wallet.service';
import { Users } from '@prisma/client';

@UseGuards(AuthGuard)
@Controller('wallet')
export class WalletController {
  constructor(private readonly walletService: WalletService) {}

  @Get('/')
  balance(@Req() request: Request) {
    const user: Users = request['user'];

    return this.walletService.balance(user.id);
  }
}
