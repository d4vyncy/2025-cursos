import { Body, Controller, Post } from '@nestjs/common';
import { CeciliaAssistantService } from './cecilia-assistant.service';
import { QuestionDto } from './dto/question.dto';

@Controller('cecilia-assistant')
export class CeciliaAssistantController {
  constructor(private readonly ceciliaAssistantService: CeciliaAssistantService) { }

  @Post('create-thread')
  async createThread() {
    return await this.ceciliaAssistantService.createThread();
  }

  @Post('user-question')
  async userQuestion(
    @Body() questionDto: QuestionDto
  ) {
    return await this.ceciliaAssistantService.userQuestion(questionDto);
  }
}
