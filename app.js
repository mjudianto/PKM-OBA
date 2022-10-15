const express = require("express");
const app = express();

const dbConnection = require("./module/db-connection.js");

const con = dbConnection.connect();

con.connect(function(err) {
  if (err) throw err;
});

dbConnection.dbQueryAll(con, 'kurikulum', function(result){
  console.log(result);
})

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
