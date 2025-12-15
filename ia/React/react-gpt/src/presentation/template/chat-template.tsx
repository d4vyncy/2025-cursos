import React, { useState } from 'react'

import { GptMessage, MyMessage, TextMessageBox, TypingLoader } from '../components'

interface Message {
  text: string;
  isGpt: boolean;
}

export const OrthographyPage = () => {

  const [isLoading, setIsLoading] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);

  const handlePost = async (text: string) => {
    setIsLoading(true);
    setMessages((prev) => [...prev, { text: text, isGpt: false }]);

    //TODO: UseCase

    setIsLoading(false);

    // TODO: Aladir mensaje
  }


  return (
    <div className='chat-container'>
      <div className='chat-messages'>
        <div className='grid grid-cols-12 gap-y-2'>

          {/* Bienvenida*/}
          <GptMessage text="Buenos dias soy cecilia en que puedo ayudarte?"></GptMessage>

          {
            messages.map((message, index) => (
              message.isGpt
                ? (
                  <GptMessage key={index} text={message.text}></GptMessage>
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
      <TextMessageBox
        onSendMessage={handlePost}
        placeholder='Escribe aquí lo que deseas'
        disableCorrections
      ></TextMessageBox>
    </div>
  )
}
