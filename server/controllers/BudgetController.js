import Category from '../models/Category.js'
import Transaction from '../models/Transaction.js'

const getMonthlyBudget = async (req, res) => {
  const {
    timestamp
  } = req.query
  const reqTimestamp = new Date(timestamp)
  try {
    const totalBudget = await Category.aggregate(
      [
        {
          $unwind: {
            path: '$limits_per_month'
          }
        }, {
          $match: {
            $and: [
              {
                $expr: {
                  $eq: [
                    {
                      $month: '$limits_per_month.month'
                    }, reqTimestamp.getUTCMonth() + 1
                  ]
                }
              }, {
                $expr: {
                  $eq: [
                    {
                      $year: '$limits_per_month.month'
                    }, reqTimestamp.getUTCFullYear()
                  ]
                }
              }, {
                $expr: {
                  $eq: [
                    '$limits_per_month.user_id', req.body.user.uid
                  ]
                }
              }
            ]
          }
        }, {
          $group: {
            _id: null,
            totalBudget: {
              $sum: '$limits_per_month.amount'
            }
          }
        }
      ]

    )
    const spent = await Transaction.aggregate(
      [
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
        }, {
          $group: {
            _id: null,
            spent: {
              $sum: {
                $cond: {
                  if: {
                    $eq: [
                      '$is_output', true
                    ]
                  },
                  then: {
                    $subtract: [
                      0, '$amount'
                    ]
                  },
                  else: '$amount'
                }
              }
            }
          }
        }
      ]
    )
    return res.status(200).json({
      totalBudget: totalBudget[0].totalBudget,
      spent: spent[0].spent
    })
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const BudgetController = {
  getMonthlyBudget
}

export default BudgetController
