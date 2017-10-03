create database if not exists condosoft;
use condosoft;

create table propietario(
id_propietario int auto_increment,
nombre varchar(50),
apellidos varchar(50),
dni int,
telefono int,
correo varchar(50),
primary key(id_propietario) 
);

create table administrador(
id_administrador int auto_increment,
nombre varchar(50),
apellidos varchar(50),
dni int,
telefono int,
correo varchar(50),
usuario varchar(50),
clave varchar(50),
primary key(id_administrador)
);


create table inmueble(
id_inmueble int auto_increment,
id_propietario int,
piso int,
torre int,
numero int,
tipo varchar(50),
primary key(id_inmueble),
FOREIGN KEY fk_propietario(id_propietario) REFERENCES propietario(id_propietario)
);

create table eventos(
id_eventos int auto_increment,
id_propietario int,
fecha date,
nombre varchar(50),
descripcion varchar(50),
monto int,
primary key (id_eventos),
FOREIGN KEY fk_eventos(id_propietario) REFERENCES propietario(id_propietario)
);

create table total_pagoEventos(
id_totalE int auto_increment,
id_eventos int,
total int,
primary key (id_totalE),
FOREIGN key (id_eventos) REFERENCES eventos(id_eventos)
);

create table gastos_condominio(
id_gastos int auto_increment,
tipo varchar(50),
monto int,
descripcion varchar(50),
fecha date,
primary key(id_gastos)
);


create table cuotas(
id_cuota int auto_increment,
id_propietario int,
id_inmueble int,
tipo varchar(50),
monto int,
descripcion varchar(50),
fecha date,
estado int,
primary key (id_cuota),
FOREIGN key fk_cuota_propietario(id_propietario) REFERENCES propietario(id_propietario),
FOREIGN key fk_cuota_inmueble(id_inmueble) REFERENCES inmueble(id_inmueble)
);

create table total_cuota(
id_totalC int auto_increment,
id_cuota int,
total int,
primary key(id_totalC),
FOREIGN key fk_total_coutas (id_cuota) REFERENCES cuotas(id_cuota)
);

create table ingresos(
id_ingresos int auto_increment,
id_totalC int,
id_totalE int,
total int,
primary key (id_ingresos),
FOREIGN key fk_ingresos_cuota(id_totalC) REFERENCES total_cuota(id_totalC),
FOREIGN key fk_ingresos_eventos(id_totalE) REFERENCES total_pagoEventos(id_totalE)
);
