/*
Empresa        :  EGCC
Software       :  Sistema de Gestion de condominios
DBMS           :  MySQL Server
Base de Datos  :  CONDOMINIO
Script         :  Crea esquema SEGURIDAD
Responsable    :  Ing. Eric Gustavo Coronel Castillo
Telefono       :  (511) 9966-64457
Email          :  gcoronelc@gmail.com
Sitio Web      :  http://www.desarrollasoftware.com
Blog           :  http://gcoronelc.blogspot.com
*/


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE CONDOMINIO;
SET NAMES 'utf8';


-- =============================================
-- Creación de tablas
-- =============================================

CREATE TABLE TORRE
(
	idtorre              INTEGER NOT NULL,
	nomtorre               VARCHAR(60) NOT NULL,
	PRIMARY KEY PK_TORRE(idtorre)
) ENGINE=INNODB;


CREATE TABLE TINMUEBLE
(
	idtinmueble          INTEGER NOT NULL,
	nomtinmueble               VARCHAR(60) NOT NULL,
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
	idpersona            INTEGER NOT NULL,
	idtinmueble          INTEGER NOT NULL,
	idtorre              INTEGER NOT NULL,
	activo               INTEGER NOT NULL DEFAULT 1 CHECK ( activo IN (0,1) ),	
	PRIMARY KEY PK_INMUEBLE(idinmueble),
	FOREIGN KEY FK_INMUEBLE_PERSONA (idpersona) REFERENCES PERSONA (idpersona),
	FOREIGN KEY FK_INMUEBLE_TINMUEBLE (idtinmueble) REFERENCES TINMUEBLE (idtinmueble),
	FOREIGN KEY FK_INMUEBLE_TORRE (idtorre) REFERENCES TORRE (idtorre)
) ENGINE=INNODB;


-- =============================================
-- Creación de tablas
-- =============================================

-- Tabla TORRE

insert into TORRE(idtorre,nomtorre) values
(100,'TORRE VIRTUAL'),
(1,'TORRE A'),
(2,'TORRE B'),
(3,'TORRE C');


-- Tabla TINMUEBLE

insert into TINMUEBLE(idtinmueble,nomtinmueble,agua,mante,cmante) values
(1,'CONDOMINIO',1,0,0),
(2,'DEPARTAMENTO',1,1,80.0),
(3,'OFICINA',1,1,140.0),
(4,'COCHERA',0,1,20.0),
(5,'AUDITORIO',0,0,0);



insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idpersona,idtinmueble,idtorre,activo) values
(1,0,0,'Condominio',1,1,100,1),
(2,1,101,'Oficina de Gustavo',2,3,1,1),
(3,2,201,'Departamento de Gustavo',2,2,1,1),
(4,-1,101,'Cochera de Gustavo',2,4,1,1);




