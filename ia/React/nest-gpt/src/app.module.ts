import { Module } from '@nestjs/common';
import { GptModule } from './gpt/gpt.module';
import { ConfigModule } from '@nestjs/config';
import { CeciliaAssistantModule } from './cecilia-assistant/cecilia-assistant.module';


@Module({


  imports: [
    ConfigModule.forRoot({ isGlobal: true,}),
    GptModule,
    CeciliaAssistantModule,
  ],
  
})
export class AppModule { }
