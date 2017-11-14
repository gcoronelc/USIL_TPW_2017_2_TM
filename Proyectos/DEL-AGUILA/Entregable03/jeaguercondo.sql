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


INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
('Castillo', 'Luciola', '89435678', 'lcastillo@gmail.com', '657346578', 'lcastillo', SHA('castillo'), 1);
INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
('Dongo', 'Sulma', '76503987', 'sdongo@gmail.com', '765409867', 'sdongo', SHA('dongo'), 1);
INSERT INTO PROPIETARIO(APELLIDO, NOMBRE, DNI, EMAIL, TELEFONO, USUARIO, CLAVE, ESTADO) VALUES
('Rojas', 'Yesenia', '98706943', 'yrojas@gmail.com', '987658723', 'yrojas', SHA('rojas'), 1);


----------------- INMUEBLE ------------------
CREATE TABLE TORRE
(
	idtorre              INTEGER NOT NULL AUTO_INCREMENT,
	nombre               VARCHAR(60) NOT NULL,
	PRIMARY KEY PK_TORRE(idtorre)
) ENGINE=INNODB;


CREATE TABLE TINMUEBLE
(
	idtinmueble          INTEGER NOT NULL,
	nombre               VARCHAR(60) NOT NULL,
	agua                 INTEGER NOT NULL DEFAULT 1 CHECK ( agua IN (0,1) ),
	mante                INTEGER NOT NULL DEFAULT 1 CHECK ( mante IN (0,1) ),	
	cmante               NUMERIC(10,2) NOT NULL,
	PRIMARY KEY PK_TINMUEBLE (idtinmueble)
) ENGINE=INNODB;



CREATE TABLE INMUEBLE
(
	idinmueble           INTEGER NOT NULL,
	piso                 INTEGER NOT NULL,
	numero               INTEGER NOT NULL,
	descripcion          VARCHAR(200) NOT NULL,
	idpro                INTEGER NOT NULL,
	idtinmueble          INTEGER NOT NULL,
	idtorre              INTEGER NOT NULL,
	activo               INTEGER NOT NULL DEFAULT 1 CHECK ( activo IN (0,1) ),	
	PRIMARY KEY PK_INMUEBLE(idinmueble),
	FOREIGN KEY FK_INMUEBLE_PROPIETARIO (idpro) REFERENCES PROPIETARIO (idpro),
	FOREIGN KEY FK_INMUEBLE_TINMUEBLE (idtinmueble) REFERENCES TINMUEBLE (idtinmueble),
	FOREIGN KEY FK_INMUEBLE_TORRE (idtorre) REFERENCES TORRE (idtorre)
) ENGINE=INNODB;

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
(4,-1,101,'Cochera de Luciola',2,4,1,1);

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

