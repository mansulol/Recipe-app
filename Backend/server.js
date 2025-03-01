const express = require("express");
const cors = require("cors");
const dotenv = require("./config/env.config");
const connectDB = require("./config/db.config");
const bodyParser = require("body-parser");
const routes = require("./routeConfig");

const port = dotenv.PORT;

connectDB();

const app = express();

app.use(
  cors({
    origin: "*",
  })
);

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true }));

Object.entries(routes).forEach(([route, handler]) => {
  app.use(route, handler);
});

app.listen(port, () => console.log(`Server is running on port ${port}`));

module.exports = app;
