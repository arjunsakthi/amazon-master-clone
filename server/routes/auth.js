const express = require("express");
const User = require("../model/user");
const authRouter = express.Router();
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const auth = require("../middlewares/auth");

// sign-up route
authRouter.post("/api/signup", async (req, res) => {
  /*get data from client and post to database and return data to user*/
  try {
    console.log(req.body);
    const { name, email, password } = req.body;
    console.log(name, email, password);

    const exisitingUser = await User.findOne({ email });
    if (exisitingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exisits!" });
    }
    const hashedpass = await bcryptjs.hash(password, 8); // 8 is salt random string used for hashing
    let user = new User({
      email,
      password: hashedpass,
      name,
    });

    //This is a method that saves the current state of the user object (usually a Mongoose model instance) to the database.
    user = await user.save();

    res.json(user);
  } catch (e) {
    console.log(e.message);
    res.status(500).json({ error: e.message });
  }
});

// make authRouter available for the files which import it
// can use in this format
// module.exports = {authRouter, name : 'sakthivel'}; // if key and value are same then only key is enough else like dictionary

// sign-in Route
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with the email address is not found" });
    }
    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "incorrect password" });
    }
    const token = jwt.sign({ id: user._id }, process.env.JWT_SECERET_KEY);
    res.json({ token, ...user._doc }); // object destructuring like in dart
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    // token is sent over the header
    const token = req.header("X-auth-token");

    if (!token) return res.json(false);
    const isVerifyed = jwt.verify(token, process.env.JWT_SECERET_KEY);
    if (!isVerifyed) return res.json(false);

    const user = await User.findById(isVerifyed.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// get User Data
authRouter.get("/", auth.auth, async (req, res) => {
  const user = await User.findById(req.user);
  res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
