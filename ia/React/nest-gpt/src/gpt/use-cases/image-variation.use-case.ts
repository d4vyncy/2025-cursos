import OpenAI from "openai";
import { downloadBase64ImageAsPng, downloadImageAsPng } from "src/helpers";
import * as fs from 'fs';
import { url } from "inspector";

interface Options {
    baseImage: string;
}

export const imageVariationUseCase = async (openai: OpenAI, options: Options) => {

    const { baseImage } = options;

    const pngImagePath = await downloadBase64ImageAsPng(baseImage, true);

    const response = await openai.images.createVariation({
        model: 'dall-e-3',
        image: fs.createReadStream(pngImagePath),
        n: 1,
        size: '1024x1024',
        response_format: 'url'

    });
    assertImageResponse(response);

    const fileName = await downloadImageAsPng(response.data[0].url);
    const url = `${process.env.SERVER_URL}/gpt/image-generation/${fileName}`;

    return {
        url: url,
        openAIUrl: response.data[0].url,
        revised_prompt: response.data[0].revised_prompt,
    };
};

function assertImageResponse(
    response: any
): asserts response is { data: { url: string; revised_prompt?: string }[] } {
    if (!response || !response.data || !Array.isArray(response.data)) {
        throw new Error("Invalid response from OpenAI: missing data array");
    }
}