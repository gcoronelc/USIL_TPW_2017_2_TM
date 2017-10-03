create database SISTEMA_CONDOMINIO;
USE SISTEMA_CONDOMINIO;
go

  
 CREATE TABLE ADMINISTRADOR(
  Cod_Administrador int primary key,
  id_usuario int,
  Nombre varchar(50),
  Apellido varchar(50)
  dni int,
 direccion varchar(50),
   celular int);

  INSERT INTO ADMINISTRADOR (Nombre,Apellido) VALUES(1,'Yovana','Sulca',30049520,'los olivos',995837239);
  INSERT INTO ADMINISTRADOR (Nombre,Apellido) VALUES(1,'Cristina','Alfaro',500494112,'los Naranjales',985857239);
 

  CREATE TABLE INQUILINO(
  Cod_Inquilino int primary key,
  Nombre varchar(50),
  Apellido varchar(50),
  Dni int,
  correo varchar(50),
  Cod_Inmueble int,
  FOREIGN KEY (Cod_Inmueble) REFERENCES INMUEBLE (Cod_Inmueble));

  INSERT INTO INQUILINO (Nombre,Apellido,Dni,correo,Cod_Inmueble) VALUES('Alicia','Ancasi',70047620,'escorpio@gmail.com',0021);
  
  
  CREATE TABLE CONDOMINIO(
  Cod_Condominio int primary key,
  Num_condominio int,
  Cod_Edificio int,
  FOREIGN KEY (Cod_Edificio) REFERENCES EDIFICIO (Cod_Edificio));

  INSERT INTO CONDOMINIO (Num_condominio,Cod_Edificio)VALUES(123,1022);


  CREATE TABLE EDIFICIO(
  Cod_Edificio int primary key,
  Num_Pabellon int,
   Cod_Inquilino int,
  FOREIGN KEY ( Cod_Inquilino) REFERENCES INQUILINO ( Cod_Inquilino));

  INSERT INTO EDIFICIO()VALUES()
  
 

  CREATE TABLE AUDITORIO(
  Cod_Auditorio int primary key,
  fechaReservaInicio date,
 fechaReservaFin date,
 fechaPago date,
 costo int,
  FOREIGN KEY (Cod_Pago) REFERENCES PAGO (Cod_Pago));
 
 
 CREATE TABLE PAGO(
  Cod_Pago int primary key,
  Ingresos int,
  Gastos int,
  Deuda int,
  Cod_Administrador int,
  FOREIGN KEY (Cod_Administrador) REFERENCES ADMINISTRADOR (Cod_Administrador));
  INSERT INTO INMUEBLE (Fecalquiler_inmueble,Dueños_Anteriores,Torre_Inmueble,Piso_Inmueble,Total_Luz,Cuota_Matenimient)VALUES();
  

  CREATE TABLE INMUEBLE(
  Cod_Inmueble int primary key,
  Fecalquiler_inmueble date,
  Dueños_Anteriores varchar(50),
  Torre_Inmueble varchar(50),
  Piso_Inmueble int,
  Total_Luz int,
  Cuota_Matenimient int);

  INSERT INTO INMUEBLE (Fecalquiler_inmueble,Dueños_Anteriores,Torre_Inmueble,Piso_Inmueble,Total_Luz,Cuota_Matenimient)VALUES();

 

CREATE TABLE CUOTA(
Cod_cuota int primary key,
monto_cuota int,
des_cuota varchar(40),
fe_cuota date,
Cod_Inmueble int,
FOREIGN KEY (Cod_Inmueble) REFERENCES INMUEBLE(Cod_Inmueble));

CREATE TABLE GastosMantenimiento
(
Cod_gastosMant int auto_increment,
idpro int,
cuota int,
);



