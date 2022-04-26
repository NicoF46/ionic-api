var express = require('express');
var riegoMedicion = express.Router();
var pool = require('../../postgres');

//Espera recibir por parámetro un id de dispositivo y devuelve su última log de riego
riegoMedicion.get('/:idValvula', function(req, res) {
    pool.query('Select * from Log_riegos where electrovalvulaid=$1 order by fecha desc limit 1',[req.params.idValvula],function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        console.log(result)
        res.send(result["rows"][0]);
    });
});

//Espera recibir por parámetro un id de dispositivo y devuelve todas sus logs de riego
riegoMedicion.get('/:idValvula/todas', function(req, res) {
    pool.query('Select * from Log_riegos where electrovalvulaid=$1 order by fecha desc', [req.params.idValvula], function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        res.send(result["rows"]);
    });
});

//Espera recibir por parámetro un id de dispositivo y un valor de medición y lo inserta en base de datos.
riegoMedicion.post('/', function(req, res) {
    pool.query('Insert into Log_riegos (apertura,fecha,electrovalvulaid) VALUES ($1, $2, $3)', [req.body.apertura, req.body.fecha, req.body.electrovalvulaid], function(err, result, fields) {
        if (err) {
            console.log(err);
            res.send(err).status(400);
            return;
        }
        res.send(result);
    });
});

module.exports = riegoMedicion;