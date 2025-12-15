import { Injectable } from '@nestjs/common';
import OpenAI from 'openai';
import { checkCompleteStatusUseCase, createMessageUseCase, createRunUserCase, createThreadUseCase, getMessageListUseCase } from './use-cases';
import { QuestionDto } from './dto/question.dto';

@Injectable()
export class CeciliaAssistantService {

    private openai = new OpenAI({
        apiKey: process.env.OPENAI_API_KEY,
    });

    async createThread() {
        return createThreadUseCase(this.openai);
    }

    async userQuestion(questionDto: QuestionDto) {
        const { threadId, question } = questionDto;
        const message = await createMessageUseCase(this.openai, { threadId, question });

        const run = await createRunUserCase(this.openai, { threadId });

        await checkCompleteStatusUseCase(this.openai, { runId: run.id, threadId: threadId })

        const messages = await getMessageListUseCase(this.openai, { threadId });
        return messages;
    }


}
