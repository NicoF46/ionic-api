# ionic-api
## Proyecto
Este es la seccion del backend de la aplicacion fullstack Ionic-Meters-app
Esta seccion de backend esta formada por una API en express JS con la base de datos postgreSQL.

## Ejecucion
Para realizar la ejecucion de la aplicacion, se debe realizar los siguientes steps:
- Descargar el codigo del repositorio con git clone
- Instalar dependencias con npm install (node v16.10)
- Levantar la API con el comando node main.js

## Configuracion de la base de datos
La base de datos del proyecto es postgreSQL y los datos de conexion para pruebas en local son los que vienen por default al instalar el motor postgreSQL, los mismos son los siguientes:

user: postgres
host: localhost
database: postgres
password: password
port: 5432

Para crear y agregar datos para las pruebas se puede usar el script db_init.sql, el mismo se puede correr desde un cliente sql, en mi caso use el dbeaver v22.0.3

## Endpoints

# Listado de dispositivos

curl --location --request GET 'http://localhost:3000/api/dispositivo/'

# Listado de mediciones

curl --location --request GET 'http://localhost:3000/api/medicion/1/todas'

# Ultima medicion

curl --location --request GET 'http://localhost:3000/api/medicion/1'

# Generar medicion

curl --location --request POST 'http://localhost:3000/api/riego/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "apertura": 19,
    "fecha": "2022-04-26T21:07:20-03:00",
    "electrovalvulaid": 1
}'

# Listado de logs de riego

curl --location --request GET 'http://localhost:3000/api/riego/1/todas'

# Ultimo log de riego

curl --location --request GET 'http://localhost:3000/api/riego/1'

# Generar log de riego

curl --location --request POST 'http://localhost:3000/api/medicion/' \
--header 'Content-Type: application/json' \
--data-raw '{
    "valor": "100",
    "fecha": "2022-04-26T21:07:20-03:00",
    "dispositivoid": 1
}'


