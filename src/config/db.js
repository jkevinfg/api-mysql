const mysql = require('mysql')

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'school'
})

connection.connect((err) => {
    if(err){
        console.error(err)
    }else {
        console.log('connected database')
    }
});

module.exports = connection;


connection.query(sql,[studentId],(err,rows) => {
    if(err) throw err;
    else {
      res.json(rows);
    }
  });


  const sql = `select * from ${table}`
      this.connect.query(sql,(err,rows) => {
        if(err) throw err;
        else {
          return res.json(rows);
        }
      });
     }