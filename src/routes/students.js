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
          console.log(rows);
          res.json(rows);
        }
      });
    });

    //para agregar un studiante debes estar logueado (jwt ) - crear un student
    router.post('/',(req,res) => {
      console.log(req.body);
      const { nomb_persona,ape_pate_pers, ape_mate_pers,nid_grado,fecha_naci, foto_ruta } = req.body;
      const sql = 'insert into persona (nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci , foto_ruta)  values (?, ?, ?, ?, ?,? )';
      connection.query(sql, [nomb_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta ] , (err,rows) => {
        if (err) throw err;
        console.log("Row inserted with id = "
            + rows.insertId);
      })
    })

    //solo el admin puede editar y eliminar estudiantes


  }
  
module.exports = studentsApi;