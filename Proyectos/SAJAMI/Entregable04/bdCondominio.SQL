
-- =============================================
-- Creación de la Base de Datos
-- =============================================

DROP DATABASE IF EXISTS CONDOMINIO;

CREATE DATABASE CONDOMINIO;


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE CONDOMINIO;
SET NAMES 'utf8';


-- =============================================
-- Creación del Usuario
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'condominio'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'condominio'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE CONDOMINIO;

-- =============================================
-- Creación de tablas
-- =============================================

CREATE TABLE TPERSONA
(
	idtpersona           INTEGER NOT NULL,
	nombre               VARCHAR(40) NOT NULL,
	CONSTRAINT PK_TPERSONA PRIMARY KEY (idtpersona)
) ENGINE=INNODB;

INSERT INTO TPERSONA(IDTPERSONA,NOMBRE) VALUES
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
	estado               SMALLINT NOT NULL 
                         DEFAULT 1 
						 CHECK ( estado IN (0,1) ),
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

CREATE TABLE ROL
(
	idrol                INTEGER NOT NULL,
	nombre               VARCHAR(40) NOT NULL,
	CONSTRAINT PK_ROL PRIMARY KEY (idrol)
) ENGINE=INNODB;

INSERT INTO ROL(IDROL, NOMBRE) VALUES
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

CREATE TABLE TORRE
(
	idtorre              INTEGER NOT NULL,
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
-- Inserccion de Datos en la Tabla TORRE
-- =============================================



insert into TORRE(idtorre,nombre) values
(100,'TORRE VIRTUAL'),
(99,'TORRE AUDITORIO'),
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



insert into INMUEBLE(idinmueble,piso,numero,descripcion,
idpersona,idtinmueble,idtorre,activo) values
(1,0,0,'Condominio',1,1,100,1),
(2,1,101,'Oficina de Gustavo',2,3,1,1),
(3,2,201,'Departamento de Gustavo',2,2,1,1),
(4,-1,101,'Cochera de Gustavo',2,4,1,1),
(9999,1,101,'Auditorio para eventos',1,5,99,1);


CREATE TABLE TOBLIGACION
(
	idtobligacion        INTEGER NOT NULL,
	nombre               VARCHAR(60) NOT NULL,
	PRIMARY KEY PK_TOBLIGACION(idtobligacion)
) ENGINE=INNODB;



CREATE TABLE RECIBO
(
	idrecibo             INTEGER NOT NULL AUTO_INCREMENT,
	idtobligacion        INTEGER NOT NULL,
	codigo               VARCHAR(20) NOT NULL,
	anio                 INTEGER NOT NULL,
	mes                  INTEGER NOT NULL,
	fecVen               DATE NOT NULL,
	importe              NUMERIC(12,2) NOT NULL,
	estadoOb			 SMALLINT NOT NULL 
                         DEFAULT 0 
						 CHECK ( estado IN (0,1) ),
	PRIMARY KEY PK_RECIBO(idrecibo),
	FOREIGN KEY FK_RECIBO_TOBLIGACION (idtobligacion) REFERENCES TOBLIGACION (idtobligacion)
) ENGINE=INNODB;



CREATE TABLE OBLIGACION
(
	idobligacion         INTEGER NOT NULL AUTO_INCREMENT,
	idtobligacion        INTEGER NOT NULL,
	idinmueble           INTEGER NOT NULL,
	descripcion          VARCHAR(200) NOT NULL,
	anio                 INTEGER NOT NULL,
	mes                  INTEGER NOT NULL,
	importe              NUMERIC(12,2) NOT NULL,
	aud_idpersona        INTEGER NOT NULL,
	aud_fecha            DATE NOT NULL,
	PRIMARY KEY PK_OBLIGACION(idobligacion),
	FOREIGN KEY FK_OBLIGACION_TOBLIGACION (idtobligacion) REFERENCES TOBLIGACION (idtobligacion),
	FOREIGN KEY FK_OBLIGACION_INMUEBLE (idinmueble) REFERENCES INMUEBLE (idinmueble),
	FOREIGN KEY FK_AUD_OBLIGACION_PERSONA (aud_idpersona) REFERENCES PERSONA (idpersona)
) ENGINE=INNODB;



-- =============================================
-- Inserccion de Datos de la Tabla TOBLIGACION
-- =============================================

insert into TOBLIGACION(idtobligacion,nombre) values
(1,'MANTENIMIENTO'),
(2,'AGUA'),
(3,'OTROS');


insert into RECIBO(idrecibo,idtobligacion,codigo,         
anio,mes,fecVen,importe) values
(1,2,'R-235489',2017,11,'2017-11-30',300.0);


insert into OBLIGACION(idtobligacion,idinmueble,descripcion,  
anio,mes,importe,aud_idpersona,aud_fecha) 
SELECT 2, i.idinmueble, 'Agua del 2017-11',2017,11, 
(select importe from recibo where idtobligacion = 2 and anio=2017 and mes = 11) /
(select count(*) from tinmueble ti join inmueble i on ti.idtinmueble = i.idtinmueble where ti.agua = 1), 
i.idpersona, sysdate()
FROM tinmueble ti join inmueble i 
on ti.idtinmueble = i.idtinmueble
where ti.agua = 1;

UPDATE recibo set estadoOb=1 where idrecibo=1;

CREATE TABLE HISTORIALINMUEBLE(
idinmueble 				INTEGER NOT NULL,
idpersona 				INTEGER NOT NULL,
fecha_inscrip 			DATE NOT NULL,
FOREIGN KEY FK_HISTORIALINMUEBLE_INMUEBLE (idinmueble) REFERENCES INMUEBLE (idinmueble),
FOREIGN KEY FK_HISTORIALINMUEBLE_PERSONA (idpersona) REFERENCES PERSONA (idpersona)
)ENGINE=INNODB;



INSERT INTO HISTORIALINMUEBLE(idinmueble,idpersona,fecha_inscrip) VALUES
(2,8,'2017-07-02'),
(3,9,'2017-08-25'),
(4,10,'2017-09-09');


CREATE TABLE RESERVA
(
idobligacion INT NOT NULL,
reserva DATE NOT NULL,
FOREIGN KEY FK_RESERVA_OBLIGACION (idobligacion) REFERENCES OBLIGACION (idobligacion)
)ENGINE=INNODB;



create view V_PERSONA(
idpersona, apellido, nombre, tipo, nomtipo,
dni, email, telefono, direccion, estado
) as
select p.idpersona, p.apellido, p.nombre,
p.idtpersona, t.nombre, p.dni, p.email,
p.telefono, p.direccion, p.estado
from tpersona t 
join persona p on t.idtpersona = p.idtpersona;

CREATE VIEW V_INMUEBLE(
inmueble, tipo, nomtipo, torre, nomtorre, piso,
numero, descripcion, activo, propietario,
nompropietario, agua, mantenimiento, cuota
) AS
SELECT 
	I.IDINMUEBLE, TI.IDTINMUEBLE, TI.NOMBRE,
	T.IDTORRE, T.NOMBRE, I.PISO, I.NUMERO,
	I.DESCRIPCION, I.ACTIVO, P.IDPERSONA,
	CONCAT(P.APELLIDO,', ',P.NOMBRE) NOMBRE,
	TI.AGUA, TI.MANTE, TI.CMANTE
FROM TINMUEBLE TI
JOIN INMUEBLE I ON TI.IDTINMUEBLE = I.IDTINMUEBLE
JOIN TORRE T ON I.IDTORRE = T.IDTORRE
JOIN PERSONA P ON I.IDPERSONA = P.IDPERSONA;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertaObligacionAgua`(IN `id` INT)
begin
declare annio int(11);
declare mmes int(11);
set annio=(select  anio from recibo where idrecibo=id);
set mmes=(select  mes from recibo where idrecibo=id);
insert into OBLIGACION(idtobligacion,idinmueble,descripcion,  
anio,mes,importe,aud_idpersona,aud_fecha) 
SELECT 2, i.idinmueble, 'Pago de Agua del mes ',annio,mmes, 
(select importe from recibo where idrecibo=id) /
(select count(*) from tinmueble ti join inmueble i on ti.idtinmueble = i.idtinmueble where ti.agua = 1), 
i.idpersona, sysdate()
FROM tinmueble ti join inmueble i 
on ti.idtinmueble = i.idtinmueble
where ti.agua = 1;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertaEvento`(IN `idpe` INT(11), IN `fechare` DATE, IN `descr` VARCHAR(100), IN `limp` INT(11))
    NO SQL
BEGIN
DECLARE ido int;
insert into obligacion (idtobligacion, idinmueble, descripcion, anio, mes, importe, aud_idpersona,aud_fecha) values (3,9999,descr,(select YEAR(NOW())),(select MONTH (NOW()) as mes),150+limp,idpe,sysdate());

set ido=(select LAST_INSERT_ID());

insert into reserva (idobligacion,reserva) values (ido,fechare);
END$$
DELIMITER ;
	





