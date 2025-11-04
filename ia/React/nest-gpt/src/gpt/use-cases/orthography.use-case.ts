import OpenAI from "openai";

interface Options {
  prompt: string;
}

export const orthographyCheckUseCase = async (openai: OpenAI, options: Options) => {
  const { prompt } = options;

  const response = await openai.responses.create({

    input: [
      {
        role: "system",
        content:
          `Te serán proveídos textos en español con posibles errores ortográficos y gramaticales,
          Las palabras usadas deben de existir en el diccionario de la Real Academia de la lengua española
        Debes de responder en formato JSON,
        tu tarea es corregirlos y retornar información soluciones,
        también debes de dar un porcentaje de acierto por el usuario
        
        Si no hay errores, debes de retornar un mensaje de felicitaciones

        Ejemplo de salida:
        {
        userScore: number,
        errors: string[], // ['error -> solución']
        message: string,  // Usa emojis y texto para felicitar al usuario
        }
        
        `
      },
      {
        role: "user",
        content: prompt,
      },

    ],
    model: "gpt-4o-mini", // o 'gpt-4o-mini' si tu cuenta no tiene acceso a gpt-5
    temperature: 0.3,
    max_output_tokens: 150,


  });

  console.log(response);

  //const jsonResp = JSON.parse(response.output_text);

  const cleanOutput = response.output_text
    .replace(/```json/g, '')  // quitar ```json
    .replace(/```/g, '')      // quitar ```
    .trim();                  // quitar espacios extra

  const jsonResp = JSON.parse(cleanOutput);

  return jsonResp;
};
