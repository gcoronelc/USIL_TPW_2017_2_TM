/*
Empresa        :  EGCC
Software       :  Sistema de Gestion de condominios
DBMS           :  MySQL Server
Base de Datos  :  CONDOMINIO
Script         :  Crea esquema OBLIGACIONES
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

CREATE TABLE TOBLIGACION
(
	idtobligacion        INTEGER NOT NULL,
	nomtobligacion               VARCHAR(60) NOT NULL,
	PRIMARY KEY PK_TOBLIGACION(idtobligacion)
) ENGINE=INNODB;



CREATE TABLE RECIBO
(
	idrecibo             INTEGER NOT NULL,
	idtobligacion        INTEGER NOT NULL,
	codigo               VARCHAR(20) NOT NULL,
	anio                 INTEGER NOT NULL,
	mes                  INTEGER NOT NULL,
	fecVen               DATE NOT NULL,
	importe              NUMERIC(12,2) NOT NULL,
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
);



-- =============================================
-- Datos de tablas
-- =============================================

insert into TOBLIGACION(idtobligacion,nomtobligacion) values
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
11, sysdate()
FROM tinmueble ti join inmueble i 
on ti.idtinmueble = i.idtinmueble
where ti.agua = 1;




