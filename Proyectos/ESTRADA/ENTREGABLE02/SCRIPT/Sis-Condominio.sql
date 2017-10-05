
drop database if exists sis_condominio;
create database sis_condominio;
use sis_condominio;
set names "utf8";

create table usuario (
	id_usuario char(4) not null,
	nombres varchar(40) not null,
	ape_pat varchar(40) not null,
	ape_mat varchar(40) not null,
	dni char(8) not null,
	constraint PK_USUARIO primary key (id_usuario)
);

create table detalle_usuario(
    id_usuario char(4) not null,
    usuario varchar(15) not null,
    clave varchar(15) not null,
    estado numeric(1,0) not null check (estado in (1,0)) ,
    constraint PK_DETALLE_USUARIO primary key(id_usuario),
    constraint FK_DETALLE_USUARIO_USUARIO foreign key(id_usuario) references USUARIO(id_usuario)
);

/*
create table modulo(
     id_modulo integer not null,
     nomModulo varchar(30) not null,
     estado integer not null,
     constraint PK_MODULO primary key(id_modulo)
)

create table permiso(
     id_modulo integer not null,
     id_usuario char(5) not null,
     estado numeric(1,0) not null check (estado in (1,0)),
     constraint PK_PERMISO primary key(id_modulo,id_usuario),
     constraint FK_PERMISO_MODULO foreign key(id_modulo) references MODULO(id_modulo),
     constraint FK_PERMISO_DETALLE_USUARIO foreign key(id_usuario) references DETALLE_USUARIO(id_usuario)
)
*/

create table session(
    id_session integer not null,
    id_usuario char(4) not null,
    fecIngreso datetime not null,
    fecSalida datetime not null,
    constraint PK_SESSION primary key(id_session),
    constraint FK_SESSION_USUARIO foreign key(id_usuario) references USUARIO(id_usuario)
);

create table propietario (
	id_propietario char(4) not null,
	id_usuario char(4) not null,
	fec_ini date not null,
	fec_fin date null,
	detalle varchar(120) not null,
	constraint PK_PROPIETARIO primary key (id_propietario),
	constraint FK_PROPIETARIO_USUARIO foreign key (id_usuario) references usuario(id_usuario)
);

create table administrador(
    id_administrador char(4) not null,
    id_usuario char(4) not null,
    descripcion varchar(150) not null,
    constraint PK_ADMINISTRADOR primary key (id_administrador),
	constraint FK_ADMINISTRADOR_USUARIO foreign key (id_usuario) references usuario(id_usuario)
);

create table evento (
	id_evento CHAR(4) not null,
	id_propietario  char(4) not null,
	nombre varchar(20) not null,
	descripcion varchar(100) null,
	FechaAlqui datetime not null,
    FechaFin datetime not null,
	estado numeric(1,0) not null check (estado in (1,0)),
	constraint PK_EVENTO primary key (id_evento),
	constraint FK_EVENTO_PROPIETARIO foreign key (id_propietario) references Propietario(id_propietario)
);

create table edificio (
	id_edificio char(4),
	nombre varchar(35) not null,
	nro_pisos integer not null,
	descripcion varchar(100) null,
	estado numeric(1,0) not null check (estado in (1,0)) ,
	constraint PK_edificio primary key (id_edificio)
);

create table detalle_inmueble(
	id_detalle char(5) not null,
	tipo_inmueble varchar(50) not null,
	constraint PK_DETALLE_INMUEBLE primary key(id_detalle)
);


create table inmueble (
	id_inmueble char(4) not null,
	id_detalle char(5) not null,
	id_propietario char(4) not null,
	id_edificio char(4) not null,
	nombre varchar(50) not null,
	nro_piso integer not null,
	descripcion varchar(100)null,
	estado numeric(1,0) not null check (estado in (1,0)),
	constraint PK_INMUEBLE primary key (id_inmueble),
	constraint FK_INMUEBLE_PROPIETARIO foreign key (id_propietario) references propietario(id_propietario),
	constraint FK_INMUEBLE_DETALLE_INMUEBLE foreign key(id_detalle) references detalle_inmueble(id_detalle),
	constraint FK_INMUEBLE_EDIFICIO foreign key (id_edificio) references edificio(id_edificio)
);


create table pago (
	id_pago char(5) not null,
	id_propietario char(4) not null,
	id_inmueble char(4) not null,
	estado numeric(1,0) not null check (estado in (1,0)),
	constraint PK_PAGO primary key (id_pago),
	constraint FK_PAGO_INMUEBLE foreign key (id_inmueble) references inmueble(id_inmueble),
	constraint FK_PAGO_PROPIRTARIO foreign key (id_propietario) references Propietario(id_propietario)
);

create table detalle_gastos(
id_detGatos char(5)not null,
nombre varchar(50) not null,
constraint PK_DETALLE_GASTO primary key(id_detGatos)
);

create table gasto (
	id_gasto char(4) not null,
	id_detGatos char(5) not null,
	id_pago char(5) not null,
	tipo varchar(40) not null ,
	monto numeric(8,2) not null ,
	descripcion varchar(100) null,
	fecha datetime not null,
	estado numeric(1,0) not null check  (estado in (1,0)),
	constraint PK_GASTO primary key (id_gasto),
	constraint FK_GASTO_DETALLE_GASTO foreign key(id_detGatos) references detalle_gastos(id_detGatos),
	constraint FK_GASTO_PAGO foreign key(id_pago) references pago(id_pago)
);

create table ingreso (
	id_ingreso char(5) not null,
	id_pago char(5) not null,
	tipo varchar(40) not null,
	monto numeric(8,2) not null,
	descripcion varchar(100) null,
	fecha datetime not null,
	estado numeric(1,0) not null check  (estado in (1,0)),
	constraint PK_INGRESO primary key (id_ingreso),
	constraint FK_INGRESO_PAGO foreign key(id_pago) references pago(id_pago)
);



INSERT INTO usuario (id_usuario, nombres, ape_pat, ape_mat, dni) VALUES ('U001', 'Sadith', 'Mayta', 'Perez', '72000428');
INSERT INTO usuario (id_usuario, nombres, ape_pat, ape_mat, dni) VALUES ('U002', 'Cynthya', 'Estrada', 'Huarhua', '74125896');
INSERT INTO usuario (id_usuario, nombres, ape_pat, ape_mat, dni) VALUES ('U003', 'Miguel', 'Perez', 'Perez', '12345678');
INSERT INTO usuario (id_usuario, nombres, ape_pat, ape_mat, dni) VALUES ('U004', 'Juan', 'Deza', 'Deza', '78965412');

INSERT INTO propietario (id_propietario, id_usuario, fec_ini, fec_fin, detalle) VALUES ('P001', 'U001', '2017-09-19', '2017-09-30', 'Propietario de Inmueble 01');
INSERT INTO propietario (id_propietario, id_usuario, fec_ini, fec_fin, detalle) VALUES ('P002', 'U002', '2017-09-03', '2017-09-30', 'Propietario inmueble 02');

INSERT INTO administrador (id_administrador, id_usuario, descripcion) VALUES ('A001', 'U003', 'Administrador 01');
INSERT INTO administrador (id_administrador, id_usuario, descripcion) VALUES ('A002', 'U004', 'Administrador 02');

INSERT INTO detalle_usuario (id_usuario, usuario, clave, estado) VALUES ('U001', 'sadith.mayta', 'mayta', 1);
INSERT INTO detalle_usuario (id_usuario, usuario, clave, estado) VALUES ('U002', 'cynthya.estrada', 'estrada', 1);
INSERT INTO detalle_usuario (id_usuario, usuario, clave, estado) VALUES ('U003', 'mighel.perez', 'perez', 1);
INSERT INTO detalle_usuario (id_usuario, usuario, clave, estado) VALUES ('U004', 'juan.deza', 'deza', 1);

/*
INSERT INTO modulo (id_modulo, nomModulo, estado)
VALUES (1, 'Consultar usuarios', 1),
       (2, 'Consulta de Pagos', 1),
       (3, 'Registro de Propietarios', 1),
       (4, 'Registro de Eventos', 1),
       (5, 'Registro de Pagos', 1),
       (6, 'Consulta de Inmuebles', 1);

INSERT INTO permiso (id_modulo, id_usuario, estado)
VALUES (2, 'U001', 1),
       (2, 'U002', 1),
       (1, 'U003', 1),
       (2, 'U003', 1),
       (3, 'U003', 1),
       (4, 'U003', 1),
       (5, 'U003', 1),
       (6, 'U003', 1),
       (3, 'U004', 1),
       (4, 'U004', 1),
       (5, 'U004', 1);

*/
INSERT INTO evento (id_evento, id_propietario, nombre, descripcion,FechaAlqui,FechaFin,estado) VALUES ('E001', 'P001', 'CUMPLEAÑOS', 'CUMPLEAÑOS DEL PROPIETARIOS DEL INMUEBLE 04','2017-09-26 08:00:23','2017-09-27 08:00:23', 1);
INSERT INTO evento (id_evento, id_propietario, nombre, descripcion,FechaAlqui,FechaFin,estado) VALUES ('E002', 'P002', 'FIESTA', 'FIESTA ORGANIZADA POR EL PROPIETARIOS DEL INMUEBLE 05','2017-09-27 10:00:00','2017-09-28 10:00:00', 1);

INSERT INTO edificio (id_edificio, nombre, nro_pisos, descripcion, estado) VALUES ('ED01', 'AURORA', 12, 'EDIFICIO AURORA DE 12 PISOS, CON UNA VISTA ESPECTACULAR', 1);
INSERT INTO edificio (id_edificio, nombre, nro_pisos, descripcion, estado) VALUES ('ED02', 'TORRE BLANCA', 13, 'TORRE BLANCA, UN EDIFICIO TRANQUILO Y BIEN ORDENADI', 1);

INSERT INTO detalle_inmueble (id_detalle, tipo_inmueble) VALUES ('DI001', 'Departamento');
INSERT INTO detalle_inmueble (id_detalle, tipo_inmueble) VALUES ('DI002', 'Cochera');
INSERT INTO detalle_inmueble (id_detalle, tipo_inmueble) VALUES ('DI003', 'Oficina');

INSERT INTO inmueble (id_inmueble, id_detalle, id_propietario, id_edificio, nombre, nro_piso, descripcion, estado) VALUES ('I001', 'DI001', 'P001', 'ED01', 'Departamento 201', '2', 'Despartamento, en perfecto estado', 1);
INSERT INTO inmueble (id_inmueble, id_detalle, id_propietario, id_edificio, nombre, nro_piso, descripcion, estado) VALUES ('I002', 'DI002', 'P001', 'ED01', 'Cochera de alta seguridad', '1', 'cochera de alta seguridad, para 10 camionetas', 1);
INSERT INTO inmueble (id_inmueble, id_detalle, id_propietario, id_edificio, nombre, nro_piso, descripcion, estado) VALUES ('I003', 'DI001', 'P002', 'ED02', 'Deperatmento 201', '2', 'Mini departamento, de maxima seguridad', 1);
INSERT INTO inmueble (id_inmueble, id_detalle, id_propietario, id_edificio, nombre, nro_piso, descripcion, estado) VALUES ('I004', 'DI002', 'P002', 'ED02', 'Cochera 5', '1', 'Cochera 5, 7 metros cuadrados', 1);

INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA001', 'P001', 'I001', 1);
INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA002', 'P001', 'I002', 1);
INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA003', 'P002', 'I003', 1);
INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA004', 'P002', 'I004', 1);
INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA005', 'P001', 'I001', 1);
INSERT INTO pago (id_pago, id_propietario, id_inmueble, estado) VALUES ('PA006', 'P002', 'I003', 1);

INSERT INTO ingreso (id_ingreso, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('IN001', 'PA001', 'Efectivo', 2000, 'PAGO MENSULA DE CONDOMINIO', '2017-09-21 07:43:28', 1);
INSERT INTO ingreso (id_ingreso, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('IN002', 'PA002', 'EFECTIVO', 500, 'PAGO MENSUAL DE COCHERA', '2017-09-22 03:18:12', 1);
INSERT INTO ingreso (id_ingreso, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('IN003', 'PA003', 'EFECTIVO', 1500, 'PAGO MENSUAL DE DEPARTAMENTO', '2017-09-21 03:10:20', 1);
INSERT INTO ingreso (id_ingreso, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('IN004', 'PA004', 'EFECTIVO', 600, 'PAGO MENSUAL DE COCHERA', '2017-09-14 06:00:00', 1);

INSERT INTO detalle_gastos (id_detGatos, nombre) VALUES ('DG001', 'Servicios Públicos');
INSERT INTO detalle_gastos (id_detGatos, nombre) VALUES ('DG002', 'Mantenimiento de Equipos');
INSERT INTO detalle_gastos (id_detGatos, nombre) VALUES ('DG003', 'Personal');
INSERT INTO detalle_gastos (id_detGatos, nombre) VALUES ('DG004', 'Servicios de Terceros');
INSERT INTO detalle_gastos (id_detGatos, nombre) VALUES ('DG005', 'Insumos y Materiales');

INSERT INTO gasto (id_gasto, id_detGatos, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('G001', 'DG001', 'PA005', 'CREADITO', 50, 'AGUA', '2017-09-26 08:00:23', 1);
INSERT INTO gasto (id_gasto, id_detGatos, id_pago, tipo, monto, descripcion, fecha, estado) VALUES ('G002', 'DG001', 'PA006', 'EFECTIVO', 80, 'LUZ', '2017-09-06 09:19:25', 1);
