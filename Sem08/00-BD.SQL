/*
Empresa        :  EGCC
Software       :  Sistema de Gestion de condominios
DBMS           :  MySQL Server
Base de Datos  :  CONDOMINIO
Script         :  Crea la Base de Datos
Responsable    :  Ing. Eric Gustavo Coronel Castillo
Telefono       :  (511) 9966-64457
Email          :  gcoronelc@gmail.com
Sitio Web      :  http://www.desarrollasoftware.com
Blog           :  http://gcoronelc.blogspot.com
*/


-- =============================================
-- Creación de la Base de Datos
-- =============================================

DROP DATABASE IF EXISTS CONDOMINIO;

CREATE DATABASE CONDOMINIO;


-- =============================================
-- Seleccionar la Base de Datos
-- =============================================

USE eurekabank;
SET NAMES 'utf8';


-- =============================================
-- Creación del Usuario
-- =============================================

USE MYSQL;
GRANT ALL PRIVILEGES ON *.* TO 'condominio'@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'condominio'@'localhost' IDENTIFIED BY 'admin' WITH GRANT OPTION;
FLUSH PRIVILEGES;
USE CONDOMINIO;


