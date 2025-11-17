import React, { useState } from 'react'
import { GptMessage, GptMessageAudio, MyMessage, TextMessageBox, TextMessageBoxSelect, TypingLoader } from '../../components'
// import type { StringDecoder } from 'string_decoder';
import { textToAudioUseCase } from '../../../core/use-cases';

const displaimer = `## ¿Que audio quieres generar hoy ?
* Todo el audio generado es por IA
`;

const voices = [
  { id: "nova", text: "Nova" },
  { id: "alloy", text: "Alloy" },
  { id: "echo", text: "Echo" },
  { id: "fable", text: "Fable" },
  { id: "onyx", text: "Onyx" },
  { id: "shimmer", text: "Shimmer" },
];

interface TextMessage {
  text: string;
  isGpt: boolean;
  type: 'text';
}

interface AudioMessage {
  text: string;
  isGpt: boolean;
  audio: string;
  type: 'audio';
}

type Message = TextMessage | AudioMessage;



export const TextToAudioPage = () => {

  const [isLoading, setIsLoading] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);

  const handlePost = async (text: string, selectedVoice: string) => {
    setIsLoading(true);
    setMessages((prev) => [...prev, { text: text, isGpt: false, type: 'text' }]);

    //TODO: UseCase
    const { ok, message, audioUrl } = await textToAudioUseCase(text, selectedVoice);

    setIsLoading(false);

    if (!ok) return;

    setMessages((prev) => [...prev,
    { text: message, isGpt: true, type: 'audio', audio: audioUrl! }]);

    // TODO: Aladir mensaje
  }


  return (
    <div className='chat-container'>
      <div className='chat-messages'>
        <div className='grid grid-cols-12 gap-y-2'>

          {/* Bienvenida*/}
          <GptMessage text={displaimer}></GptMessage>

          {
            messages.map((message, index) => (
              message.isGpt
                ? (


                  message.type === 'audio'
                    ? (
                      <GptMessageAudio key={index} text={message.text}
                        audio={message.audio}
                      ></GptMessageAudio>
                    ) : (
                      <MyMessage key={index} text={message.text}

                      ></MyMessage>
                    )


                )
                : (
                  <MyMessage key={index} text={message.text}></MyMessage>
                )


            ))

          }

          {
            isLoading && (
              <div className='col-start-1 col-end-12 fade-in'>
                <TypingLoader className="fade-in"></TypingLoader>
              </div>
            )
          }

          {/* <MyMessage text="Hola mundo"></MyMessage> */}



        </div>
      </div>
      <TextMessageBoxSelect
        onSendMessage={handlePost}
        placeholder='Escribe aquí lo que deseas'
        options={voices}
      ></TextMessageBoxSelect>
    </div>
  )
}
