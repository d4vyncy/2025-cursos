
import React, { useEffect, useState } from 'react'

import { GptMessage, MyMessage, TextMessageBox, TypingLoader } from '../../components'
import { createThreadUserCase, postQuestionUseCase } from '../../../core/use-cases';

interface Message {
  text: string;
  isGpt: boolean;
}

export const AssistantPage = () => {

  const [isLoading, setIsLoading] = useState(false);
  const [messages, setMessages] = useState<Message[]>([]);

  const [threadId, setThreadId] = useState<string>();


  //Obtener el thread, y si no existe, crearlo

  useEffect(() => {
    const threadId = localStorage.getItem('threadId');
    if (threadId) {
      setThreadId(threadId);
    } else {
      createThreadUserCase()
        .then(id => {
          setThreadId(id);
          localStorage.setItem('threadId', id);
        })
    }


  }, []);

  useEffect(() => {
    if (threadId) {
      setMessages((prev) => [...prev, { text: `Número de thread ${threadId}`, isGpt: true }])
    }
  }, [threadId])


  const handlePost = async (text: string) => {
    if (!threadId) return;

    setIsLoading(true);
    setMessages((prev) => [...prev, { text: text, isGpt: false }]);

    //TODO: UseCase
    const repliies = await postQuestionUseCase(threadId, text);

    setIsLoading(false);

    for (const reply of repliies) {
      for (const message of reply.content) {
        setMessages((prev => [
          ...prev,
          { text: message, isGpt: (reply.role === 'assistant'), info: reply }


        ]))
      }
    }

    // TODO: Aladir mensaje
  }


  return (
    <div className='chat-container'>
      <div className='chat-messages'>
        <div className='grid grid-cols-12 gap-y-2'>

          {/* Bienvenida*/}
          <GptMessage text="hola soy Cecilia en que puedo ayudarte"></GptMessage>

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
