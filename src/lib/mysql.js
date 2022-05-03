const mysql = require('mysql');
const { config } = require('../config/index');
const USER = encodeURIComponent(config.dbUser);
const PASSWORD = encodeURIComponent(config.dbPassword);
const HOST = config.dbHost;
const DB_NAME = config.dbName;


class MysqlLib {

    constructor() {
      this.establishedConnection = null;
      this.host = HOST;
      this.user = USER;
      this.dbname = DB_NAME;
      this.dbpassword = PASSWORD;
    }

    connection() {
      return new Promise((resolve, reject) => {
       resolve(mysql.createConnection({
          host: this.host,
          user: this.user,
          password: this.dbpassword,
          database: this.dbname,
        }))
       }
      )
    }
  
    connect() {
      if (!this.establishedConnection) {
        this.establishedConnection = this.connection().then(res => {
          res.connect(function(err) {
            if (err) {
              this.dropConnection();
              throw err;
            }else {
              return 'true'
            }
          })
        });
      }
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

    async getAll(table) {
      const sql = `select * from ${table}`;
      if(this.connect() === 'true'){
        console.log('hola')
      }
    }


  }

module.exports = MysqlLib;

