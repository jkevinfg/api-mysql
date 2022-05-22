const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'jkevinfg',
  password: 'developeruni',
  database: 'sistema_escuela',
  multipleStatements: true
});

connection.connect(function (err) {
  if (err) {
    console.error(err);
    return;
  } else {
    console.log('db is connected');
  }
});

module.exports = connection;