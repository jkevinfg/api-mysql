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
