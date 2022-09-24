module.exports = {
  Connect: function ConnectToDatabase(con){
    con.connect(function(err) {
      if (err) throw err;
      con.query("SELECT * FROM OBA.kurikulum", function (err, result, fields) {
        if (err) throw err;
        // console.log(result[0].IDKurikulum);
      });
      console.log("Connected!");
    });
  }
}