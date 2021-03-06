var express = require('express');
var routerMedicion = express.Router();
var pool = require('../../postgres');

//Espera recibir por parámetro un id de dispositivo y devuelve su última medición
routerMedicion.get('/:idDispositivo', function(req, res) {
    pool.query('Select * from Records where device_id=$1 order by created_at desc limit 1',[req.params.idDispositivo],function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        console.log(result)
        res.send(result["rows"][0]);
    });
});

//Espera recibir por parámetro un id de dispositivo y devuelve todas sus mediciones
routerMedicion.get('/:idDispositivo/todas', function(req, res) {
    pool.query('Select * from Records where device_id=$1 order by created_at desc limit 10', [req.params.idDispositivo], function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        res.send(result["rows"]);
    });
});

//Espera recibir por parámetro un id de dispositivo y un valor de medición y lo inserta en base de datos.
/*routerMedicion.post('/', function(req, res) {
    console.log(req.body)
    pool.query('Insert into Mediciones (fecha,valor,dispositivoid) VALUES ($1, $2, $3)', [req.body.fecha, req.body.valor, req.body.dispositivoId], function(err, result, fields) {
        if (err) {
            res.send(err).status(400);
            return;
        }
        res.send();
    });
});*/

module.exports = routerMedicion;