var express = require('express');
var app = express();
var PORT = 3000;
//ruteo dispositivo
var routerDisp = require('./routes/dispositivo');
//ruteo dispositivo
var routerMedicion = require('./routes/medicion');
//ruteo riego
var routerRiego = require('./routes/riego');
app.use(express.json());
var corsOptions = {origin: '*', optionSuccessStatus: 200};
const cors = require('cors');

app.use(cors(corsOptions));

app.use('/api/dispositivo', routerDisp);

app.use('/api/medicion', routerMedicion);

app.use('/api/riego', routerRiego);

app.listen(PORT, function(req, res) {
    console.log("API Funcionando ");
});