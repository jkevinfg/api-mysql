const express = require('express');
const app = express();
const studentsApi = require('./src/routes/students');



app.use(express.json());


//db
require('./src/config/db');

//routes
studentsApi(app);

app.listen(process.env.PORT || 8000,() => {
    console.log('Server on port 8000')
});




