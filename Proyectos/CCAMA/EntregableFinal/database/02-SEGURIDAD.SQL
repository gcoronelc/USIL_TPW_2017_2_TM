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

CREATE TABLE ROL
(
	idrol                INTEGER NOT NULL,
	nomrol               VARCHAR(40) NOT NULL,
	CONSTRAINT PK_ROL PRIMARY KEY (idrol)
) ENGINE=INNODB;

INSERT INTO ROL(IDROL, nomrol) VALUES
(1,'PROPIETARIO'),
(2,'ADMINISTRADOR'),
(3,'DIRECTIVO'),
(4,'SECRETARIA');

CREATE TABLE USUARIO
(
	idpersona            INTEGER NOT NULL,
	usuario              VARCHAR(60) NOT NULL,
	clave                VARCHAR(60) NOT NULL,
	idrol                INTEGER NOT NULL,
	estado               SMALLINT NOT NULL 
                         DEFAULT 0 
						 CHECK ( estado IN (0,1) ),
	CONSTRAINT PK_USUARIO PRIMARY KEY (idpersona),
	FOREIGN KEY FK_USUARIO_PERSONA (idpersona) 
		REFERENCES PERSONA (idpersona),
	FOREIGN KEY FK_USUARIO_ROL (idrol) 
		REFERENCES ROL (idrol)
) ENGINE=INNODB;


INSERT INTO USUARIO(IDPERSONA,USUARIO,CLAVE,IDROL,ESTADO) VALUES
(2,'gustavo',SHA('gustavo'),1,1),
(3,'barbara',SHA('barbara'),3,1),
(9,'claudia',SHA('claudia'),2,1);

