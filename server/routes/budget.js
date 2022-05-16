import express from 'express'
import BudgetController from '../controllers/BudgetController.js'

const budgetRouter = express.Router()

budgetRouter.get('/', BudgetController.getMonthlyBudget)

export default budgetRouter
