const mysql = require('mysql');
const { config } = require('../config/index');
const USER = encodeURIComponent(config.dbUser);
const PASSWORD = encodeURIComponent(config.dbPassword);
const HOST = config.dbHost;
const DB_NAME = config.dbName;


class MysqlLib {

    constructor() {
      this.status = null
      this.client =  mysql.createConnection({
                        host:  HOST,
                        user:  USER,
                        password: PASSWORD,
                        database: DB_NAME,
       })
    }

    connectMysql(){
      if(!this.status) {
        this.status = new Promise((resolve,reject) => {
          this.client.connect(err => {
            if(err){
              this.dropConnection();
              reject(err);
            }else {
              resolve(this.client)
            }
          })
        })
      }
    }

    dropConnection() {
      if (this.status) {
        this.status.then(res => {
          res.end();
          console.log(res.state, 'connection dropped');
        });
        this.establishedConnection = null;
      }
    }

     getAll(table){
        const sql = `select * from ${table}`
      this.connectMysql().then(db => {
        console.log(db)
      })
      }




}

module.exports = MysqlLib;

