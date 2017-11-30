/*
Empresa        :  JEAGUER TEAM
Software       :  Sistema de Gestion de condominios
DBMS           :  MySQL Server
Base de Datos  :  JEAGUERCONDO
Script         :  Crea la Base de Datos
Responsable    :  Nemias del Aguila
Telefono       :  
Email          :  nemiasdelaguila@gmail.com
Sitio Web      :  
Blog           :  
*/


-- =============================================
-- Creación de la Base de Datos
-- =============================================

DROP DATABASE IF EXISTS JEAGUERCONDO;

CREATE DATABASE JEAGUERCONDO;


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE JEAGUERCONDO;
SET NAMES 'utf8';


-- =============================================
-- Creación del Usuario
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'jeaguercondo'@'%' IDENTIFIED BY 'jeaguer' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'jeaguercondo'@'localhost' IDENTIFIED BY 'jeaguer' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE JEAGUERCONDO;


----------------- USUARIOS ------------------

CREATE TABLE ADMINISTRADOR(
  idadmin              INTEGER AUTO_INCREMENT,
  apellido             VARCHAR(60) NOT NULL,
  nombre               VARCHAR(60) NOT NULL,
  dni                  VARCHAR(20) NOT NULL,
  email                VARCHAR(60) NOT NULL,
  telefono             VARCHAR(20) NOT NULL,
  direccion            VARCHAR(100) NOT NULL,
  usuario              VARCHAR(20) NOT NULL,
  clave                VARCHAR(100) NOT NULL,
  estado               INTEGER NOT NULL,
  CONSTRAINT PK_ADMINISTRADOR PRIMARY KEY (idadmin)
) ENGINE=INNODB;


CREATE TABLE PROPIETARIO
 (
  idpro                INTEGER AUTO_INCREMENT,
  apellido             VARCHAR(60) NOT NULL,
  nombre               VARCHAR(60) NOT NULL,
  dni                  VARCHAR(20) NOT NULL,
  email                VARCHAR(60) NOT NULL,
  telefono             VARCHAR(20) NOT NULL,
  usuario              VARCHAR(20) NOT NULL,
  clave                VARCHAR(100) NOT NULL,
  estado               INTEGER NOT NULL,
  CONSTRAINT PK_PROPIETARIO PRIMARY KEY (idpro)
) ENGINE=INNODB;


INSERT INTO ADMINISTRADOR (idadmin, apellido, nombre, dni, email, telefono, direccion, usuario, clave, estado) VALUES
(1, 'Barrios', 'Jonathan', '76578976', 'jbarrios@gmail.com', '9876784321', 'Loma Verde', 'jbarrios', SHA('barrios'), 1),
(2, 'Del aguila', 'Nemias', '45671098', 'delaguila@gmail.com', '976387634', 'Melocotones', 'ndelaguila', SHA('delaguila'), 1);


---INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
---('Castillo', 'Luciola', '89435678', 'lcastillo@gmail.com', '657346578', 'lcastillo', SHA('castillo'), 1);
---INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
---('Dongo', 'Sulma', '76503987', 'sdongo@gmail.com', '765409867', 'sdongo', SHA('dongo'), 1);
---INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
---('Rojas', 'Yesenia', '98706943', 'yrojas@gmail.com', '987658723', 'yrojas', SHA('rojas'), 1);
INSERT INTO propietario (idpro, apellido, nombre, dni, email, telefono, usuario, clave, estado) VALUES
(1,'CONDOMINIO','CONDOMINIO','74435678','CONDOMINIO@GMAIL.COM','657346578','condominio',SHA('condominio'),1),
(2, 'Castillo', 'Luciola', '89435678', 'lcastillo@gmail.com', '657346578', 'lcastillo', SHA('castillo'), 1),
(3, 'Dongo', 'Sulma', '76503987', 'sdongo@gmail.com', '765409867', 'sdongo', SHA('dongo'), 1),
(4, 'Rojas', 'Yesenia', '98706943', 'yrojas@gmail.com', '987658723', 'yrojas', SHA('rojas'), 1),
(5, 'Salazar', 'Angel', '08504587', 'asalazar@gmail.com', '987409867', 'asalazar', SHA('salazar'), 1),
(6, 'Quispe', 'Julio', '65896943', 'jquispe@gmail.com', '932678723', 'jquispe', SHA('quispe'), 1);

----------------- INMUEBLE ------------------
CREATE TABLE TORRE
(
	idtorre              INTEGER NOT NULL AUTO_INCREMENT,
	nombre               VARCHAR(60) NOT NULL,
	PRIMARY KEY PK_TORRE(idtorre)
) ENGINE=INNODB;


CREATE TABLE TINMUEBLE
(
	idtinmueble          INTEGER NOT NULL AUTO_INCREMENT,
	nombre               VARCHAR(60) NOT NULL,
	agua                 INTEGER NOT NULL DEFAULT 1 CHECK ( agua IN (0,1) ),
	mante                INTEGER NOT NULL DEFAULT 1 CHECK ( mante IN (0,1) ),	
	cmante               NUMERIC(10,2) NOT NULL,
	PRIMARY KEY PK_TINMUEBLE (idtinmueble)
) ENGINE=INNODB;



CREATE TABLE INMUEBLE
(
	idinmueble           INTEGER NOT NULL AUTO_INCREMENT,
	piso                 INTEGER NOT NULL,
	numero               INTEGER NOT NULL,
	descripcion          VARCHAR(200) NOT NULL,
	idpro                INTEGER  NULL DEFAULT 0,
	idtinmueble          INTEGER NOT NULL,
	idtorre              INTEGER NOT NULL,
	activo               INTEGER NOT NULL DEFAULT 1 CHECK ( activo IN (0,1) ),	
	PRIMARY KEY PK_INMUEBLE(idinmueble),
	FOREIGN KEY FK_INMUEBLE_PROPIETARIO (idpro) REFERENCES PROPIETARIO (idpro),
	FOREIGN KEY FK_INMUEBLE_TINMUEBLE (idtinmueble) REFERENCES TINMUEBLE (idtinmueble),
	FOREIGN KEY FK_INMUEBLE_TORRE (idtorre) REFERENCES TORRE (idtorre)
) ENGINE=INNODB;



CREATE TABLE ALQUILERAUDITORIO
(
idalquiler  INTEGER PRIMARY KEY AUTO_INCREMENT,
idinmueble INTEGER NOT NULL,
idpro      INTEGER NOT NULL,
fechainicio VARCHAR(90) NOT NULL,
fechafin    VARCHAR(90) NOT NULL,
costo       NUMERIC(8,2) NOT NULL,
pagado      INTEGER NOT NULL,
limpieza    INTEGER NOT NULL,
costolimpieza NUMERIC(8,2) NOT NULL,
total        NUMERIC(8,2) NOT NULL,
FOREIGN KEY PK_ALQUILERAUDITORIO_INMUEBLE(idinmueble) REFERENCES INMUEBLE(idinmueble),
FOREIGN KEY PK_ALQUILERAUDITORIO_PROPIETARIO(idpro) REFERENCES PROPIETARIO(idpro)
)ENGINE=INNODB;
-------------- INSERTANDO DATOS DE INMUEBLE -----------------
-- Tabla TORRE

insert into TORRE(idtorre,nombre) values
(100,'TORRE VIRTUAL'),
(1,'TORRE A'),
(2,'TORRE B'),
(3,'TORRE C');


-- Tabla TINMUEBLE

insert into TINMUEBLE(idtinmueble,nombre,agua,mante,cmante) values
(1,'CONDOMINIO',1,0,0),
(2,'DEPARTAMENTO',1,1,80.0),
(3,'OFICINA',1,1,140.0),
(4,'COCHERA',0,1,20.0),
(5,'AUDITORIO',0,0,0);



-- Tabla INMUEBLE
insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idpro,idtinmueble,idtorre,activo) values
(1,0,0,'Condominio',1,1,100,1),
(2,1,101,'Oficina de Luciola',2,3,1,1),
(3,2,201,'Departamento de Luciola',2,2,1,1),
(4,-1,101,'Cochera de Luciola',2,4,1,1),
(5,3,301,'Oficina de Sulma',3,3,1,1),
(6,5,501,'Departamento de Sulma',3,2,1,1),
(7,2,201,'Oficina de Sulma',3,3,1,1),
(8,5,502,'Departamento de Sulma',3,2,1,1),
(9,-2,201,'Cochera de Sulma',3,4,1,1),
(10,2,202,'Oficina de Yesenia',4,3,1,1),
(11,4,401,'Departamento de Yesenia',4,2,1,1),
(12,-1,102,'Cochera de Yesenia',4,4,1,1),
(13,1,102,'Oficina de Angel',5,3,1,1),
(14,3,302,'Departamento de Angel',5,2,1,1),
(15,-1,103,'Cochera de Angel',5,4,1,1),
(16,1,103,'Oficina de Angel',5,3,1,1),
(17,3,303,'Departamento de Julio',6,2,1,1);

insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idtinmueble,idtorre,activo) values(18,4,401,'Auditorio Principal',5,1,1);
insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idtinmueble,idtorre,activo) values(19,1,608,'Auditorio II',5,2,1);
insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idtinmueble,idtorre,activo) values(20,8,711,'Auditorio Real',5,3,1);
insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idtinmueble,idtorre,activo) values(21,3,801,'Auditorio Z',5,3,1);

---------------------------------------------------------------



------------------------TABLA INQUILINO---------------------------------------

CREATE TABLE INQUILINO (
  idinquilino          INTEGER AUTO_INCREMENT,
  idinmueble		   INTEGER NOT NULL,
  apellido             VARCHAR(60) NOT NULL,
  nombre               VARCHAR(60) NOT NULL,
  dni                  VARCHAR(20) NOT NULL,
  email                VARCHAR(60) NOT NULL,
  telefono             VARCHAR(20) NOT NULL,
  estado               INTEGER NOT NULL,
  CONSTRAINT PK_INQUILINO PRIMARY KEY (idinquilino),
  FOREIGN KEY PK_INQUILINO_INMUEBLE(idinmueble) REFERENCES INMUEBLE (idinmueble)
) ENGINE=INNODB;
-------------- INSERTANDO DATOS DE INQUILINO -----------------
INSERT INTO INQUILINO (idinquilino,idinmueble, apellido, nombre, dni, email, telefono, estado) VALUES
(1, 2,'Gomez','Javier','45835678','jgomez@gmail@gmail.com','957346578',1),
(2, 3,'Quinteros', 'Maria', '75735857', 'lcastillo@gmail.com', '977346957', 1);


--------------------------------------------------------------OBLIGACIONES-----------------
CREATE TABLE TOBLIGACION
(
	IDTOBLIGACION        INTEGER NOT NULL,
	NOMBRE               VARCHAR(50) NOT NULL,
	PRIMARY KEY PK_TOBLIGACION (IDTOBLIGACION)
) ENGINE = 'INNODB';



CREATE TABLE RECIBO
(
	IDRECIBO             INTEGER AUTO_INCREMENT,
	IDTOBLIGACION        INTEGER NOT NULL,
	codigo               VARCHAR(100) NOT NULL,
	ANIO                 INTEGER NOT NULL,
	MES                  INTEGER NOT NULL,
	FVENCE               VARCHAR(100) NOT NULL,
	IMPORTE              NUMERIC(8,2) NULL,
	PRIMARY KEY PK_RECIBO (IDRECIBO),
	FOREIGN KEY FK_RECIBO_TOBLIGACION(IDTOBLIGACION) 
		REFERENCES TOBLIGACION (IDTOBLIGACION)
) ENGINE = 'INNODB';






CREATE TABLE OBLIGACION
(
	IDOBLIGACION         INTEGER AUTO_INCREMENT,
	IDTOBLIGACION        INTEGER NOT NULL,
	IDINMUEBLE           INTEGER NOT NULL,
	ANIO                 INTEGER NULL,
	MES                  INTEGER NULL,
	FVENCE               DATE NULL,
	IMPORTE              INTEGER NULL,
	FECHA                DATE NOT NULL,
	AUDIDPERSONA         INTEGER NOT NULL,
	PRIMARY KEY PK_OBLIGACION(IDOBLIGACION),
	FOREIGN KEY FK_OBLIGACION_TOBLIGACION (IDTOBLIGACION)REFERENCES TOBLIGACION (IDTOBLIGACION),
	FOREIGN KEY FK_OBLIGACION_INMUEBLE(IDINMUEBLE)REFERENCES INMUEBLE (IDINMUEBLE),
	FOREIGN KEY FK_OBLIGACION_PROPIETARIO (AUDIDPERSONA)REFERENCES PROPIETARIO (idpro)
) ENGINE = 'INNODB';


-- =============================================
-- Datos
-- =============================================


-- Tabla TOBLIGACION

INSERT INTO TOBLIGACION(IDTOBLIGACION,NOMBRE) VALUES
(1,'AGUA'),
(2,'MANTENIMIENTO'),
(3,'OTROS');

insert into RECIBO(idrecibo,idtobligacion,codigo,anio,mes,FVENCE,importe) values
(1,2,'R-235489',2017,11,'2017-11-30',300.0),
(2,2,'R-235490',2017,12,'2017-12-30',650.0),
(3,2,'R-235491',2018,01,'2018-01-30',975.0);


----------------------VIEW OBLIGACION--------------------
CREATE VIEW V_OBLIGACION(
id,inmueble,torre,piso,descripcion,
obligacion,nomobligacion,anio,mes,
vencimiento,importe,pagada
) AS
select 
  o.idobligacion, i.idinmueble,
  i.idtorre, i.piso, i.descripcion,
  t.idtobligacion, t.nombre, o.anio,
  o.mes, o.fvence, o.importe, 'none'
from inmueble i
join obligacion o on i.idinmueble = o.idinmueble
join tobligacion t on o.idtobligacion = t.idtobligacion;







