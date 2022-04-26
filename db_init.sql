CREATE TABLE IF NOT EXISTS Electrovalvulas (
  electrovalvulaId SERIAL NOT NULL,
  nombre VARCHAR(45) NULL,
  PRIMARY KEY (electrovalvulaId));

CREATE TABLE IF NOT EXISTS Dispositivos (
  dispositivoId SERIAL NOT NULL,
  nombre VARCHAR(200) NULL,
  ubicacion VARCHAR(200) NULL,
  electrovalvulaId integer REFERENCES Electrovalvulas(electrovalvulaId),
  PRIMARY KEY (dispositivoId)
);
 
 
CREATE TABLE IF NOT EXISTS Mediciones (
  medicionId SERIAL NOT NULL,
  fecha TIMESTAMP NULL,
  valor VARCHAR(100) NULL,
  dispositivoId integer REFERENCES dispositivos(dispositivoId),
  PRIMARY KEY (medicionId)
);

CREATE TABLE IF NOT EXISTS Log_Riegos(
  logRiegoId SERIAL NOT NULL,
  apertura int NULL,
  fecha timestamp NULL,
  electrovalvulaId integer REFERENCES electrovalvulas(electrovalvulaId),
  PRIMARY KEY (logRiegoId));
 
INSERT INTO Electrovalvulas (nombre) VALUES ('eLPatio');
INSERT INTO Electrovalvulas (nombre) VALUES ('eLCocina');
INSERT INTO Electrovalvulas (nombre) VALUES ('eLJardinDelantero');
INSERT INTO Electrovalvulas (nombre) VALUES ('eLLiving');
INSERT INTO Electrovalvulas (nombre) VALUES ('eLHabitacion1');
INSERT INTO Electrovalvulas (nombre) VALUES ('eLHabitacion2');


INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 1', 'Patio',1);
INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 2', 'Cocina',2);
INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 3', 'Jardin Delantero',3);
INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 4', 'Living',4);
INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 5', 'Habitacion 1',5);
INSERT INTO Dispositivos (nombre,ubicacion,electrovalvulaId) VALUES ('Sensor 6', 'Habitacion 2',6);


INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,60,1 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,40,1 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,30,2 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,50,3 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,33,5 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,17,4 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,29,6 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,20,1 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,44,4 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,61,5 );
INSERT INTO Mediciones (fecha,valor,dispositivoId) VALUES (current_timestamp,12,2 );


INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (1,10,current_timestamp, 1 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (2,20,current_timestamp, 2 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (3,30,current_timestamp, 3 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (4,40,current_timestamp, 4 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (5,60,current_timestamp, 5 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (6,70,current_timestamp, 6 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (7,30,current_timestamp, 1 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (8,10,current_timestamp, 2 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (9,15,current_timestamp, 3 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (10,18,current_timestamp, 4 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (11,19,current_timestamp, 5 );
INSERT INTO log_riegos (logriegoid, apertura, fecha, electrovalvulaid)VALUES (12,10,current_timestamp, 6 );





INSERT INTO log_riegos (apertura, fecha, electrovalvulaid)VALUES (10,1650822229, 6 );

