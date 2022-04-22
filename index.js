const express = require('express');
const app = express();
const studentsApi = require('./src/routes/students');

//db
require('./src/config/db');

//routes
studentsApi(app);

app.listen(process.env.PORT || 3000,() => {
    console.log('Server on port 3000')
});




