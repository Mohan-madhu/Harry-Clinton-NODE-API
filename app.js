

require("dotenv").config();
const express = require("express");
const path = require("path");
const cors = require("cors");

const app = express();

// ---- ADD THIS ----
app.use(cors({
  origin: "*",   // OR restrict to your frontend domain:
  // origin: "https://starlit-crepe-940a4f.netlify.app"
}));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use("/Uploads", express.static(path.join(process.cwd(), "Uploads")));
app.use("/api-tester", express.static(path.join(process.cwd(), "public", "api-tester")));
app.use("/api-tester/api", require("./routes/api-tester"));

app.use("/API/HARRY-CLINTON", require("./routes/HARRY_CLINTON"));

// generic error handler
app.use((err, req, res, next) => {
  console.error(err);
  res.status(500).json({ error: err.message });
});

module.exports = app;

