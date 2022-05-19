import express from 'express'
import WalletController from '../controllers/WalletController.js'

const walletRouter = express.Router()

walletRouter.post('/', WalletController.createWallet)

export default walletRouter
