import mongoose from 'mongoose'

const { Schema } = mongoose
const { ObjectId } = Schema

const WalletModel = new Schema(
  {
    current_balance: {
      type: Number,
      required: true,
    },
    name: {
      type: String,
      default: 'Không tên'
    },
    type: {
      type: String,
      default: 'bank'
    },
    user_id: {
      type: String,
      required: true
    }
  },
  {
    timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' },
  }
)

const Wallet = mongoose.model('Wallet', WalletModel)

export default Wallet
