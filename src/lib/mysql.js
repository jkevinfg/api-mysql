const mysql = require('mysql');
const { config } = require('../config/index');
const USER = encodeURIComponent(config.dbUser);
const PASSWORD = encodeURIComponent(config.dbPassword);
const HOST = config.dbHost;
const DB_NAME = config.dbName;

class MysqlLib {

  constructor() {
    this.establishedConnection = null;
    this.dbname = DB_NAME;
    this.dbpassword = PASSWORD;
  }

  connection() {
    return new Promise((resolve, reject) => {
      resolve(mysql.createConnection({
        host: HOST,
        user: USER,
        password: this.dbpassword,
        database: this.dbname,
      }))
    })
  }

  connect() {
    if (!this.establishedConnection) {
      this.establishedConnection = this.connection().then(res => {
        res.connect(function(err) {
          if (err) {
            this.dropConnection();
            throw err;
          }         
          return res
        })
        
      });
    }
    return this.connection()
  }

  dropConnection() {
    if (this.establishedConnection) {
      this.establishedConnection.then(res => {
        res.end();
        console.log(res.state, 'connection dropped');
      });
      
      this.establishedConnection = null;
    }
  }

  getAll(table){
    const sql = `select * from ${table}`
    const connectionMysql = this.connect().then(db => {
      db.query(sql,(err,rows) => {
        console.log(rows)
      })      
    });
    
    
  }

}

module.exports = MysqlLib;


/*


     getAll(table){
       const sql = `select * from ${table}`
       const connection = this.connectMysql().then(db => (db)).then (db => {
         db.query(sql, (err,rows) => {
           return rows
         })
       })

    }
 new Promise((resolve,reject) => {
          db.query( sql,(err,rows) => {
            if (err){
              reject(err)
            }else {
              console.log(rows)
              resolve(rows)
            }
          })
        } )

*/