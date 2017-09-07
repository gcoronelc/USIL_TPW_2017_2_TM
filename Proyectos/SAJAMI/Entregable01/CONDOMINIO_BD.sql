USE CONDOMINIO1;

CREATE TABLE GASTOS_CONDOMINIO(
ID_GASTOS_CONDOMINIO CHAR(5) PRIMARY KEY,
SERVICIOS_PUBLICOS DECIMAL(8,2),
MANTENIMIENTO_EQUIPOS DECIMAL(8,2),
PERSONAL DECIMAL(8,2),
SERVICIOS_TERCEROS DECIMAL(8,2),
INSUMOS DECIMAL(8,2)
);
CREATE TABLE SERVICIO_AGUA(
ID_SERVICIO_AGUA CHAR(5) PRIMARY KEY
);
CREATE TABLE AUDITORIO(
ID_AUDITORIO CHAR(5)PRIMARY KEY,
PRECIO_EVENTO DECIMAL(8,2),
FECHA_PAGO DATE,
FECHA_EVENTO DATE,
ESTADO_AUDITORIO VARCHAR(20),
PAGOS_ADMINISTRATIVOS DECIMAL(8,2)
);
CREATE TABLE PROPIETARIO(
ID_PROPIETARIO CHAR(5) PRIMARY KEY,
DNI INT,
NOMBRES VARCHAR(60),
APELLIDOS VARCHAR(60),
ID_INMUEBLE INT,
ESTADO_CUENTA DECIMAL(8,2),
ID_AUDITORIO CHAR(5),
FOREIGN KEY (ID_AUDITORIO) REFERENCES AUDITORIO (ID_AUDITORIO)
);
CREATE TABLE TIPO_INMUEBLE(
ID_TIPO_INMUEBLE CHAR(5) PRIMARY KEY,
TIPO VARCHAR(20)
);
CREATE TABLE INMUEBLE(
ID_INMUEBLE CHAR(5) PRIMARY KEY,
ID_PROPIETARIO CHAR(5),
ID_SERVICIO_AGUA CHAR(5),
ID_TIPO_INMUEBLE CHAR(5),
TIPO_INMUEBLE VARCHAR(30),
CANTIDAD_INMUEBLE INT,
UBICACION_INMUEBLE VARCHAR(100),
FECHA_COMPRA DATE,
FOREIGN KEY (ID_PROPIETARIO) REFERENCES PROPIETARIO (ID_PROPIETARIO),
FOREIGN KEY (ID_SERVICIO_AGUA) REFERENCES SERVICIO_AGUA (ID_SERVICIO_AGUA),
FOREIGN KEY (ID_TIPO_INMUEBLE) REFERENCES TIPO_INMUEBLE (ID_TIPO_INMUEBLE)
);
CREATE TABLE REPORTE_INMUEBLE(
ID_REPORTE_INMUEBLE CHAR(5) PRIMARY KEY,
ID_INMUEBLE  CHAR(5),
ID_PROPIETARIO CHAR(5),
ESTADO_CUENTA_INMUEBLE DECIMAL(8,2),
INGRESOS DECIMAL(8,2),
GASTOS DECIMAL(8,2),
ESTADO_FINANCIERO DECIMAL(8,2),
FOREIGN KEY (ID_INMUEBLE) REFERENCES INMUEBLE (ID_INMUEBLE),
FOREIGN KEY (ID_PROPIETARIO) REFERENCES PROPIETARIO (ID_PROPIETARIO)
);
CREATE TABLE MANTENIMIENTO(
ID_MANTENIMIENTO CHAR(5) PRIMARY KEY,
ID_INMUEBLE CHAR(5),
DIAS_PAGO DATE,
SALDO_TOTAL DECIMAL(8,2),
FOREIGN KEY (ID_INMUEBLE) REFERENCES INMUEBLE (ID_INMUEBLE)
);


