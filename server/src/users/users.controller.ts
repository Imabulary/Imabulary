import {
  Body,
  Controller,
  Delete,
  Get,
  Patch,
  Post,
  Req,
  UseGuards,
} from '@nestjs/common';
import { Users } from '@prisma/client';
import { AuthGuard } from 'src/guards';
import { CreateUserDTO, UpdateUserDTO } from './dto/user.dto';
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

  @UseGuards(AuthGuard)
  @Patch()
  update(@Req() request: Request, @Body() updateUserDto: UpdateUserDTO) {
    const user: Users = request['user'];

    return this.usersService.update(user.id, updateUserDto);
  }

  @UseGuards(AuthGuard)
  @Get('/subscription')
  findSubscription(@Req() request: Request) {
    const user: Users = request['user'];

    return this.usersService.findSubscription(user.id);
  }
}
