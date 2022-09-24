const express = require("express");
const app = express();

var mysql = require('mysql');
// import { ConnectToDatabase } from './module/db-connection.js';
const databaseModule = require('./module/db-connection.js');

const con = mysql.createConnection({
  host: "127.0.0.1",
  port: '3306',
  user: "root",
  password: "PkmOba_2022"
});

const db = databaseModule.Connect(con);

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.post("/post", function(req, res)  {
  const newUser = {
    Username: req.body.username,
  };

  console.log(req.body.username,);
});

const PORT = process.env.PORT || 8080;

app.listen(PORT, console.log(`Server started on port ${PORT}`));
