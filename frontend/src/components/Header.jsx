import React from 'react'
import { useAppKit, useAppKitAccount } from '@reown/appkit/react'

const Header = () => {
  const { open } = useAppKit()
  const { isConnected } = useAppKitAccount()

  return (
    <div className='flex justify-between w-[90%] mx-auto my-4 py-8'>
        <p>Dona</p>
        {!isConnected ?  <button className='bg-amber-950 py-3 rounded-[21px] text-white px-8'  onClick={() => open()}> Connect Wallet</button> : <appkit-account-button />}
    </div>
  )
}

export default Header