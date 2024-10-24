import { Body, Controller, Delete, Post, Req } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDTO } from './dto/user.dto';
import { Users } from '@prisma/client';
import { UseGuards } from '@nestjs/common';
import { AuthGuard } from 'src/guards';
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
