-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-09-2017 a las 17:47:30
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sis_condominio_final`
--
CREATE DATABASE IF NOT EXISTS `sis_condominio_final` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sis_condominio_final`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agua_potable`
--

CREATE TABLE `agua_potable` (
  `idAgua_potable` int(11) NOT NULL,
  `Cant_dueñosActivos` int(11) NOT NULL,
  `Pago_general` double NOT NULL COMMENT 'Pago total mensual por agua potable.',
  `Cant_mensualConsumida` double NOT NULL COMMENT 'Cantidad de agua potable consumida mensualmente.',
  `Pago_x_dueñoActivo` double DEFAULT NULL COMMENT 'Pago correspondiente a cada inmueble por un mes.',
  `Fecha_mes` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `agua_potable`
--

INSERT INTO `agua_potable` (`idAgua_potable`, `Cant_dueñosActivos`, `Pago_general`, `Cant_mensualConsumida`, `Pago_x_dueñoActivo`, `Fecha_mes`) VALUES
(1, 60, 600.5, 306, 11, '2017-09-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler_evento`
--

CREATE TABLE `alquiler_evento` (
  `idAlquiler_Evento` int(11) NOT NULL,
  `Id_dueño_Activo` int(11) NOT NULL,
  `Nombre_Evento` varchar(45) NOT NULL,
  `Sala` char(5) NOT NULL,
  `MontoPago` double NOT NULL,
  `Fecha_pago` datetime NOT NULL,
  `Fecha_alquiler` datetime NOT NULL,
  `Monto_rembolso` double DEFAULT NULL,
  `Fecha_rembolso` datetime DEFAULT NULL,
  `Estado` char(2) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alquiler_evento`
--

INSERT INTO `alquiler_evento` (`idAlquiler_Evento`, `Id_dueño_Activo`, `Nombre_Evento`, `Sala`, `MontoPago`, `Fecha_pago`, `Fecha_alquiler`, `Monto_rembolso`, `Fecha_rembolso`, `Estado`, `Descripcion`) VALUES
(1, 2, 'FIESTA INFALTIL', 'B206', 250, '2017-09-05 00:00:00', '2017-09-09 00:00:00', NULL, NULL, '1', 'Fiesta infantil, empieza a las 6pm hasta 12pm'),
(2, 4, 'Cumpleaños niños', 'B206', 250, '2017-09-05 00:00:00', '2017-09-23 00:00:00', NULL, NULL, '1', 'fIESTA PARA ADULTO, empieza a las 8pm hasta 2AM'),
(3, 3, 'Bautizo', 'B206', 250, '2017-09-05 00:00:00', '2017-09-16 00:00:00', NULL, NULL, '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuota_mantenimiento`
--

CREATE TABLE `cuota_mantenimiento` (
  `idCuota_mantenimiento` int(11) NOT NULL,
  `idDueño` int(11) NOT NULL,
  `Tipo_cuota` varchar(25) NOT NULL,
  `Monto` double NOT NULL,
  `Fecha_generacion` datetime NOT NULL,
  `Estado` char(2) NOT NULL,
  `Fecha_cancelacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuota_mantenimiento`
--

INSERT INTO `cuota_mantenimiento` (`idCuota_mantenimiento`, `idDueño`, `Tipo_cuota`, `Monto`, `Fecha_generacion`, `Estado`, `Fecha_cancelacion`) VALUES
(1, 1, 'Departamento', 25, '2017-09-01 00:00:00', '0', NULL),
(2, 2, 'Departamento', 25, '2017-09-05 00:00:00', '0', NULL),
(3, 4, 'Departamento', 20, '2017-09-01 00:00:00', '0', NULL),
(4, 3, 'Departamento', 25, '2017-09-05 00:00:00', '0', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueño_activos`
--

CREATE TABLE `dueño_activos` (
  `idDueño` int(11) NOT NULL,
  `idPropietario` int(11) NOT NULL,
  `idInmueble` int(11) NOT NULL,
  `Fecha_compra` datetime NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL,
  `Estado` char(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dueño_activos`
--

INSERT INTO `dueño_activos` (`idDueño`, `idPropietario`, `idInmueble`, `Fecha_compra`, `Descripcion`, `Estado`) VALUES
(1, 1, 7, '2017-09-03 00:00:00', 'precio contado', '1'),
(2, 1, 2, '2017-09-03 00:00:00', 'precio contado', '1'),
(3, 3, 6, '2017-09-03 00:00:00', NULL, '1'),
(4, 3, 5, '2017-09-03 00:00:00', NULL, '1'),
(5, 2, 3, '2017-08-14 00:00:00', 'Departamento 100%', '1'),
(6, 2, 1, '2017-08-14 00:00:00', 'Departamento 100%', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_generales`
--

CREATE TABLE `gastos_generales` (
  `idGastos_generales` int(11) NOT NULL,
  `idTipo_gastos` int(11) NOT NULL,
  `Detalle` varchar(45) DEFAULT NULL,
  `Monto` double NOT NULL,
  `Fecha` datetime NOT NULL,
  `Estado` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gastos_generales`
--

INSERT INTO `gastos_generales` (`idGastos_generales`, `idTipo_gastos`, `Detalle`, `Monto`, `Fecha`, `Estado`) VALUES
(1, 1, NULL, 500, '2017-09-04 00:00:00', '1'),
(2, 3, NULL, 650, '2017-09-02 00:00:00', '1'),
(3, 1, NULL, 500, '2017-09-04 00:00:00', '1'),
(4, 3, NULL, 650, '2017-09-02 00:00:00', '1'),
(5, 6, NULL, 1500, '2017-09-06 00:00:00', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `idInmueble` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Num_torre` char(2) NOT NULL,
  `Num_piso` char(2) NOT NULL,
  `Num_inmueble` varchar(10) DEFAULT NULL,
  `Estado` char(2) NOT NULL DEFAULT '1',
  `Descripcion` varchar(50) DEFAULT NULL,
  `Fecha_ingreso` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`idInmueble`, `Nombre`, `Num_torre`, `Num_piso`, `Num_inmueble`, `Estado`, `Descripcion`, `Fecha_ingreso`) VALUES
(1, 'Departamento', 'A1', '4', '402', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(2, 'Departamento', 'A1', '4', '406', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(3, 'Departamento', 'B2', '4', '405', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(4, 'Departamento', 'C3', '2', '211', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(5, 'Departamento', 'B1', '10', '1008', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(6, 'Departamento', 'A1', '4', '401', '1', 'Departamento 100% operativa,  4 cuartos.', '2017-09-04 00:00:00'),
(7, 'Cochera', 'B2', '1', '101', '1', 'cochera para movilidad', '2017-09-17 00:00:00'),
(9, 'Cochera', 'B2', '1', '100', '1', 'cochera para movilidad', '2017-09-17 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_aguapotable`
--

CREATE TABLE `pago_aguapotable` (
  `idServicios_generales` int(11) NOT NULL,
  `idAgua_potable` int(11) NOT NULL,
  `idDueño` int(11) NOT NULL,
  `Pago_x_agua` double NOT NULL,
  `Fecha_activacion` datetime NOT NULL,
  `Estado` char(2) NOT NULL,
  `Fecha_cancelacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago_aguapotable`
--

INSERT INTO `pago_aguapotable` (`idServicios_generales`, `idAgua_potable`, `idDueño`, `Pago_x_agua`, `Fecha_activacion`, `Estado`, `Fecha_cancelacion`) VALUES
(1, 1, 1, 11, '2017-09-05 00:00:00', '0', NULL),
(2, 1, 5, 11, '2017-09-05 00:00:00', '0', NULL),
(3, 1, 6, 11, '2017-09-05 00:00:00', '0', NULL),
(4, 1, 3, 11, '2017-09-05 00:00:00', '0', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `idPropietario` int(11) NOT NULL,
  `DNI` char(8) NOT NULL,
  `Nombre` varchar(35) NOT NULL,
  `Apellido` varchar(35) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Fecha_ingreso` datetime NOT NULL,
  `Estado` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`idPropietario`, `DNI`, `Nombre`, `Apellido`, `Edad`, `Fecha_nacimiento`, `Fecha_ingreso`, `Estado`) VALUES
(1, '71852467', 'JUAN CARLOS', 'ZEGARRA SALCEDO', 40, '1989-09-12', '2017-09-04 00:00:00', '1'),
(2, '71852467', 'JUAN CARLOS', 'ZEGARRA SALCEDO', 40, '1989-09-12', '2017-09-04 00:00:00', '1'),
(3, '71785504', 'JULIO CESAR', 'ZEGARRA MANZANEDA', 20, '1997-01-13', '2017-09-04 00:00:00', '1'),
(4, '19758634', 'MARIELA MILAGROS', 'ZAMALLOA VEGA', 29, '1980-09-12', '2017-09-04 00:00:00', '1'),
(5, '98637818', 'BLANCA KATTY', 'VILCA LUCERO,', 50, '1970-09-12', '2017-09-04 00:00:00', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_gastos`
--

CREATE TABLE `tipo_gastos` (
  `idTipo_gastos` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_gastos`
--

INSERT INTO `tipo_gastos` (`idTipo_gastos`, `Nombre`, `Descripcion`) VALUES
(1, 'Servicio de Agua', 'Agua potable general'),
(2, 'Servicio de Luz', 'Luz del sur, empresa encargada'),
(3, 'Personal de Limpieza', 'Personal en todas las torres'),
(4, 'Mantenimiento de Ascensores', ''),
(5, 'Servicio de Agua', 'Agua potable general'),
(6, 'Servicio de Luz', 'Luz del sur, empresa encargada'),
(7, 'Personal de Limpieza', 'Personal en todas las torres'),
(8, 'Mantenimiento de Ascensores', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agua_potable`
--
ALTER TABLE `agua_potable`
  ADD PRIMARY KEY (`idAgua_potable`);

--
-- Indices de la tabla `alquiler_evento`
--
ALTER TABLE `alquiler_evento`
  ADD PRIMARY KEY (`idAlquiler_Evento`),
  ADD KEY `alquiler_dueño` (`Id_dueño_Activo`);

--
-- Indices de la tabla `cuota_mantenimiento`
--
ALTER TABLE `cuota_mantenimiento`
  ADD PRIMARY KEY (`idCuota_mantenimiento`),
  ADD KEY `mante_dueños_act` (`idDueño`);

--
-- Indices de la tabla `dueño_activos`
--
ALTER TABLE `dueño_activos`
  ADD PRIMARY KEY (`idDueño`),
  ADD KEY `dueño_inmuebles` (`idInmueble`),
  ADD KEY `propietario_dueño` (`idPropietario`);

--
-- Indices de la tabla `gastos_generales`
--
ALTER TABLE `gastos_generales`
  ADD PRIMARY KEY (`idGastos_generales`),
  ADD KEY `gastos_tipos` (`idTipo_gastos`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`idInmueble`),
  ADD UNIQUE KEY `Num_inmueble_UNIQUE` (`Num_inmueble`);

--
-- Indices de la tabla `pago_aguapotable`
--
ALTER TABLE `pago_aguapotable`
  ADD PRIMARY KEY (`idServicios_generales`),
  ADD KEY `pagoAgua_dueño` (`idDueño`),
  ADD KEY `pago_agua_potable` (`idAgua_potable`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`idPropietario`);

--
-- Indices de la tabla `tipo_gastos`
--
ALTER TABLE `tipo_gastos`
  ADD PRIMARY KEY (`idTipo_gastos`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler_evento`
--
ALTER TABLE `alquiler_evento`
  ADD CONSTRAINT `alquiler_dueño` FOREIGN KEY (`Id_dueño_Activo`) REFERENCES `dueño_activos` (`idDueño`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cuota_mantenimiento`
--
ALTER TABLE `cuota_mantenimiento`
  ADD CONSTRAINT `mante_dueños_act` FOREIGN KEY (`idDueño`) REFERENCES `dueño_activos` (`idDueño`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dueño_activos`
--
ALTER TABLE `dueño_activos`
  ADD CONSTRAINT `dueño_inmuebles` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`idInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `propietario_dueño` FOREIGN KEY (`idPropietario`) REFERENCES `propietario` (`idPropietario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gastos_generales`
--
ALTER TABLE `gastos_generales`
  ADD CONSTRAINT `gastos_tipos` FOREIGN KEY (`idTipo_gastos`) REFERENCES `tipo_gastos` (`idTipo_gastos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pago_aguapotable`
--
ALTER TABLE `pago_aguapotable`
  ADD CONSTRAINT `pagoAgua_dueño` FOREIGN KEY (`idDueño`) REFERENCES `dueño_activos` (`idDueño`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pago_agua_potable` FOREIGN KEY (`idAgua_potable`) REFERENCES `agua_potable` (`idAgua_potable`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
