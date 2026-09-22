require("dotenv").config();
const express = require("express");
const cors = require("cors");

const app = express();
app.use(cors());
app.use(express.json());

app.get("/api/health", (req,res) => {
  res.json({ok:true, app:"Just2Profit"});
});

app.get("/api/tasks", (req,res) => {
  res.json({tasks:[]});
});

app.listen(process.env.PORT || 3000, () => {
  console.log("Just2Profit API running on port " + (process.env.PORT || 3000));
});
