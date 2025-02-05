const jwt = require("jsonwebtoken");
const User = require("../model/user");

const admin = async (req, res, next) => {
  try {
    const token = req.header("X-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied." });

    const verified = jwt.verify(token,process.env.JWT_SECERET_KEY );
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });

    const user = await User.findById(verified.id);
    if (user.type === "user" || user.type === "seller") {
      return res.status(401).json({ msg: "You are not an admin!" });
    }

    // Save user info for the next middleware or route handler
    req.user = verified.id;
    req.token = token;

    // Proceed to the next middleware or route handler
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = {admin};
