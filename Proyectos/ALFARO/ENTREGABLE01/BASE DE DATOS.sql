-- Empresa        :  Mucho Sotfware S.A.C.
-- Software       :  Sistema de Condominio(SC)
-- DBMS           :  MySQL
-- Base de Datos  :  SISTEMA_CONDOMINIO
-- Programado por :  Innova Spring


-- =============================================
-- Creando base de datos
-- =============================================

create database SISTEMA_CONDOMINIO
GO

USE SISTEMA_CONDOMINIO

  GO

  CREATE TABLE GERENTE(
  Cod_Gerente int primary key,
  Pas_Gerente int,
  Nom_Gerente varchar(50),
  Ape_Gerente varchar(50))

  go

 CREATE TABLE ADMINISTRADOR(
  Cod_Administrador int primary key,
  Pas_Administrador int,
  Nom_Administrador varchar(50),
  Ape_Administrador varchar(50),
  Cod_Gerente int,
  FOREIGN KEY (Cod_Gerente) REFERENCES GERENTE (Cod_Gerente)) 

  go

CREATE TABLE PROPIETARIO(
  Cod_Propietario int primary key,
  Dni_Propietario int,
  Nom_Propietario varchar(50),
  Ape_Propietario varchar(50),
  Dire_Propietario varchar(50),
  Tele_Propietario int,
  Cant_Inmuebles int,
  Cod_Administrador int,
  FOREIGN KEY (Cod_Administrador) REFERENCES ADMINISTRADOR (Cod_Administrador))
  
  go

  CREATE TABLE INQUILINO(
  Cod_Inquilino int primary key,
  Dni_Inquilino int,
  Nom_Inquilino varchar(50),
  Ape_Inquilino varchar(50),
  Cod_Propietario int,
  FOREIGN KEY (Cod_Propietario) REFERENCES PROPIETARIO (Cod_Propietario))

  go

  CREATE TABLE CONDOMINIO(
  Cod_Condominio int primary key,
  Num_condominio int,
  Cod_Administrador int,
  FOREIGN KEY (Cod_Administrador) REFERENCES ADMINISTRADOR (Cod_Administrador))

   go

  CREATE TABLE EDIFICIO(
  Cod_Edificio int primary key,
  Num_Pabellon int,
  Cod_Condominio int,
  FOREIGN KEY (Cod_Condominio) REFERENCES CONDOMINIO (Cod_Condominio)) 

  go

  CREATE TABLE AUDITORIO(
  Cod_Auditorio int primary key,
  Cuota_Alquiler int, 
  Fech_Alquiler date,
  Cod_Edificio int,
  FOREIGN KEY (Cod_Edificio) REFERENCES EDIFICIO (Cod_Edificio))
 
  go

 CREATE TABLE ESTADO_FINANCIERO(
  Cod_Est_Fin int primary key,
  Ingresos int,
  Gastos int,
  Deuda int,
  Cod_Edificio int,
  FOREIGN KEY (Cod_Edificio) REFERENCES EDIFICIO (Cod_Edificio))

  go

  CREATE TABLE INMUEBLES(
  Cod_Inmueble int primary key,
  Fech_Compra date,
  Dueños_Anteriores varchar(50),
  Torre_Inmueble varchar(50),
  Piso_Inmueble int,
  Total_Luz int,
  Cuota_Matenimient int,
  Cod_Propietario int,
  FOREIGN KEY (Cod_Propietario) REFERENCES PROPIETARIO (Cod_Propietario)) 

  go
   
 CREATE TABLE ESTADO_INMUEBLE(
  Cod_Est_Inmu int primary key,
  Deuda_Actual int,
  Deuda_Anterior int,
  Detalles varchar(50),
  Cod_Inmueble int,
  FOREIGN KEY (Cod_Inmueble) REFERENCES INMUEBLES (Cod_Inmueble)) 

  go
 
 alter authorization on database::SISTEMA_CONDOMINIO to sa;
   
