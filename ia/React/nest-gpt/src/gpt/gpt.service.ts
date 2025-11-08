import { Injectable, NotFoundException, RequestTimeoutException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import OpenAI from 'openai';
import { orthographyCheckUseCase, prosConsDicusserUseCase, textToAudioUseCase, translateUseCase } from './use-cases';
import { OrthographyDto, ProsConsDiscusserDto, TextToAudioDto, TranslateDto } from './dtos';
import { prosConsDicusserStreamUseCase } from './use-cases/pros-cons-stream.use-case copy';
import type { Response } from 'express';
import * as path from "path";
import * as fs from "fs";
import { deepStrictEqual } from 'assert';


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

  async translateText({ prompt, lang }: TranslateDto) {
    return await translateUseCase(this.openai, { prompt, lang });
  }

  async textToAudio({ prompt, voice }: TextToAudioDto) {
    return await textToAudioUseCase(this.openai, { prompt, voice });
  }

  async textToAudioGetter(fileId: string) {
    const filderPath = path.resolve(__dirname, '../../generated/audios/'
      , `${fileId}.mp3`
    );

    const wasFound = fs.existsSync(filderPath);

    if (!wasFound) new NotFoundException(`File ${fileId} not found`);

    return filderPath;
  }
}
