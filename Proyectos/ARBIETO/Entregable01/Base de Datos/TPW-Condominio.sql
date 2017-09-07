/*
	Empresa        :  MUCHO SOFTWARE
	Proyecto	   :  CONDOSOFT
	Grupo		   :  TECNOSOFTWARE
	Software       :  Sistema de Administración de Condominio
	DBMS           :  MySQL	
	Herramienta    :  Spring Framework.
	Script         :  Crear la base de datos con sus respectivas tablas.
	Integrantes	   :  Oria Bastos Jesús Caleb
					  Arbieto Chávez Julio César
					  Salazar Perez José Luis
					  Breña Taipe Emiliano
					  Muñoz Sosaya Jhoel
	Email          :  almostperfect557@gmail.com
	Creado el      :  23-AGO-2017
	Actualizada    :  04-SEP-2017  
*/
drop database if exists condominio;
create database condominio;
use condominio;
set names "utf8";
create table edificio (
	id_edificio integer AUTO_INCREMENT,	
	nombre varchar(35) not null,
	nro_pisos numeric(2,0) not null,
	descripcion tinytext null,
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_edificio primary key (id_edificio)
);
create table cuota (
	id_cuota integer AUTO_INCREMENT,
	tipo varchar(40) not null,	
	monto numeric(8,2) not null,
	descripcion tinytext null,
	fecha date not null,
	estado numeric(1,0) not null check  (estado in (1,0)), 
	constraint PK_CUOTA primary key (id_cuota)	
);
create table gasto (
	id_gasto integer AUTO_INCREMENT,
	tipo varchar(40) not null ,	
	monto numeric(8,2) not null ,
	descripcion tinytext null,
	fecha date not null,
	estado numeric(1,0) not null check  (estado in (1,0)), 
	constraint PK_GASTO primary key (id_gasto)	
);
create table ingreso (
	id_ingreso integer AUTO_INCREMENT ,
	tipo varchar(40) not null ,	
	monto numeric(8,2) not null,
	descripcion tinytext null,
	fecha date not null,
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_INGRESO primary key (id_ingreso)	
);
create table usuario (
	id_usuario integer AUTO_INCREMENT,
	nombres varchar(40) not null,
	ape_pat varchar(40) not null,
	ape_mat varchar(40) not null,
	dni char(8) not null,
	estado numeric(1,0) not null check  (estado in (1,0)), 
	constraint PK_USUARIO primary key (id_usuario)
);
create table propietario (
	id_propietario integer AUTO_INCREMENT,
	id_usuario integer,
	fec_ini date not null,
	fec_fin date null,
	estado numeric(1,0) not null check (estado in (1,0)),
	constraint PK_PROPIETARIO primary key (id_propietario),
	constraint FK_PROPIETARIO_USUARIO foreign key (id_usuario) references usuario(id_usuario)	
);
create table evento (
	id_evento integer AUTO_INCREMENT,
	id_usuario integer,
	nombre varchar(20) not null ,
	descripcion tinytext null,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_EVENTO primary key (id_evento),
	constraint FK_EVENTO_USUARIO foreign key (id_usuario) references usuario(id_usuario)
);
create table inmueble (
	id_inmueble integer AUTO_INCREMENT,
	id_propietario integer,
	id_edificio integer,	
	nombre varchar(50) not null,
	nro_piso numeric(2,0) not null,
	descripcion tinytext null,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_INMUEBLE primary key (id_inmueble),
	constraint FK_INMUEBLE_PROPIETARIO foreign key (id_propietario) references propietario(id_propietario),
	constraint FK_INMUEBLE_EDIFICIO foreign key (id_edificio) references edificio(id_edificio)
);
create table visita (
	id_visita integer AUTO_INCREMENT,
	id_edificio integer,
	nro_piso numeric(2,0) not null,
	nombres varchar(40) not null,
	ape_pat varchar(20) not null,
	ape_mat varchar(20) not null,
	dni char(8) not null,
	fecha date not null,
	hora time not null,
	constraint PK_VISITA primary key (id_visita),
	constraint FK_VISITA_EDIFICIO foreign key (id_edificio) references edificio (id_edificio)
);
create table administrador (
	id_administrador integer AUTO_INCREMENT,
	id_usuario integer,
	correo varchar(60) not null,
	clave varchar(60) not null ,
	estado numeric(1,0) not null check (estado in (1,0)), 
	constraint PK_ADMINISTRADOR primary key (id_administrador),
	constraint FK_ADMINISTRADOR_USUARIO foreign key (id_usuario) references usuario(id_usuario)
);
create table queja (
	id_queja integer AUTO_INCREMENT ,
	asunto varchar(60) not null ,
	descripcion tinytext not null,
	fecha date not null ,
	hora time not null,
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_QUEJA primary key (id_queja)
);
create table pago (
	id_pago integer AUTO_INCREMENT,
	id_usuario integer ,
	id_cuota integer ,
	id_inmueble integer,
	fec_canc date not null, 
	estado numeric(1,0) not null check (estado in (1,0)) , 
	constraint PK_PAGO primary key (id_pago),
	constraint FK_PAGO_CUOTA foreign key (id_cuota) references cuota(id_cuota),
	constraint FK_PAGO_INMUEBLE foreign key (id_inmueble) references inmueble(id_inmueble)
);
