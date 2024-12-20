const jwt = require("jsonwebtoken");
const auth = async (req, res, next) => {
  try {
    const token = req.header("X-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth Token, access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token Verification failed, authorization denied." });

    // saving some parameters
    req.user = verified.id;
    req.token = token;
    // to call next callback function
    next();
  } catch (e) {
    res.status(500).sjon({ error: e.message });
  }
};

module.exports = { auth };
