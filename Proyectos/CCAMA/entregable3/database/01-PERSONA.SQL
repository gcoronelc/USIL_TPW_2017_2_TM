/*
Empresa        :  EGCC
Software       :  Sistema de Gestion de condominios
DBMS           :  MySQL Server
Base de Datos  :  CONDOMINIO
Script         :  Crea esquema PERSONA
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

CREATE TABLE TPERSONA
(
	idtpersona           INTEGER NOT NULL,
	nomtpersona               VARCHAR(40) NOT NULL,
	CONSTRAINT PK_TPERSONA PRIMARY KEY (idtpersona)
) ENGINE=INNODB;

INSERT INTO TPERSONA(IDTPERSONA,nomtpersona) VALUES
(1,'CONDOMINIO'),
(2,'PROPIETARIO'),
(3,'ADMINISTRADOR'),
(4,'DIRECTIVO'),
(5,'SECRETARIA');


CREATE TABLE PERSONA
(
	idpersona            INTEGER AUTO_INCREMENT,
	idtpersona           INTEGER NOT NULL,
	apellido             VARCHAR(60) NOT NULL,
	nombre               VARCHAR(60) NOT NULL,
	dni                  VARCHAR(20) NOT NULL,
	email                VARCHAR(60) NOT NULL,
	telefono             VARCHAR(20) NOT NULL,
	direccion            VARCHAR(100) NOT NULL,
	CONSTRAINT PK_PERSONA PRIMARY KEY (idpersona),
	FOREIGN KEY FK_PERSONA_TPERSONA (idtpersona) 
	   REFERENCES TPERSONA (idtpersona)
) ENGINE=INNODB;

INSERT INTO PERSONA(IDPERSONA,IDTPERSONA,APELLIDO,
NOMBRE,DNI,EMAIL,TELEFONO,DIRECCION ) VALUES
(1,1,'CONDOMINIO','CONDOMINIO','89435678','CONDOMINIO@GMAIL.COM','657346578','MI CASA'),
(2,2,'CORONEL','GUSTAVO','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(3,2,'SALAZAR','BARBARA','65782345','BARBARA@GMAIL.COM','657346578','MI CASA'),
(4,2,'DEL AGUILA','FIORELLA','98345678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(5,2,'ALFARO','CARLOS','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(6,2,'LABAN ','CYNTHYA','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(7,2,'DIAZ','MANUEL','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(8,2,'CONDOR','JOSE','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(9,3,'ORIA ','CLAUDIA','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(10,4,'CHOQUECAHUANA ','JAVIER','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA'),
(11,5,'PRIETO','STHEPHANY','89435678','GUSTAVO@GMAIL.COM','657346578','MI CASA');






