

-------------------------BASE DE DATO-------------------------------
--------------------------------------------------------------------

CREATE DATABASE SISTEMA_CONDOMINIO;

USE SISTEMA_CONDOMINIO;

CREATE TABLE Usuario

(idusuario int primary key,
usuario varchar(50),
clave varchar(50));



CREATE TABLE Administrador
(idadm int primary key,
 nombre varchar(50),
 apellido varchar(50),
 dni int,
correo varchar(50),
direccion varchar(50),
 celular int);



CREATE TABLE Propietario
(idpro int primary key,
 nombre varchar(50),
 apellido varchar(50),
 correo varchar(50), 
 direccion varchar(50),
 celular int,
 idadm int,
 FOREIGN KEY (idadm) REFERENCES administrador ( idadm));



CREATE TABLE Inquilino
(idinquilino int primary key,
nombre varchar(50),
apellido varchar(50),
correo varchar(50),
celular int,
idadm int,
idpro int,

FOREIGN KEY (idadm) REFERENCES ADMINISTRADOR ( idadm),
FOREIGN KEY (idpro) REFERENCES PROPIETARIO ( idpro));



CREATE TABLE Inmueble
(idInmueble varchar(20) primary key,
propietario_Inmue varchar(50),
idpro int,
idinquilino int,

FOREIGN KEY (idinquilino) REFERENCES INQUILINO ( idinquilino),
FOREIGN KEY (idpro) REFERENCES PROPIETARIO ( idpro));


 

CREATE TABLE TipoInmueble
(idtipoInmueble varchar(20) primary key,
nombre varchar(20),
idInmueble varchar(20),

FOREIGN KEY (idInmueble) REFERENCES INMUEBLE ( idInmueble));



CREATE TABLE DetalleInmueble
(id_DetInmueble varchar(20) primary key,
torre varchar(20),
piso varchar(20),
propie_actual varchar(20),
fecha_Alquiler date,
propie_antiguo varchar(30),
idtipoInmueble varchar (20),
idInmueble varchar (20),

FOREIGN KEY (idInmueble) REFERENCES INMUEBLE ( idInmueble),
FOREIGN KEY (idtipoInmueble) REFERENCES TIPOINMUEBLE ( idtipoInmueble));
  
 

CREATE TABLE ServicioAgua

(idServAgua varchar(20) primary key,
fechaRecibo date,
total int,
cuota int,
idInmueble varchar (20),
idtipoInmueble varchar (20),

FOREIGN KEY (idInmueble)REFERENCES INMUEBLE(idInmueble),
FOREIGN KEY (idtipoInmueble)REFERENCES TIPOINMUEBLE(idtipoInmueble));
 



CREATE TABLE ServicioMantenimiento
(idServ_mantenimiento varchar(20) primary key,
NombreEquipo varchar(50),
cuota int,
fechapago date,
idtipoInmueble varchar (20),

FOREIGN KEY (idtipoInmueble)REFERENCES TIPOINMUEBLE(idtipoInmueble));
 



CREATE TABLE AlquilerAuditorio
(idAlquiAudt varchar (20) primary key,
fecReserInicio date,
fecReserFin date,
fecPago date,
costo int,
idadm int,
idinquilino int,
idpro int,

FOREIGN KEY (idadm)REFERENCES ADMINISTRADOR(idadm),
FOREIGN KEY (idinquilino)REFERENCES INQUILINO(idinquilino),
FOREIGN KEY (idpro)REFERENCES PROPIETARIO(idpro));




CREATE TABLE Pago
(idPago varchar (20) primary key,
montoPagado int,
descripcion varchar(50),
idInmueble varchar(20),
idTipoInmueble varchar(20),
idAlquiAudt  varchar(20),
idinquilino int,
idServ_mantenimiento varchar (20),

FOREIGN KEY (idServ_mantenimiento)REFERENCES SERVICIOMANTENIMIENTO(idServ_mantenimiento),
FOREIGN KEY (idAlquiAudt)REFERENCES ALQUILERAUDITORIO(idAlquiAudt),
FOREIGN KEY (idInmueble)REFERENCES INMUEBLE(idInmueble),
FOREIGN KEY (idTipoInmueble)REFERENCES TIPOINMUEBLE(idTipoInmueble),
FOREIGN KEY (idinquilino)REFERENCES INQUILINO(idinquilino));


----------------------------------------------INSERCION DE DATOS--------------------------------------------
------------------------------------------------------------------------------------------------------------


--------------INSERCION DE USUARIO----------------

INSERT Usuario VALUES
(1,'JHOVANA','SULCA'),
(2,'LAURA','CADENAS');

--------------INSERCION DE ADMINISTARDOR----------------
INSERT  Administrador  VALUES
(1,'Cristina','Alfaro',71993524,'cristina@gmail.com','SJL',941257853),
(2,'Alicia','Ancasi',71990023,'alicia@gmail.com','LOS OLIVOS',923457853),
(3,'Rosa','Sulca',71991111,'rosa@gmail.com','ANCON',941257853);

--------------INSERCION DE PROPIETARIO----------------

INSERT  Propietario VALUES
(71345678,'Maria','Jeri','maria@gmail.com','LOS OLIVOS',913456789,1),
(72345678,'Demetrio','Sulca','demetrio@gmail.com','LOS OLIVOS',923456789,1);

--------------INSERCION DE INQUILINO----------------

INSERT  Inquilino VALUES
(81345678,'Jhon','Sanchez','jhon@gmail.com',713456789,1,71345678),
(82345678,'Juan','Solis','juan@gmail.com',713456789,2,71345678),
(83345678,'Maura','Huarcaya','maura@gmail.com',713456789,3,71345678),
(84345678,'Mario','Borda','mario@gmail.com',713456789,1,71345678),
(85345678,'Carlos','Castillo','carlos@gmail.com',713456789,1,71345678),
(86345678,'Jose','Vilca','jose@gmail.com',713456789,3,71345678),
(87345678,'Jacinta','Coras','jacinta@gmail.com',713456789,1,71345678);

--------------INSERCION DE INMUEBLE----------------

INSERT Inmueble VALUES
('1INM','Jhon',71345678,81345678),
('2INM','Juan',71345678,82345678),
('3INM','Maura',71345678,83345678),
('4INM','Mario',71345678,84345678),
('5INM','Carlos',71345678,85345678),
('6INM','Jose',71345678,86345678),
('7INM','Jacinta',71345678,87345678);

--------------INSERCION DE TIPOINMUEBLE----------------

INSERT TipoInmueble VALUES
('1TI','cochera','1INM'),
('2TI','oficina','2INM'),
('3TI','departamento','3INM');

--------------INSERCION DE DETALLEINMUEBLE----------------

INSERT DetalleInmueble VALUES
('1DI','torre1','2piso','Jhon',01/08/2017,'Jhon','1TI','1INM');

--------------INSERCION DE SERVICIO DE AGUA----------------

INSERT ServicioAgua VALUES
('1Agua','01/09/2017',800,50,'1INM','1TI');

--------------INSERCION DE SERVICIO DE MANTENIMIENTO----------------

INSERT ServicioMantenimiento VALUES
('1SM','puerta',25,'02/10/2017','1TI');

--------------INSERCION DE ALQUILER DE AUDITORIO----------------

INSERT AlquilerAuditorio VALUES
('1AUD','02/09/2017','10/09/2017','02/09/2017',200,1,81345678,71345678);

--------------INSERCION DE PAGO----------------

INSERT Pago VALUES
('1Pago',100,'incompleto','1INM','1TI','1AUD',81345678,'1SM');







