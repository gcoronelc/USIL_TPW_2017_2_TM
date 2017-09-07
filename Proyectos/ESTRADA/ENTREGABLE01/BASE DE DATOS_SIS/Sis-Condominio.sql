
--drop database sis_condominio;

create database sistem_condominio;
go

use sistem_condominio
go
--set names "utf8";
create table edificio (
	id_edificio integer identity,	
	nombre varchar(35) not null,
	nro_pisos numeric(2,0) not null,
	descripcion varchar(100) null,
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_edificio primary key (id_edificio)
)
go

create table gasto (
	id_gasto integer identity,
	tipo varchar(40) not null ,	
	monto numeric(8,2) not null ,
	descripcion varchar(100) null,
	fecha date not null,
	estado numeric(1,0) not null check  (estado in (1,0)), 
	constraint PK_GASTO primary key (id_gasto)	
)
go

create table ingreso (
	id_ingreso integer identity ,
	tipo varchar(40) not null ,	
	monto numeric(8,2) not null,
	descripcion varchar(100) null,
	fecha date not null,
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_INGRESO primary key (id_ingreso)	
)
go

create table bono(
     id_bono integer identity,
	 bono decimal(3,2),
     fecha date not null,
     id_gasto integer not null,
     id_ingreso integer not null,
     constraint PK_BONO primary key (id_bono),
     constraint FK_BONO_INGRESO foreign key (id_ingreso)referEnces INGRESO (id_ingreso),
     constraint FK_BONO_GASTO foreign key(id_gasto)references GASTO(id_gasto)
)
go

create table usuario (
	id_usuario integer identity,
	nombres varchar(40) not null,
	ape_pat varchar(40) not null,
	ape_mat varchar(40) not null,
	dni char(8) not null,
	estado numeric(1,0) not null check  (estado in (1,0)), 
	constraint PK_USUARIO primary key (id_usuario)
)
go

create table propietario (
	id_propietario integer identity,
	id_usuario integer,
	fec_ini date not null,
	fec_fin date null,
	correo varchar(60) not null,
	clave varchar(60) not null ,
	estado numeric(1,0) not null check (estado in (1,0)),
	constraint PK_PROPIETARIO primary key (id_propietario),
	constraint FK_PROPIETARIO_USUARIO foreign key (id_usuario) references usuario(id_usuario)	
)
go

create table evento (
	id_evento integer identity,
	id_usuario integer,
	nombre varchar(20) not null ,
	descripcion varchar(100) null,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_EVENTO primary key (id_evento),
	constraint FK_EVENTO_USUARIO foreign key (id_usuario) references usuario(id_usuario)
)
go

create table inmueble (
	id_inmueble integer identity,
	id_propietario integer,
	id_edificio integer,	
	nombre varchar(50) not null,
	nro_piso numeric(2,0) not null,
	descripcion varchar(100)null,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_INMUEBLE primary key (id_inmueble),
	constraint FK_INMUEBLE_PROPIETARIO foreign key (id_propietario) references propietario(id_propietario),
	constraint FK_INMUEBLE_EDIFICIO foreign key (id_edificio) references edificio(id_edificio)
)
go

create table administrador (
	id_administrador integer identity,
	id_usuario integer,
	correo varchar(60) not null,
	clave varchar(60) not null ,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_ADMINISTRADOR primary key (id_administrador),
	constraint FK_ADMINISTRADOR_USUARIO foreign key (id_usuario) references usuario(id_usuario)
)
go

create table pago (
	id_pago integer identity,
	id_usuario integer ,
	id_inmueble integer,
	fec_canc varchar not null, 
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_PAGO primary key (id_pago),
	constraint FK_PAGO_INMUEBLE foreign key (id_inmueble) references inmueble(id_inmueble)
);




--/////////////////////////////////////////////////////////////////////
insert into edificio (nombre,nro_pisos,descripcion,estado) values 
	('Santa Clara', 15, 'Descripcion del edificio' ,1),
	('San Diego', 15,'Descripcion del edificio',1),
	('Company', 15, 'Descripcion del edificio' ,0),
	('San Luis', 15, 'Descripcion del edificio',1)
go

insert into gasto (tipo, monto,descripcion,fecha,estado) values 
	('Mantenimiento', 25.00, 'Mantenimiento a la bomba de agua', '15-05-2017', 1),
	('Luz', 25.00, 'Servicio de energia electrica', '14-11-2014', 0),
	('Agua', 27.00, 'Servicio de agua', '23-01-2015', 1),
	('Limpieza', 30.00, 'Limpieza del auditorio', '14-06-2016', 1)
go

insert into ingreso (tipo, monto,descripcion,fecha,estado) values 
	('Mantenimiento', 25.00, 'Mantenimiento a la bomba de agua', '15-05-2017', 1),
	('Luz', 25.00, 'Servicio de energia electrica', '14-11-2014', 0),
	('Agua', 27.00, 'Servicio de agua', '23-01-2015', 1),
	('Limpieza', 30.00, 'Limpieza del auditorio', '14-06-2016', 1)
go

insert into usuario (nombres,ape_pat,ape_mat,dni,estado) values
	('Cynthya', 'Estrada', 'Huarhua', 841454852,1),
	('Soporte', 'Soporte', 'Soporte', 12345678, 1),
	('Internet', 'Internet', 'Internet',23456789, 1),
	('Sueldo', 'Sueldo', 'Sueldo', 345678912, 0)
go

insert into propietario (id_usuario,fec_ini,fec_fin,correo,clave,estado) values
	(1,'01-01-2017', '','cynthya.estrada@gmail.com', 'suerte',1),
	(1,'21-03-2015','','sadith.estrada@gmail.com', 'suerte',1),
	(1,'22-04-2016','','juan.estrada@gmail.com', 'suerte',1),
	(2,'02-04-2016', '','Ana.sistemas@gmail.com','soporte',1),
	(2,'09-02-2015', '','soporte.sistemas@gmail.com', 'soporte',1)
go

insert into inmueble (id_propietario,id_edificio,nombre,nro_piso,descripcion,estado) values
	(1,1,'Departamento', 12, 'Departamento Incluido jacuzzi', 1),
	(1,1,'Oficina', 12, 'Oficina adminitrativa', 1),
	(1,1,'Cochera', 1, 'Cochera sport', 1),
	(2,2,'Departamento', 12, 'Departamento Familiar', 1),
	(2,2,'Cochera', 1, 'Cochera de trabajo', 1),
	(2,3,'Oficina', 12, 'Oficina de ventas', 1)
go

insert into administrador (id_usuario,correo,clave,estado) values
	(3, 'internet.internet@gmail.com', 'internet', 1),
	(4, 'sueldo.sueldo@gmail.com', 'sueldo', 1)


insert into pago (id_usuario,id_inmueble,fec_canc,estado) values
	(1,2,'20170214',0),
	(1,3,'20170522',0),
	(2,1,'20170431',1),
	(2,4,'20170601',1),
	(2,2,'20170908',1),
	(1,3,'20161205',0)
;


SELECT*FROM edificio