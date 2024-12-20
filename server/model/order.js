const mongoose = require("mongoose");
const { productSchema } = require("./product");
const orderSchema = mongoose.Schema({
  products: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  totalPrice: {
    type: Number,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  userId:{
    type: String,
    required:true,
  },
  orderedAt: {
    type: Number,
    required: true,
  },
  // 0 - pending
  // 1 - tick marked
  // 2 - delivered
  status: {
    type: Number,
    default: 0,
  },
});

const Order = mongoose.model("order", orderSchema);

module.exports = Order;
