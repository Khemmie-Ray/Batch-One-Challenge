import React from 'react'
import { AppKitProvider } from './connection'
import {
  createBrowserRouter,
  Route,
  createRoutesFromElements,
  RouterProvider,
} from "react-router";
import Layout from './layout/Layout';
import Home from './pages/Home';

const router = createBrowserRouter(
  createRoutesFromElements(
      <Route path='/' element={<Layout />}>
        <Route index element={<Home />} />
    </Route>
  )
);


const App = () => {
  return (
    <AppKitProvider>
      <div>
         <RouterProvider router={router} />
         </div>
      </AppKitProvider>
  )
}

export default App