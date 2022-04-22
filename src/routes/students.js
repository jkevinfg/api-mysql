const express = require('express');
const connection = require('../config/db')

function studentsApi(app) {

    const router = express.Router();
    app.use('/api/students', router);
    
    //get students
    router.get('/',(req,res) => {
      const sql = 'select * from persona';
      connection.query(sql,(err,rows) => {
        if(err) throw err;
        else {
          res.json(rows)
        }
      });
    });

    //get student id
    router.get('/:studentId',(req,res) => {
      const {studentId} = req.params;
      const sql = 'select * from persona where nid_persona = ?';
      connection.query(sql,[studentId],(err,rows) => {
        if(err) throw err;
        else {
          res.json(rows)
        }
      });
    });


  }
  
module.exports = studentsApi;