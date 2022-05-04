const express = require('express');
const app = express();
const { config } = require('./src/config/index');
const studentsApi = require('./src/routes/students');



app.use(express.json());



//routes
studentsApi(app);

app.listen(config.port, function () {
    console.log(`Listening http://localhost:${config.port}`);
});



