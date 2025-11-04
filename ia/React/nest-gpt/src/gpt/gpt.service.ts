import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import OpenAI from 'openai';
import { orthographyCheckUseCase } from './use-cases';
import { OrthographyDto, ProsConsDiscusserDto } from './dtos';
import { prosConsDicusserUseCase } from './use-cases/pros-cons-dicusser.use-case';
import { prosConsDicusserStreamUseCase } from './use-cases/pros-cons-stream.use-case';


@Injectable()
export class GptService {
  // private openai: OpenAI;

  // constructor(private readonly configService: ConfigService) {
  //   const apiKey = this.configService.get<string>('OPENAI_API_KEY');

  //   if (!apiKey) {
  //     throw new Error('❌ OPENAI_API_KEY no está definida en el archivo .env');
  //   }

  //   this.openai = new OpenAI({ apiKey });
  // }

  private openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY,
  })

  async orthographyCheck(orthographyDto: OrthographyDto) {
    return await orthographyCheckUseCase(this.openai, {
      prompt: orthographyDto.prompt,
    });
  }

  async prosConsDicusser({ prompt }: ProsConsDiscusserDto) {
    return await prosConsDicusserUseCase(this.openai, { prompt });
  }

   async prosConsDicusserStream({ prompt }: ProsConsDiscusserDto) {
    return await prosConsDicusserStreamUseCase(this.openai, { prompt });
  }
}
