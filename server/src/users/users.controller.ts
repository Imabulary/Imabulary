import { Body, Controller, Delete, Post, Req, UseGuards } from '@nestjs/common';
import { Users } from '@prisma/client';
import { AuthGuard } from 'src/guards';
import { CreateUserDTO } from './dto/user.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/')
  create(@Body() createUserDto: CreateUserDTO) {
    return this.usersService.findOneOrCreate(createUserDto);
  }

  @UseGuards(AuthGuard)
  @Delete('/')
  delete(@Req() request: Request) {
    const user: Users = request['user'];
    return this.usersService.delete(user.externalId);
  }
}
