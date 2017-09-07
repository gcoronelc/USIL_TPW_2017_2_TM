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

 CREATE TABLE Usuario
 (
 idusuario int auto_increment,
 usuario varchar(50),
 clave varchar(50),
 privilegio int,
 PRIMARY KEY(idusuario)

);	
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('SULMA','sulma',1);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('LUCIOLA','luciola',1);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('james','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('lopez','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('gomez','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('jhon','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('yesenia','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('papu','nemias',2);
INSERT INTO  Usuario (usuario,clave,privilegio) VALUES('papo','nemias',2);

CREATE TABLE Administrador
 (
 idadm int  auto_increment,
 idusuario int,
 nombre varchar(50),
 apellido varchar(50),
 dni int,
 direccion varchar(50),
 celular int,
 PRIMARY KEY(idadm),
 FOREIGN KEY fk_Administrador_Usuario(idusuario) REFERENCES Usuario(idusuario)
 );
INSERT INTO  Administrador (idusuario,nombre,apellido,dni,direccion,celular) VALUES(1,'JONATHAN','BARRIOS',10124789,'LOS PERALES',941257853);
INSERT INTO  Administrador (idusuario,nombre,apellido,dni,direccion,celular) VALUES(2,'NEMIAS','DEL AGUILA',10124589,'NARANJAL',941257113);



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
 estado int,
 PRIMARY KEY(idpro),
 FOREIGN KEY fk_Propietario_Usuario(idusuario) REFERENCES Usuario(idusuario)
 );
INSERT INTO  Propietario (idusuario,nombre,apellido,dni,direccion,celular ,correo ,estado) VALUES(4,'DAVID','ESCUDERO',3256985,'SAN JUAN',900009090,'david@gmail.com',1);
INSERT INTO  Propietario (idusuario,nombre,apellido,dni,direccion,celular ,correo ,estado) VALUES(5,'SILVIA','ARENAS',3954985,'PERALES',921009090,'silvia@gmail.com',1);
INSERT INTO  Propietario (idusuario,nombre,apellido,dni,direccion,celular ,correo ,estado) VALUES(6,'RAQUEL','BAQUERO',9856985,'SAN JUAN',998709090,'raquel@gmail.com',1);
INSERT INTO  Propietario (idusuario,nombre,apellido,dni,direccion,celular ,correo ,estado) VALUES(7,'EVA','CARNERO',39359885,'AV.MEXICO',998534190,'eva@gmail.com',0);
INSERT INTO  Propietario (idusuario,nombre,apellido,dni,direccion,celular ,correo ,estado) VALUES(8,'SERGIO','DALMAU',3214585,'SAN JUAN',900987450,'sergio@gmail.com',1);


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
 fechaAdquisicion date,
 PRIMARY KEY(idinmueble),
 FOREIGN KEY fk_Inmueble_TipoInmueble(idtipoInmueble)REFERENCES TipoInmueble(idtipoInmueble)
 );

 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (1,'naranjal',4,'2004-02-20');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (1,'melocoton',3,'2010-11-14');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (3,'uvas',2,'2017-02-13');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (2,'ciruelos',2,'2000-12-19');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (3,'melocoton',3,'2009-02-24');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (3,'naranja',5,'2008-05-15');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (1,'ciruelos',1,'2006-10-18');
 INSERT INTO Inmueble (idtipoInmueble,torre,piso,fechaAdquisicion) VALUES (2,'naranjal',7,'2004-09-12');
 
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
 
CREATE TABLE Agua
(
 idagua int auto_increment,
 iddetalleinmu int,
 fechaRecibo date,
 total int,
 cuota int,
 PRIMARY KEY(idagua),
 FOREIGN KEY fk_Agua_detalleinmueble(iddetalleinmu)REFERENCES detalleinmueble(iddetalleinmu)
 );
 

INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(1,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(2,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(3,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(4,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(5,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(6,"2012-12-2",400,80);
INSERT INTO Agua(iddetalleinmu,fechaRecibo,total,cuota) VALUES(7,"2012-12-2",400,80);
 

CREATE TABLE Mantenimiento
(
 idmantenimiento int auto_increment,
 idtipoInmueble int,
 cuota int,
 fechapago date,
 PRIMARY KEY(idmantenimiento),
 FOREIGN KEY fk_Mantenimiento_TipoInmueble(idtipoInmueble)REFERENCES TipoInmueble(idtipoInmueble)
 );
 
 INSERT INTO Mantenimiento(idtipoInmueble,cuota,fechaPago) VALUES(1,100,"2012-12-2");
 INSERT INTO Mantenimiento(idtipoInmueble,cuota,fechaPago) VALUES(2,100,"2012-12-2");
 INSERT INTO Mantenimiento(idtipoInmueble,cuota,fechaPago) VALUES(3,100,"2012-12-2"); 

 
CREATE TABLE AlquilerAuditorio
(
 idalquiler int auto_increment,
 idpro int,
 fechaReservaInicio date,
 fechaReservaFin date,
 fechaPago date,
 costo int,
 PRIMARY KEY(idalquiler),
 FOREIGN KEY fk_AlquilerAuditorio_Propietario(idpro)REFERENCES Propietario(idpro)
 );
 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo) VALUES(1,"2014-12-2","2015-12-2","2014-12-2",40); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo) VALUES(2,"2014-11-2","2015-12-2","2014-11-10",40); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo) VALUES(1,"2014-10-2","2015-12-2","2014-10-10",40); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo) VALUES(3,"2014-9-2","2015-12-2","2014-9-10",40); 
INSERT INTO AlquilerAuditorio(idpro,fechaReservaInicio,fechaReservaFin,fechaPago,costo) VALUES(5,"2014-8-2","2015-12-2","2014-8-10",40); 



CREATE TABLE Limpieza
(
 idlimpieza int auto_increment,
 idalquiler int,
 mora varchar(50),
 PRIMARY KEY(idlimpieza),
 FOREIGN KEY fk_Limpieza_AlquilerAuditorio(idalquiler)REFERENCES AlquilerAuditorio(idalquiler)
 );
INSERT INTO Limpieza(idalquiler,mora) VALUES(3,80); 
INSERT INTO Limpieza(idalquiler,mora) VALUES(5,80); 
 
 

CREATE TABLE GastosMantenimiento
(
idgastosMant int auto_increment,
idpro int,
cuota int,
PRIMARY KEY(idgastosMant),
FOREIGN KEY fk_GastosMantenimiento_Propietario(idpro) REFERENCES Propietario(idpro)
);
INSERT INTO GastosMantenimiento(idpro,cuota) VALUES(1,100); 
INSERT INTO GastosMantenimiento(idpro,cuota) VALUES(2,100); 
INSERT INTO GastosMantenimiento(idpro,cuota) VALUES(3,100); 
INSERT INTO GastosMantenimiento(idpro,cuota) VALUES(4,100); 
INSERT INTO GastosMantenimiento(idpro,cuota) VALUES(5,100); 

CREATE TABLE DetallePagoExtra(
iddetallePaEx int auto_increment,
nombre varchar (50),
PRIMARY KEY (iddetallePaEx)
);

INSERT INTO DetallePagoExtra(nombre) VALUES("Fiesta"); 
INSERT INTO DetallePagoExtra(nombre) VALUES("Pintado General"); 
INSERT INTO DetallePagoExtra(nombre) VALUES("Restauracion de areas verdes"); 

CREATE TABLE PagoExtra
(
idpaExtra int auto_increment,
idpro int,
iddetallePaEx int,
cuota int,
PRIMARY KEY(idpaExtra),
FOREIGN KEY fk_PagoExtra_Propietario(idpro) REFERENCES Propietario(idpro),
FOREIGN KEY fk_PagoExtra_DetallePagoExtra(iddetallePaEx) REFERENCES DetallePagoExtra(iddetallePaEx)
);

INSERT INTO PagoExtra(idpro,iddetallePaEx,cuota) VALUES(1,1,100); 
INSERT INTO PagoExtra(idpro,iddetallePaEx,cuota) VALUES(2,3,100); 
INSERT INTO PagoExtra(idpro,iddetallePaEx,cuota) VALUES(3,3,100); 
INSERT INTO PagoExtra(idpro,iddetallePaEx,cuota) VALUES(5,2,100); 


CREATE TABLE CuentaInmueble
(
idcuentaIn int auto_increment,
idinmueble int,
total int,
PRIMARY KEY(idcuentaIn),
FOREIGN KEY fk_CuentaInmueble_Inmueble(idinmueble)REFERENCES Inmueble(idinmueble)
);
INSERT INTO CuentaInmueble (idinmueble,total)VALUES (1,215);
INSERT INTO CuentaInmueble (idinmueble,total)VALUES (2,585);
INSERT INTO CuentaInmueble (idinmueble,total)VALUES (3,985);
INSERT INTO CuentaInmueble (idinmueble,total)VALUES (4,635);
INSERT INTO CuentaInmueble (idinmueble,total)VALUES (5,154);


CREATE TABLE CuentaPropietario
(
idcuentaPro int auto_increment,
idpro int,
total int,
PRIMARY KEY(idcuentaPro),
FOREIGN KEY fk_CuentaPropietario_Propietario( idpro)REFERENCES Propietario(idpro)
);
INSERT INTO CuentaPropietario (idpro,total)VALUES (1,215);
INSERT INTO CuentaPropietario (idpro,total)VALUES (3,854);
INSERT INTO CuentaPropietario (idpro,total)VALUES (2,984);
INSERT INTO CuentaPropietario (idpro,total)VALUES (5,478);

CREATE TABLE GastosIngresos
(
idgasIn int auto_increment,
idmantenimiento int,
idpaExtra int,
idalquiler int,
idlimpieza int,
ingresos numeric(8,2),
gastos numeric(8,2),
ganancia numeric(8,2),
PRIMARY KEY(idgasIn),
FOREIGN KEY fk_GastosIngresos_Mantenimiento(idmantenimiento)REFERENCES Mantenimiento(idmantenimiento),
FOREIGN KEY fk_GastosIngresos_PagoExtra(idpaExtra)REFERENCES PagoExtra(idpaExtra),
FOREIGN KEY fk_GastosIngresos_AlquilerAuditorio(idalquiler)REFERENCES AlquilerAuditorio(idalquiler),
FOREIGN KEY fk_GastosIngresos_Limpieza(idlimpieza)REFERENCES Limpieza(idlimpieza)
);
INSERT INTO GastosIngresos (idmantenimiento,idpaExtra,idalquiler,idlimpieza,ingresos,gastos,ganancia)VALUES (1,2,1,2,325.00,145.00,500.00);
INSERT INTO GastosIngresos (idmantenimiento,idpaExtra,idalquiler,idlimpieza,ingresos,gastos,ganancia)VALUES (2,2,2,2,455.00,185.00,600.00);
INSERT INTO GastosIngresos (idmantenimiento,idpaExtra,idalquiler,idlimpieza,ingresos,gastos,ganancia)VALUES (2,3,3,1,125.00,645.00,400.00);
INSERT INTO GastosIngresos (idmantenimiento,idpaExtra,idalquiler,idlimpieza,ingresos,gastos,ganancia)VALUES (3,3,2,1,345.00,185.00,700.00);
INSERT INTO GastosIngresos (idmantenimiento,idpaExtra,idalquiler,idlimpieza,ingresos,gastos,ganancia)VALUES (2,2,4,1,825.00,445.00,689.00);


CREATE TABLE Inquilino
(
idinquilino int auto_increment,
iddetalleinmu int,
nombre varchar(50),
apellido varchar(50),
dni int,
correo varchar(50),
celular int,
PRIMARY KEY(idinquilino),
FOREIGN KEY fk_Inquilino_detalleinmueble(iddetalleinmu)REFERENCES detalleinmueble(iddetalleinmu)
);
INSERT INTO Inquilino (iddetalleinmu,nombre,apellido,dni,correo,celular)VALUES (1,'TAURO','MILLA',2548965,'tauro@gmail.com',909090900);
INSERT INTO Inquilino (iddetalleinmu,nombre,apellido,dni,correo,celular)VALUES (4,'MARIA','HOZ',2325965,'maria@gmail.com',909985410);
INSERT INTO Inquilino (iddetalleinmu,nombre,apellido,dni,correo,celular)VALUES (2,'JULIA','CAMINO',2325565,'julia@gmail.com',976455410);


-- =============================================
-- HABILITAR SALIDAS
-- =============================================
   
    SELECT DATABASE();
    SHOW TABLES;

  