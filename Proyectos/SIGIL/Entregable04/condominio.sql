-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2017 a las 14:48:12
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `condominio`
--
create database condominio
use condominio

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `idinmueble` int(10) UNSIGNED NOT NULL,
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
(4, -1, 101, 'Cochera de Gustavo', 2, 4, 1, 1),
(5, 2, 205, 'julioo cesarrr', 2, 2, 2, 1),
(7, 6, 600, 'defdgh', 3, 2, 2, 1),
(8, 4, 401, 'ashjfba', 2, 1, 1, 1),
(9, 2, 204, 'tweyh', 2, 2, 1, 1);

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `obligacion`
--

INSERT INTO `obligacion` (`idobligacion`, `idtobligacion`, `idinmueble`, `descripcion`, `anio`, `mes`, `importe`, `aud_idpersona`, `aud_fecha`) VALUES
(1, 2, 1, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-13'),
(2, 2, 3, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-13'),
(3, 2, 2, 'Agua del 2017-11', 2017, 11, '100.00', 11, '2017-11-13');

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
  `direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `idtpersona`, `apellido`, `nombre`, `dni`, `email`, `telefono`, `direccion`) VALUES
(1, 1, 'CORONEL', 'GUSTAVO', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'Jr DE LA UNION'),
(2, 2, 'SALAZAR', 'BARBARA', '65782345', 'BARBARA@GMAIL.COM', '657346578', 'MI CASA'),
(3, 3, 'DEL AGUILA JUNIOR', 'FIORELLA LAURA', '98345678', 'GUSTAVO@GMAIL.COM', '3926733', 'MZ E LT 13 GP 7'),
(4, 1, 'ALFARO', 'CARLOS', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA'),
(5, 1, 'LABAN ', 'CYNTHYA', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA'),
(8, 2, 'ORIA ', 'CLAUDIA', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA'),
(9, 2, 'CHOQUECAHUANA ', 'JAVIER', '89435678', 'GUSTAVO@GMAIL.COM', '657346578', 'MI CASA'),
(10, 1, 'Sigil Vilca', 'Julio Cesar', '71785504', 'sigil@gmail.com', '3926733', 'Mz L Tt 21 Gp 7  SJL'),
(15, 1, 'SIGIL VILCA', 'JULIO CESAR', '7178504', 'no tengo', '986340461', 'SAN MIGUEL AV UNIVERSITARIA 2'),
(16, 4, 'Milla Villanueva', 'Sthepany Liset', '79816348', 'no tengo', '9683468', 'Av Tacna 143 Jr. Ica'),
(22, 1, 'Condor', 'Betzy', '72317247', 'betzy@gmail.com', '948848305', 'av.tucac');

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
(1, 'PROPIETARIO'),
(2, 'ADMINISTRADOR'),
(3, 'DIRECTIVO'),
(4, 'SECRETARIA');

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
(1, 'gustavo', 'beac5f8171fcde5e2ec734cc5d25d03e7362e8de', 2, 1),
(2, 'barbara', '2664ac13c6a941cb7c07411216073c9f3ed30715', 3, 1),
(8, 'claudia', '568095ee7b98b0afceb32540a1ca5540eaa72666', 2, 1),
(9, 'usil', '60a6fab1d12bbc83752fae8a3ea869d6e46742df', 2, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_importe`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_importe` (
`idtobligacion` int(11)
,`Tipo_obligacion` varchar(60)
,`idinmueble` int(10) unsigned
,`piso` int(11)
,`numero` int(11)
,`idpersona` int(11)
,`idtinmueble` int(11)
,`idtorre` int(11)
,`activo` int(11)
,`idobligacion` int(11)
,`descripcion` varchar(200)
,`anio` int(11)
,`mes` int(11)
,`importe` decimal(12,2)
,`aud_idpersona` int(11)
,`aud_fecha` date
,`idtpersona` int(11)
,`apellido` varchar(60)
,`nombre` varchar(60)
,`dni` varchar(20)
,`email` varchar(60)
,`telefono` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_listar_personas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_listar_personas` (
`idpersona` int(11)
,`idtpersona` int(11)
,`apellido` varchar(60)
,`nombre` varchar(60)
,`dni` varchar(20)
,`email` varchar(60)
,`telefono` varchar(20)
,`direccion` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_persona_tipo`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_persona_tipo` (
`persona` varchar(120)
,`tipoNombre` varchar(40)
,`descripcion` varchar(200)
,`tipoInmueble` varchar(60)
,`nombreTorre` varchar(60)
,`idpersona` int(11)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_importe`
--
DROP TABLE IF EXISTS `v_importe`;

CREATE ALGORITHM=UNDEFINED DEFINER=`condominio`@`localhost` SQL SECURITY DEFINER VIEW `v_importe`  AS  select `tobl`.`idtobligacion` AS `idtobligacion`,`tobl`.`nombre` AS `Tipo_obligacion`,`inm`.`idinmueble` AS `idinmueble`,`inm`.`piso` AS `piso`,`inm`.`numero` AS `numero`,`inm`.`idpersona` AS `idpersona`,`inm`.`idtinmueble` AS `idtinmueble`,`inm`.`idtorre` AS `idtorre`,`inm`.`activo` AS `activo`,`ob`.`idobligacion` AS `idobligacion`,`ob`.`descripcion` AS `descripcion`,`ob`.`anio` AS `anio`,`ob`.`mes` AS `mes`,`ob`.`importe` AS `importe`,`ob`.`aud_idpersona` AS `aud_idpersona`,`ob`.`aud_fecha` AS `aud_fecha`,`per`.`idtpersona` AS `idtpersona`,`per`.`apellido` AS `apellido`,`per`.`nombre` AS `nombre`,`per`.`dni` AS `dni`,`per`.`email` AS `email`,`per`.`telefono` AS `telefono` from (((`inmueble` `inm` join `obligacion` `ob` on((`inm`.`idinmueble` = `ob`.`idinmueble`))) join `tobligacion` `tobl` on((`tobl`.`idtobligacion` = `ob`.`idtobligacion`))) join `persona` `per` on((`inm`.`idpersona` = `per`.`idpersona`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_listar_personas`
--
DROP TABLE IF EXISTS `v_listar_personas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`condominio`@`localhost` SQL SECURITY DEFINER VIEW `v_listar_personas`  AS  select `persona`.`idpersona` AS `idpersona`,`persona`.`idtpersona` AS `idtpersona`,`persona`.`apellido` AS `apellido`,`persona`.`nombre` AS `nombre`,`persona`.`dni` AS `dni`,`persona`.`email` AS `email`,`persona`.`telefono` AS `telefono`,`persona`.`direccion` AS `direccion` from `persona` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_persona_tipo`
--
DROP TABLE IF EXISTS `v_persona_tipo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`condominio`@`localhost` SQL SECURITY DEFINER VIEW `v_persona_tipo`  AS  select concat(`per`.`nombre`,'',`per`.`apellido`) AS `persona`,`tper`.`nombre` AS `tipoNombre`,`inm`.`descripcion` AS `descripcion`,`tinm`.`nombre` AS `tipoInmueble`,`tor`.`nombre` AS `nombreTorre`,`per`.`idpersona` AS `idpersona` from ((((`persona` `per` join `inmueble` `inm` on((`per`.`idpersona` = `inm`.`idpersona`))) join `tinmueble` `tinm` on((`tinm`.`idtinmueble` = `inm`.`idtinmueble`))) join `tpersona` `tper` on((`tper`.`idtpersona` = `per`.`idtpersona`))) join `torre` `tor` on((`tor`.`idtorre` = `inm`.`idtorre`))) where (`per`.`idpersona` = 1) ;

--
-- Índices para tablas volcadas
--

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
  ADD KEY `FK_AUD_OBLIGACION_PERSONA` (`aud_idpersona`),
  ADD KEY `fk_oblig_inmueble` (`idinmueble`);

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
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `idinmueble` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `obligacion`
--
ALTER TABLE `obligacion`
  MODIFY `idobligacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`idtinmueble`) REFERENCES `tinmueble` (`idtinmueble`),
  ADD CONSTRAINT `inmueble_ibfk_3` FOREIGN KEY (`idtorre`) REFERENCES `torre` (`idtorre`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`idtpersona`) REFERENCES `tpersona` (`idtpersona`);

--
-- Filtros para la tabla `recibo`
--
ALTER TABLE `recibo`
  ADD CONSTRAINT `recibo_ibfk_1` FOREIGN KEY (`idtobligacion`) REFERENCES `tobligacion` (`idtobligacion`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idpersona`) REFERENCES `persona` (`idpersona`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `rol` (`idrol`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
