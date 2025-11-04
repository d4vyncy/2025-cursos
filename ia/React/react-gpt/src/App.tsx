import React from 'react'
import { RouterProvider } from 'react-router'
import { router } from './presentation/router/router';

export const App = () => {
  return (
   <RouterProvider router={router}/>
  )
}
