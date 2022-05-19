import Wallet from '../models/Wallet.js'

const createWallet = async (req, res) => {
  const {
    amount, name, type, user_id, description
  } = req.body
  let newWallet = new Wallet({
    amount, name, type, user_id, description
  })
  try {
    newWallet = await newWallet.save()
    return res.status(200).json(newWallet)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const WalletController = {
  createWallet
}

export default WalletController
