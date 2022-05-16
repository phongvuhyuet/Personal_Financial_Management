import express from 'express'
import CategoryController from '../controllers/CategoryController.js'

const categoryRouter = express.Router()

// categoryRouter.get('/', CategoryController.getFilteredTransaction)
categoryRouter.post('/', CategoryController.createCategory)

export default categoryRouter
