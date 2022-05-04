const express = require('express');
const StudentsService = require('../services/students');


function studentsApi(app) {
  
    const router = express.Router();
    app.use('/api/students', router);

    const studentsService = new StudentsService();
    
    //get students
    router.get('/', async (req,res) => {
      const students = await studentsService.getStudents();
      console.log(students)
    });

    //get student id
    router.get('/:studentId',(req,res) => {
      const {studentId} = req.params;
      const sql = 'select * from persona where nid_persona = ?';
      connection.query(sql,[studentId],(err,rows) => {
        if(err) throw err;
        else {
          res.json(rows);
        }
      });
    });

    //insert student
    router.post('/',(req,res) => {
      const {nom_persona, ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta } = req.body;
      const sql = `call personaAddOrEdit (?, ? , ?, ?, ? , ? ,?);`; 
      connection.query(sql , [0, nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta] , (err,rows) => {
        if(!err) {
          res.json({status: 'Student saved'});
        } else {
          console.log(err);
        }
      })
    })

    //edit student
    router.put('/:studentId',(req,res) => {
      const {studentId } = req.params;
      const {nom_persona, ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta}  = req.body;
      const sql = `call personaAddOrEdit (?, ? , ?, ?, ? , ? ,?);`;
      connection.query(sql, [studentId,nom_persona,ape_pate_pers,ape_mate_pers,nid_grado,fecha_naci,foto_ruta], (err,rows) => {
        if(!err) {
          res.json({statud:'Student edit'})
        } else {
          console.log(err);
        }
      })
    })

    
    //delete

  }
  
module.exports = studentsApi;