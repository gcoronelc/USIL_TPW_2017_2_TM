
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
(1,'gustavo',SHA('gustavo'),1,1),
(2,'barbara',SHA('barbara'),3,1),
(8,'claudia',SHA('claudia'),2,1);
