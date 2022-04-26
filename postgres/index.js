var Pool = require('pg').Pool
var pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  database: 'postgres',
  password: 'password',
  port: 5432,
})

pool.connect((err, connection) => {
    console.log("Iniciando la conexion con la base de datos ");
    if (err) {
        console.error('Ha ocurrido un error no esperado en la conexion con la base de datos');
        if (connection) {
            connection.release();
        }
        return;
    }
    console.log("Se ha creado la conexion hacia la base de datos correctamente")
});
module.exports = pool;