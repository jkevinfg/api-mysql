const express = require('express');


function studentsApi(app) {

    const router = express.Router();
    app.use('/api/students', router);
    
    router.get('/',(req,res) => {

    });


  }
  
module.exports = studentsApi;