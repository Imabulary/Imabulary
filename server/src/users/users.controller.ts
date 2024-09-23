import { Body, Controller, Post } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDTO } from './dto/user.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('/')
  create(@Body() createUserDto: CreateUserDTO) {
    return this.usersService.findOneOrCreate(createUserDto);
  }
}
