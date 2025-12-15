import OpenAI from "openai";

interface Options {
    threadId: string;
    assistantId?: string;
}




export const createRunUserCase = async (openai: OpenAI, options: Options) => {

    const { threadId, assistantId = 'asst_IlURGqJFBVcpNHx5VPPvF8kb' } = options;

    const run = await openai.beta.threads.runs.create(threadId, {
        assistant_id: assistantId,
        // instructions  // OJO! Sobre escribe el asistente

    });

    console.log({ run });

    return run;

}