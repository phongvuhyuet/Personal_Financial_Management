import Transaction from '../models/Transaction.js'

const createTransaction = async (req, res) => {
  const {
    amount, is_output, user_id, category
  } = req.body
  let newTransaction = new Transaction({
    amount, is_output, user_id, category
  })
  try {
    newTransaction = await newTransaction.save()
    return res.status(200).json(newTransaction)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const getFilteredTransaction = async (req, res) => {
  const {
    filter, timestamp
  } = req.query
  try {
    let transactions
    const reqTimestamp = new Date(timestamp)
    if (filter === 'month') {
      transactions = await Transaction.aggregate([
        {
          $match: {
            $and: [
              {
                $expr: {
                  $eq: [
                    {
                      $month: '$created_at'
                    }, reqTimestamp.getUTCMonth() + 1
                  ]
                }
              }, {
                $expr: {
                  $eq: [
                    {
                      $year: '$created_at'
                    }, reqTimestamp.getUTCFullYear()
                  ]
                }
              }, {
                $expr: {
                  $eq: [
                    '$user_id', req.body.user.uid
                  ]
                }
              }
            ]
          }
        }
      ])
    } else if (filter === 'date') {
      transactions = await Transaction.aggregate([
        {
          $addFields: {
            creationDate: {
              $dateToString: {
                format: '%Y-%m-%d',
                date: '$created_at'
              }
            }
          }
        }, {
          $match: {
            $and: [
              {
                $expr: {
                  $eq: [
                    '$creationDate', reqTimestamp.toISOString().split('T')[0]

                  ]
                }
              }, {
                $expr: {
                  $eq: [
                    '$user_id', req.body.user.uid
                  ]
                }
              }
            ]
          }
        }
      ])
    }
    return res.status(200).json(transactions)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const TransactionController = {
  createTransaction,
  getFilteredTransaction
}

export default TransactionController
