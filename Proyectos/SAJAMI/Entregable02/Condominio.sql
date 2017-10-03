create database if not exists Condominio;

use Condominio;

create table Gastos_Condominio(
id_gastos_condominio char(5) primary key,
servicios_publicos decimal(8,2),
mantenimiento_publicos decimal(8,2),
personal decimal(8,2),
insumos decimal(8,2));

create table Propietarios(
id_propietarios char(5) primary key,
dni int,
nombre varchar(40),
apellidos varchar(60),
telefono int);

create table Usuarios(
id_usuario char(5) primary key,
id_propietarios char(5),
nombre varchar(30),
contraseña varchar(40),
foreign key (id_propietarios) references Propietarios(id_propietarios));

create table Tipo_Inmueble(
id_tipo_inmueble char(5) primary key,
tipo varchar(25));

create table Inmueble(
id_inmueble char(5) primary key,
ubicacion_inmueble varchar(100),
Fecha_compra date,
id_propietarios char(5),
id_tipo_inmueble char(5),
torre int,
piso int,
foreign key (id_propietarios) references Propietarios(id_propietarios),
foreign key (id_tipo_inmueble) references Tipo_Inmueble(id_tipo_inmueble));

create table Servicio_Agua(
id_servicio_agua char(5) primary key,
id_inmueble char(5),
cant_consumida decimal(8,2),
Fecha date,
foreign key (id_inmueble) references Inmueble(id_inmueble));

create table Mantenimiento(
id_mantenimiento char(5) primary key,
id_inmueble char(5),
deuda_total decimal(8,2),
fecha date,
foreign key (id_inmueble) references Inmueble(id_inmueble));

create table Auditorio(
id_auditorio char(5) primary key,
precio decimal(8,2),
fecha_pago date,
fecha_evento date,
estado_auditorio varchar(30),
pagos_administrativos decimal(8,2),
id_propietarios char(5),
foreign key (id_propietarios) references Propietarios(id_propietarios));

create table Administrador(
id_administrador char(5) primary key,
nombre varchar(40),
apellidos varchar(60),
dni int,
telefono int);

create table usuario_admi(
id_usuario_admi char(5) primary key,
id_administrador char(5),
nombre varchar(30),
contraseña varchar(40),
foreign key (id_administrador) references Administrador(id_administrador));

insert into Gastos_Condominio (id_gastos_condominio,servicios_publicos,mantenimiento_publicos,personal,insumos)
values ('GC001','230.00','300.00','1000.00','900.00');
insert into Gastos_Condominio (id_gastos_condominio,servicios_publicos,mantenimiento_publicos,personal,insumos)
values ('GC002','390.00','600.00','1000.00','400.00');
insert into Gastos_Condominio (id_gastos_condominio,servicios_publicos,mantenimiento_publicos,personal,insumos)
values ('GC003','800.00','800.00','1000.00','600.00');
insert into Gastos_Condominio (id_gastos_condominio,servicios_publicos,mantenimiento_publicos,personal,insumos)
values ('GC004','780.00','500.00','1000.00','800.00');
insert into Gastos_Condominio (id_gastos_condominio,servicios_publicos,mantenimiento_publicos,personal,insumos)
values ('GC005','980.00','900.00','1000.00','700.00');

insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0001','78912345','Jorge','Prieto','981238367');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0002','98628173','Carlos','Castro','973528462');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0003','65657687','Brian','Moscoso','982663373');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0004','31234122','Fernando','Casas','974873983');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0005','87162377','Jann','Sajami','936871232');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0006','97127362','Olenka','Prieto','973627182');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0007','19286323','Andrea','Turan','973826631');
insert into Propietarios (id_propietarios,dni,nombre,apellidos,telefono)
values ('P0008','89613273','Gea','Rojas','973821279');

insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0001','P0001','Jorge',SHA('Prieto'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0002','P0002','Carlos',SHA('Castro'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0003','P0003','Brian',SHA('Moscoso'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0004','P0004','Fernando',SHA('Casas'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0005','P0005','Jann',SHA('Sajami'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0006','P0006','Olenka',SHA('Prieto'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0007','P0007','Andrea',SHA('Turan'));
insert into Usuarios (id_usuario,id_propietarios,nombre,contraseña)
values ('U0008','P0008','Gea',SHA('Rojas'));

insert into Tipo_Inmueble (id_tipo_inmueble,tipo)
values ('TI001','Departamento');
insert into Tipo_Inmueble (id_tipo_inmueble,tipo)
values ('TI002','Cochera');
insert into Tipo_Inmueble (id_tipo_inmueble,tipo)
values ('TI003','Oficina');

insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0001','VMT','2017/10/01','P0001','TI002','1','1');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0002','VMT','2017/10/01','P0001','TI001','1','2');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0003','VMT','2017/10/01','P0002','TI001','1','3');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0004','VMT','2017/10/01','P0002','TI003','1','4');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0005','VMT','2017/10/01','P0003','TI002','2','1');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0006','VMT','2017/10/01','P0003','TI003','2','2');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0007','VMT','2017/10/01','P0003','TI001','2','3');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0008','VMT','2017/10/01','P0004','TI001','3','1');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0009','VMT','2017/10/02','P0004','TI003','3','2');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0010','VMT','2017/10/02','P0005','TI001','3','3');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0011','VMT','2017/10/02','P0006','TI001','3','4');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0012','VMT','2017/10/02','P0007','TI003','2','4');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0013','VMT','2017/10/02','P0008','TI002','4','1');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0014','VMT','2017/10/02','P0008','TI001','4','2');
insert into Inmueble (id_inmueble,ubicacion_inmueble,Fecha_compra,id_propietarios,id_tipo_inmueble,torre,piso)
values ('I0015','VMT','2017/10/02','P0008','TI003','4','3');



insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA001','I0001','25.9','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA002','I0002','34.2','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA003','I0003','42.2','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA004','I0004','12.1','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA005','I0005','12.2','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA006','I0006','12.3','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA007','I0007','24.2','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA008','I0008','23.2','2017/11/01');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA009','I0009','21.2','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA010','I0010','12.2','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA011','I0011','15.4','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA012','I0012','19.2','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA013','I0013','12.3','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA014','I0014','25.2','2017/11/02');
insert into Servicio_Agua (id_servicio_agua,id_inmueble,cant_consumida,fecha)
values ('SA015','I0015','12.9','2017/11/02');

insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0001','I0001','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0002','I0002','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0003','I0003','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0004','I0004','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0005','I0005','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0006','I0006','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0007','I0007','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0008','I0008','35.00','2017/11/01');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0009','I0009','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0010','I0010','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0011','I0011','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0012','I0012','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0013','I0013','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0014','I0014','35.00','2017/11/02');
insert into Mantenimiento (id_mantenimiento,id_inmueble,deuda_total,fecha)
values ('M0015','I0015','35.00','2017/11/02');

insert into Auditorio (id_auditorio,precio,fecha_pago,fecha_evento,estado_auditorio,pagos_administrativos,id_propietarios)
values ('A0001','120.00','2017/11/08','2017/11/07','Disponible','60.00','P0004');
insert into Auditorio (id_auditorio,precio,fecha_pago,fecha_evento,estado_auditorio,pagos_administrativos,id_propietarios)
values ('A0002','120.00','2017/11/15','2017/11/14','Disponible','60.00','P0002');
insert into Auditorio (id_auditorio,precio,fecha_pago,fecha_evento,estado_auditorio,pagos_administrativos,id_propietarios)
values ('A0003','120.00','2017/11/22','2017/11/21','Disponible','60.00','P0008');

insert into Administrador (id_administrador,nombre,apellidos,dni,telefono)
values ('ADM01','Gustavo','Coronel','76354326','986837263');

insert into usuario_admi (id_usuario_admi,id_administrador,nombre,contraseña)
values ('UAD01','ADM01','Gustavo',SHA('Coronel'));












