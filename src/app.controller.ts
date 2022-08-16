import { Controller, Get, Param, Render } from '@nestjs/common';

@Controller()
export class AppController {
  @Get()
  @Render('index')
  public async index() {
    const vars = Object.keys(process.env);

    return { vars };
  }

  @Get('var/:var')
  @Render('var')
  public async show(@Param('var') variable: string) {
    const envVar = process.env[variable];

    return { variable, value: envVar };
  }
}
