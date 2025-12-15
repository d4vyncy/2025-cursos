import { Module } from '@nestjs/common';
import { CeciliaAssistantService } from './cecilia-assistant.service';
import { CeciliaAssistantController } from './cecilia-assistant.controller';

@Module({
  controllers: [CeciliaAssistantController],
  providers: [CeciliaAssistantService],
})
export class CeciliaAssistantModule {}
