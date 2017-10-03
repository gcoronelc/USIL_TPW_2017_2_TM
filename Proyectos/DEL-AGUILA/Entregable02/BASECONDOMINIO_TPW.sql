/*
   Empresa        :  GRUPO JEAGER
    Software       :  Sistema de Condominio
    DBMS           :  MySQL
    Esquema        :  SISCONDOMINIO
    Script         :  Crea la base de datos con sus respectivas tablas
    Responsable    :  
	                 - DEL AGUILA CHAVEZ EXSON NEMIAS
					 - CASANI ROJAS YESENIA
					 - CASTILLO AREVALO LUCIOLA
					 - CHOQUECAHUANA DONGO SULMA
					 - BARRIOS LEIVA JONATHAN 
    Telefono       :  956137872
    Email          :  nemiasdelaguila@gmail.com
   Creado el      :  31-MAY-2017*/
   
  -- =============================================
  -- Creación de la Base de Datos
  -- =============================================
   DROP DATABASE  IF EXISTS SISCONDOMINIO; 
   
   CREATE DATABASE SISCONDOMINIO;
   
   
    -- =============================================
    -- Seleccionar la Base de Datos
    -- =============================================
   
    USE SISCONDOMINIO;

   
  
    -- =============================================
   -- CREACION DE TABLAS
    -- =============================================


CREATE TABLE Administrador
 (
 idadm int  auto_increment,
 nombre varchar(50),
 apellido varchar(50),
 dni int,
 direccion varchar(50),
 celular int, 
 usuario varchar(25),
 clave varchar (10),
 estado int,
 PRIMARY KEY(idadm)
 );
INSERT INTO  Administrador (nombre,apellido,dni,direccion,celular,usuario,clave,estado) VALUES('JONATHAN','BARRIOS',10124789,'LOS PERALES',941257853,'jbarrios','barrios',1);
INSERT INTO  Administrador (nombre,apellido,dni,direccion,celular,usuario,clave,estado) VALUES('NEMIAS','DEL AGUILA',10124589,'NARANJAL',941257113,'naguila','aguila',1);



 CREATE TABLE Propietario
 (
 idpro int auto_increment,
 idusuario int,
 nombre varchar(50),
 apellido varchar(50),
 dni int,
 direccion varchar(50),
 celular int,
 correo varchar(50),
 usuario varchar(25),
 clave varchar (10),
 estado int,
 PRIMARY KEY(idpro),
 FOREIGN KEY fk_Propietario_Usuario(idusuario) REFERENCES Usuario(idusuario)
 );
INSERT INTO  Propietario (nombre,apellido,dni,direccion,celular,correo,usuario,clave,estado) VALUES('DAVID','ESCUDERO',3256985,'SAN JUAN',900009090,'david@gmail.com','descudero','david',1);
INSERT INTO  Propietario (nombre,apellido,dni,direccion,celular,correo,usuario,clave,estado) VALUES('SILVIA','ARENAS',3954985,'PERALES',921009090,'silvia@gmail.com','sarenas','silvia',1);
INSERT INTO  Propietario (nombre,apellido,dni,direccion,celular,correo,usuario,clave,estado) VALUES('RAQUEL','BAQUERO',9856985,'SAN JUAN',998709090,'raquel@gmail.com','rbaquero','raquel',1);
INSERT INTO  Propietario (nombre,apellido,dni,direccion,celular,correo,usuario,clave,estado) VALUES('EVA','CARNERO',39359885,'AV.MEXICO',998534190,'eva@gmail.com','ecarnero','eva',0);
INSERT INTO  Propietario (nombre,apellido,dni,direccion,celular,correo,usuario,clave,estado) VALUES('SERGIO','DALMAU',3214585,'SAN JUAN',900987450,'sergio@gmail.com','sdamau','sergio',1);


CREATE TABLE TipoInmueble
(
 idtipoInmueble int auto_increment,
 nombre varchar(20),
 PRIMARY KEY(idtipoInmueble)
 );

 INSERT INTO TipoInmueble (nombre) VALUES('cochera');
 INSERT INTO TipoInmueble (nombre) VALUES('oficina');
 INSERT INTO TipoInmueble (nombre) VALUES('departamento');

 
CREATE TABLE Inmueble
(
 idinmueble int auto_increment,
 idtipoInmueble int,
 torre varchar(50),
 piso int,
 numero varchar(5),
  fechaAdquisicion date,
 PRIMARY KEY(idinmueble),
 FOREIGN KEY fk_Inmueble_TipoInmueble(idtipoInmueble)REFERENCES TipoInmueble(idtipoInmueble)
 );

 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (1,'naranja',4,'N-401','2004-02-20');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (1,'melocoton',3,'M-302','2010-11-14');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (3,'uvas',2,'U-205','2017-02-13');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (2,'ciruelos',2,'C-203','2000-12-19');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (3,'melocoton',3,'M-303','2009-02-24');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (3,'naranja',5,'N-503','2008-05-15');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (1,'ciruelos',1,'C-104','2006-10-18');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,numero,fechaAdquisicion) VALUES (2,'naranja',7,'N-702','2004-09-12');
 
 CREATE TABLE DetalleInmueble
 (
  iddetalleinmu int auto_increment,
  idpro int,
  idinmueble int,
  PRIMARY KEY (iddetalleinmu),
  FOREIGN KEY fk_DetalleInmueble_Propietario(idpro)REFERENCES Propietario(idpro),
  FOREIGN KEY fk_DetalleInmueble_Inmueble(idinmueble)REFERENCES Inmueble(idinmueble)
 );
 
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (1,1);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (1,4);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (1,6);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (2,1);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (3,6);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (5,2);
 INSERT INTO DetalleInmueble(idpro,idinmueble) VALUES (5,8);
 
CREATE TABLE PagoAgua
(
 idagua int auto_increment,
 iddetalleinmu int,
 fechaRecibo date,
 cuota int,
 estado int,
 PRIMARY KEY(idagua),
 FOREIGN KEY fk_PagoAgua_detalleinmueble(iddetalleinmu)REFERENCES detalleinmueble(iddetalleinmu)
 );
 

INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(1,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(2,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(3,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(4,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(5,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(6,"2012-12-2",80,1);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,cuota,estado) VALUES(7,"2012-12-2",80,1);
 

CREATE TABLE Mantenimiento
(
 idmantenimiento int auto_increment,
 iddetalleinmu int,
 cuota int,
 fechapago date,
 estado int,
 PRIMARY KEY(idmantenimiento),
 FOREIGN KEY fk_Mantenimiento_detalleinmueble(iddetalleinmu)REFERENCES detalleinmueble(iddetalleinmu)
 );
 
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(1,100,"2012-12-2",1);
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(2,120,"2012-12-1",1);
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(3,140,"2012-12-3",1); 
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(4,100,"2012-12-4",1);
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(5,140,"2012-12-3",1);
 INSERT INTO Mantenimiento(iddetalleinmu,cuota,fechaPago,estado) VALUES(6,120,"2012-12-2",1); 

 
CREATE TABLE AlquilerAuditorio
(
 idalquiler int auto_increment,
 idpro int,
 fechaReservaInicio date,
 fechaReservaFin date,
 fechaPago date,
 costo int,
 pagolimpieza int,
 PRIMARY KEY(idalquiler),
 FOREIGN KEY fk_AlquilerAuditorio_Propietario(idpro)REFERENCES Propietario(idpro)
 );
 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo,pagolimpieza) VALUES(1,"2014-12-2","2015-12-2","2014-12-2",40,0); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo,pagolimpieza) VALUES(2,"2014-11-2","2015-12-2","2014-11-10",40,150); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo,pagolimpieza) VALUES(1,"2014-10-2","2015-12-2","2014-10-10",40,0); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo,pagolimpieza) VALUES(3,"2014-9-2","2015-12-2","2014-9-10",40,150); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo,pagolimpieza) VALUES(5,"2014-8-2","2015-12-2","2014-8-10",40,150); 


CREATE TABLE DetalleEvento(
iddetallevento int auto_increment,
nombre varchar (50),
fechainicio 
fechafin
presupuesto
PRIMARY KEY (iddetallePaEx)
);

INSERT INTO DetalleEvento(nombre,fechainicio,fechafin,presupuesto) VALUES('Fiesta','2014-8-2','2014-8-10',12300); 
INSERT INTO DetalleEvento(nombre,fechainicio,fechafin,presupuesto) VALUES('Pintado General','2015-4-1','2014-6-30',50000); 
INSERT INTO DetalleEvento(nombre,fechainicio,fechafin,presupuesto) VALUES('Restauracion de areas verdes','2012-8-1','2012-10-15',20000); 

CREATE TABLE PagoEvento
(
idevento int auto_increment,
iddetalleinmu int,
iddetallevento int,
cuota int,
PRIMARY KEY(idpaExtra),
FOREIGN KEY fk_PagoEvento_detalleinmueble(iddetalleinmu)REFERENCES detalleinmueble(iddetalleinmu)
FOREIGN KEY fk_PagoEvento_detalleinmueble(iddetallevento)REFERENCES DetalleEvento(iddetallevento)
);

INSERT INTO PagoEvento(iddetalleinmu,iddetallevento,cuota) VALUES(1,1,100); 
INSERT INTO PagoEvento(iddetalleinmu,iddetallevento,cuota) VALUES(2,3,100); 
INSERT INTO PagoEvento(iddetalleinmu,iddetallevento,cuota) VALUES(3,3,100); 
INSERT INTO PagoEvento(iddetalleinmu,iddetallevento,cuota) VALUES(5,2,100); 

CREATE TABLE Inquilino
(
idinquilino int auto_increment,
idpro int,
nombre varchar(50),
apellido varchar(50),
dni int,
correo varchar(50),
celular int,
PRIMARY KEY(idinquilino), 
FOREIGN KEY fk_AlquilerAuditorio_Propietario(idpro)REFERENCES Propietario(idpro)
);
INSERT INTO Inquilino (idpro,nombre,apellido,dni,correo,celular)VALUES (1,'TAURO','MILLA',2548965,'tauro@gmail.com',909090900);
INSERT INTO Inquilino (idpro,nombre,apellido,dni,correo,celular)VALUES (4,'MARIA','HOZ',2325965,'maria@gmail.com',909985410);
INSERT INTO Inquilino (idpro,nombre,apellido,dni,correo,celular)VALUES (2,'JULIA','CAMINO',2325565,'julia@gmail.com',976455410);

CREATE TABLE TotalAlquiler
(
idtotalalquiler int,
fecha date,
total int,
PRIMARY KEY(idtotalalquiler)
)

CREATE TABLE TotalEvento
(
idtotalevento int,
fecha date,
total int,
PRIMARY KEY(idtotalevento)
)

CREATE TABLE Agua
(
idtotalagua int,
fecha date,
total int,
cuota int,
PRIMARY KEY(idtotalagua)
)

CREATE TABLE TotalMantenimiento
(
idtotalmant int,
fecha date,
total int,
PRIMARY KEY(idtotalmant)
)

CREATE TABLE Reporte 
(
 idtotalalquiler int,
 idtotalevento int,
 idtotalagua int,
 idtotalmant int,
 ingresos int,
 egresos int,
 recaudacion int,
 FOREIGN KEY fk_Reporte_TotalAlquiler(idtotalalquiler) REFERENCES TotalAlquiler(idtotalalquiler),
 FOREIGN KEY fk_Reporte_TotalEvento(idtotalevento) REFERENCES TotalEvento(idtotalevento),
 FOREIGN KEY fk_Reporte_Agua(idtotalagua) REFERENCES Agua(idtotalagua),
 FOREIGN KEY fk_Reporte_TotalMantenimiento(idtotalmant) REFERENCES TotalMantenimiento(idtotalmant),  
)

-- =============================================
-- HABILITAR SALIDAS
-- =============================================
   
    SELECT DATABASE();
    SHOW TABLES;

  