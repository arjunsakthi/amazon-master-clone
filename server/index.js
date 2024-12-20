//Imp
const express = require("express");
const authRouter = require("./routes/auth");
const mongoose = require("mongoose");
const cors = require("cors");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
//init
console.log("Hello World");
const Port = 3000;
const app = express();
const DB =
  "mongodb+srv://Admin:Test123@cluster0.8awr2.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
//middleware
app.use(cors());
app.use(express.json()); // parse incoming json request
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(Port, "0.0.0.0", () => {
  console.log(`connected at port ${Port}`);
});
