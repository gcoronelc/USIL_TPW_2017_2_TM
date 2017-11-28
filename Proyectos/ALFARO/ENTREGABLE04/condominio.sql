-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-11-2017 a las 23:33:48
-- Versión del servidor: 10.1.21-MariaDB
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `condominio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialinmueble`
--

CREATE TABLE `historialinmueble` (
  `idhistoriainmueble` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `propietario_actual` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `idinmueble` int(11) NOT NULL,
  `piso` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idtinmueble` int(11) NOT NULL,
  `idtorre` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`idinmueble`, `piso`, `numero`, `descripcion`, `idpersona`, `idtinmueble`, `idtorre`, `activo`) VALUES
(1, 0, 0, 'Condominio', 1, 1, 100, 1),
(2, 1, 101, 'Oficina de Gustavo', 2, 3, 1, 1),
(3, 2, 201, 'Departamento de Gustavo', 2, 2, 1, 1),
(4, -1, 101, 'Cochera de Gustavo', 2, 4, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `obligacion`
--

CREATE TABLE `obligacion` (
  `idobligacion` int(11) NOT NULL,
  `idtobligacion` int(11) NOT NULL,
  `idinmueble` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `anio` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `importe` decimal(12,2) NOT NULL,
  `aud_idpersona` int(11) NOT NULL,
  `aud_fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obligacion`
--

INSERT INTO `obligacion` (`idobligacion`, `idtobligacion`, `idinmueble`, `descripcion`, `anio`, `mes`, `importe`, `aud_idpersona`, `aud_fecha`) VALUES
(1, 2, 1, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-14'),
(2, 2, 3, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-14'),
(3, 2, 2, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `idtpersona` int(11) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `email` varchar(60) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `estado` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `idtpersona`, `apellido`, `nombre`, `dni`, `email`, `telefono`, `direccion`, `estado`) VALUES
(1, 1, 'CONDOMINIO', 'CONDOMINIO', '89435678', 'CONDOMINIO@GMAIL.COM', '657346578', 'MI CASA', 0),
(2, 2, 'CORONEL', 'GUSTAVO', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(3, 2, 'SALAZAR', 'BARBARA', '65782345', 'BARBARA@GMAIL.COM', '657346578', 'MI CASA', 0),
(4, 2, 'DEL AGUILA', 'FIORELLA', '98345678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(5, 2, 'ALFARO', 'CARLOS', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(6, 2, 'LABAN ', 'CYNTHYA', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(7, 2, 'DIAZ', 'MANUEL', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(8, 2, 'CONDOR', 'JOSE', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(9, 3, 'ORIA ', 'CLAUDIA', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(10, 4, 'CHOQUECAHUANA ', 'JAVIER', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(11, 5, 'PRIETO', 'STHEPHANY', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA', 0),
(12, 2, 'Alfaro', 'Cristina', '23487645', 'cristina@gmail.com', '674356872', 'su casa', 1),
(13, 1, 'cadenas ', 'laura', '1234567', 'laura@gmail.com', '12345566', 'ancon', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibo`
--

CREATE TABLE `recibo` (
  `idrecibo` int(11) NOT NULL,
  `idtobligacion` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `anio` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `fecVen` date NOT NULL,
  `importe` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `recibo`
--

INSERT INTO `recibo` (`idrecibo`, `idtobligacion`, `codigo`, `anio`, `mes`, `fecVen`, `importe`) VALUES
(1, 2, 'R-235489', 2017, 11, '2017-11-30', '300.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`) VALUES
(1, 'PROPIETARIO'),
(2, 'ADMINISTRADOR'),
(3, 'DIRECTIVO'),
(4, 'SECRETARIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tinmueble`
--

CREATE TABLE `tinmueble` (
  `idtinmueble` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `agua` int(11) NOT NULL DEFAULT '1',
  `mante` int(11) NOT NULL DEFAULT '1',
  `cmante` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tinmueble`
--

INSERT INTO `tinmueble` (`idtinmueble`, `nombre`, `agua`, `mante`, `cmante`) VALUES
(1, 'CONDOMINIO', 1, 0, '0.00'),
(2, 'DEPARTAMENTO', 1, 1, '80.00'),
(3, 'OFICINA', 1, 1, '140.00'),
(4, 'COCHERA', 0, 1, '20.00'),
(5, 'AUDITORIO', 0, 0, '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tobligacion`
--

CREATE TABLE `tobligacion` (
  `idtobligacion` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tobligacion`
--

INSERT INTO `tobligacion` (`idtobligacion`, `nombre`) VALUES
(1, 'MANTENIMIENTO'),
(2, 'AGUA'),
(3, 'OTROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torre`
--

CREATE TABLE `torre` (
  `idtorre` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `torre`
--

INSERT INTO `torre` (`idtorre`, `nombre`) VALUES
(1, 'TORRE A'),
(2, 'TORRE B'),
(3, 'TORRE C'),
(100, 'TORRE VIRTUAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpersona`
--

CREATE TABLE `tpersona` (
  `idtpersona` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tpersona`
--

INSERT INTO `tpersona` (`idtpersona`, `nombre`) VALUES
(1, 'CONDOMINIO'),
(2, 'PROPIETARIO'),
(3, 'ADMINISTRADOR'),
(4, 'DIRECTIVO'),
(5, 'SECRETARIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idpersona` int(11) NOT NULL,
  `usuario` varchar(60) NOT NULL,
  `clave` varchar(60) NOT NULL,
  `idrol` int(11) NOT NULL,
  `estado` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idpersona`, `usuario`, `clave`, `idrol`, `estado`) VALUES
(2, 'gustavo', 'beac5f8171fcde5e2ec734cc5d25d03e7362e8de', 1, 1),
(3, 'barbara', '2664ac13c6a941cb7c07411216073c9f3ed30715', 3, 1),
(9, 'claudia', '568095ee7b98b0afceb32540a1ca5540eaa72666', 2, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_inmueble`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_inmueble` (
`inmueble` int(11)
,`tipo` int(11)
,`nomtipo` varchar(60)
,`torre` int(11)
,`nomtorre` varchar(60)
,`piso` int(11)
,`numero` int(11)
,`descripcion` varchar(200)
,`activo` int(11)
,`propietario` int(11)
,`nompropietario` varchar(122)
,`agua` int(11)
,`mantenimiento` int(11)
,`cuota` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_persona`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_persona` (
`idpersona` int(11)
,`apellido` varchar(60)
,`nombre` varchar(60)
,`tipo` int(11)
,`nomtipo` varchar(40)
,`dni` varchar(20)
,`email` varchar(60)
,`telefono` varchar(20)
,`direccion` varchar(100)
,`estado` smallint(6)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_inmueble`
--
DROP TABLE IF EXISTS `v_inmueble`;

CREATE ALGORITHM=UNDEFINED DEFINER=`eureka`@`localhost` SQL SECURITY DEFINER VIEW `v_inmueble`  AS  select `i`.`idinmueble` AS `inmueble`,`ti`.`idtinmueble` AS `tipo`,`ti`.`nombre` AS `nomtipo`,`t`.`idtorre` AS `torre`,`t`.`nombre` AS `nomtorre`,`i`.`piso` AS `piso`,`i`.`numero` AS `numero`,`i`.`descripcion` AS `descripcion`,`i`.`activo` AS `activo`,`p`.`idpersona` AS `propietario`,concat(`p`.`apellido`,', ',`p`.`nombre`) AS `nompropietario`,`ti`.`agua` AS `agua`,`ti`.`mante` AS `mantenimiento`,`ti`.`cmante` AS `cuota` from (((`tinmueble` `ti` join `inmueble` `i` on((`ti`.`idtinmueble` = `i`.`idtinmueble`))) join `torre` `t` on((`i`.`idtorre` = `t`.`idtorre`))) join `persona` `p` on((`i`.`idpersona` = `p`.`idpersona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_persona`
--
DROP TABLE IF EXISTS `v_persona`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_persona`  AS  select `p`.`idpersona` AS `idpersona`,`p`.`apellido` AS `apellido`,`p`.`nombre` AS `nombre`,`p`.`idtpersona` AS `tipo`,`t`.`nombre` AS `nomtipo`,`p`.`dni` AS `dni`,`p`.`email` AS `email`,`p`.`telefono` AS `telefono`,`p`.`direccion` AS `direccion`,`p`.`estado` AS `estado` from (`tpersona` `t` join `persona` `p` on((`t`.`idtpersona` = `p`.`idtpersona`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historialinmueble`
--
ALTER TABLE `historialinmueble`
  ADD PRIMARY KEY (`idhistoriainmueble`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`idinmueble`),
  ADD KEY `FK_INMUEBLE_PERSONA` (`idpersona`),
  ADD KEY `FK_INMUEBLE_TINMUEBLE` (`idtinmueble`),
  ADD KEY `FK_INMUEBLE_TORRE` (`idtorre`);

--
-- Indices de la tabla `obligacion`
--
ALTER TABLE `obligacion`
  ADD PRIMARY KEY (`idobligacion`),
  ADD KEY `FK_OBLIGACION_TOBLIGACION` (`idtobligacion`),
  ADD KEY `FK_OBLIGACION_INMUEBLE` (`idinmueble`),
  ADD KEY `FK_AUD_OBLIGACION_PERSONA` (`aud_idpersona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `FK_PERSONA_TPERSONA` (`idtpersona`);

--
-- Indices de la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD PRIMARY KEY (`idrecibo`),
  ADD KEY `FK_RECIBO_TOBLIGACION` (`idtobligacion`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tinmueble`
--
ALTER TABLE `tinmueble`
  ADD PRIMARY KEY (`idtinmueble`);

--
-- Indices de la tabla `tobligacion`
--
ALTER TABLE `tobligacion`
  ADD PRIMARY KEY (`idtobligacion`);

--
-- Indices de la tabla `torre`
--
ALTER TABLE `torre`
  ADD PRIMARY KEY (`idtorre`);

--
-- Indices de la tabla `tpersona`
--
ALTER TABLE `tpersona`
  ADD PRIMARY KEY (`idtpersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `FK_USUARIO_ROL` (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historialinmueble`
--
ALTER TABLE `historialinmueble`
  MODIFY `idhistoriainmueble` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `idinmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `obligacion`
--
ALTER TABLE `obligacion`
  MODIFY `idobligacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historialinmueble`
--
ALTER TABLE `historialinmueble`
  ADD CONSTRAINT `FK_HISTORIAINMUEBLE_INMUEBLE` FOREIGN KEY (`idhistoriainmueble`) REFERENCES `inmueble` (`idinmueble`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `FK_INMUEBLE_PERSONA` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `FK_INMUEBLE_TINMUEBLE` FOREIGN KEY (`idtinmueble`) REFERENCES `tinmueble` (`idtinmueble`),
  ADD CONSTRAINT `FK_INMUEBLE_TORRE` FOREIGN KEY (`idtorre`) REFERENCES `torre` (`idtorre`);

--
-- Filtros para la tabla `obligacion`
--
ALTER TABLE `obligacion`
  ADD CONSTRAINT `FK_AUD_OBLIGACION_PERSONA` FOREIGN KEY (`aud_idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `FK_OBLIGACION_INMUEBLE` FOREIGN KEY (`idinmueble`) REFERENCES `inmueble` (`idinmueble`),
  ADD CONSTRAINT `FK_OBLIGACION_TOBLIGACION` FOREIGN KEY (`idtobligacion`) REFERENCES `tobligacion` (`idtobligacion`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_PERSONA_TPERSONA` FOREIGN KEY (`idtpersona`) REFERENCES `tpersona` (`idtpersona`);

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `FK_RECIBO_TOBLIGACION` FOREIGN KEY (`idtobligacion`) REFERENCES `tobligacion` (`idtobligacion`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_USUARIO_PERSONA` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `FK_USUARIO_ROL` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
