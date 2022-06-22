var express = require('express');
const { rows } = require('pg/lib/defaults');
var routerDispositivo = express.Router();
var pool = require('../../postgres');

//Devuelve un array de dispositivos
routerDispositivo.get('/', function(req, res) {
    pool.query('Select * from Devices order by device_id asc', function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        res.send(result["rows"]);
    });
});

module.exports = routerDispositivo;