var mysql = require('mysql');

function connect(){
  const con = mysql.createConnection({
    host: "127.0.0.1",
    port: '3306',
    user: "root",
    password: "PkmOba_2022",
    database: "OBA"
  });

  return con;
}

function dbQueryAll(con, tableName, cb){
    var queryString = "SELECT * FROM " + tableName;
    con.query(queryString, function (err, result) {
    if (err) throw err;
    
    cb(result);
  });
}

// function dbSeed(){}

module.exports = {connect ,dbQueryAll};