-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-11-2025 a las 20:01:49
-- Versión del servidor: 11.8.3-MariaDB-log
-- Versión de PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `u898421718_observer`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblasientoelectoral`
--

CREATE TABLE `mon_tblasientoelectoral` (
  `idasientoelectoral` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `idmunicipio` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblbitacora`
--

CREATE TABLE `mon_tblbitacora` (
  `idbitacora` int(11) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblcobertura`
--

CREATE TABLE `mon_tblcobertura` (
  `idcobertura` int(11) NOT NULL,
  `descripcion` varchar(10) DEFAULT NULL,
  `idtecnologia` int(11) DEFAULT NULL,
  `idtelefonica` int(11) DEFAULT NULL,
  `idrecinto` char(15) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tbldepartamento`
--

CREATE TABLE `mon_tbldepartamento` (
  `iddepartamento` int(11) NOT NULL,
  `nombredepartamento` varchar(40) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblestadomesa`
--

CREATE TABLE `mon_tblestadomesa` (
  `idestadomesa` int(11) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblllave`
--

CREATE TABLE `mon_tblllave` (
  `idllave` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `nrollave` int(11) NOT NULL,
  `idestadollave` int(11) NOT NULL,
  `contadorractual` int(11) NOT NULL,
  `contadorrsiguiente` int(11) NOT NULL,
  `contadorcactual` int(11) NOT NULL,
  `contadorcsiguiente` int(11) NOT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblllavefoto`
--

CREATE TABLE `mon_tblllavefoto` (
  `idllavefoto` int(11) NOT NULL,
  `idllave` int(11) NOT NULL,
  `idtipofoto` int(11) NOT NULL,
  `rutafoto` varchar(255) NOT NULL,
  `numeroconter` int(11) NOT NULL,
  `fecharegistro` datetime DEFAULT current_timestamp(),
  `estadoregistro` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblllaveseguimiento`
--

CREATE TABLE `mon_tblllaveseguimiento` (
  `idllaveseguimiento` int(11) DEFAULT NULL,
  `idllave` int(11) DEFAULT NULL,
  `detalle` varchar(64) DEFAULT NULL,
  `idllaveestado` int(11) DEFAULT NULL,
  `ultimo` bit(1) DEFAULT NULL,
  `fechaseguimiento` datetime DEFAULT NULL,
  `idusuarioregistra` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblllaveusuario`
--

CREATE TABLE `mon_tblllaveusuario` (
  `idllaveusuario` int(11) DEFAULT NULL,
  `idllave` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idestadollave` int(11) DEFAULT NULL,
  `fechaseguimiento` datetime DEFAULT NULL,
  `idusuarioregistra` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblmesa`
--

CREATE TABLE `mon_tblmesa` (
  `idmesa` int(11) NOT NULL,
  `codigomesa` varchar(20) DEFAULT NULL,
  `mesa` int(11) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `idrecinto` char(15) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblmesabitacora`
--

CREATE TABLE `mon_tblmesabitacora` (
  `idmesabitacora` int(11) NOT NULL,
  `fechaevento` timestamp NULL DEFAULT NULL,
  `idestadomesa` int(11) DEFAULT NULL,
  `idmesausuario` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblmesausuario`
--

CREATE TABLE `mon_tblmesausuario` (
  `idmesausuario` int(11) NOT NULL,
  `fechaasignacion` timestamp NULL DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idmesa` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblmunicipio`
--

CREATE TABLE `mon_tblmunicipio` (
  `idmunicipio` int(11) NOT NULL,
  `nombremunicipio` varchar(40) DEFAULT NULL,
  `idprovincia` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblprovincia`
--

CREATE TABLE `mon_tblprovincia` (
  `idprovincia` int(11) NOT NULL,
  `nombreprovincia` varchar(40) DEFAULT NULL,
  `iddepartamento` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblrecinto`
--

CREATE TABLE `mon_tblrecinto` (
  `idrecinto` char(15) NOT NULL,
  `nombrerecinto` varchar(70) DEFAULT NULL,
  `uglereci` int(11) DEFAULT NULL,
  `latitud` varchar(20) DEFAULT NULL,
  `longitud` varchar(20) DEFAULT NULL,
  `estado` varchar(15) DEFAULT NULL,
  `mesas` int(11) DEFAULT NULL,
  `idasientoelectoral` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblregistrodiario`
--

CREATE TABLE `mon_tblregistrodiario` (
  `idregistrodiario` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `celular` int(11) NOT NULL,
  `fechahora` date NOT NULL,
  `fecha` date NOT NULL,
  `estacion` int(11) NOT NULL,
  `ubicacion` varchar(512) NOT NULL,
  `rini` int(11) NOT NULL,
  `rfin` int(11) NOT NULL,
  `rtotal` int(11) NOT NULL,
  `rboletas` int(11) NOT NULL,
  `estacionc` int(11) NOT NULL,
  `cini` int(11) NOT NULL,
  `cfin` int(11) NOT NULL,
  `ctotal` int(11) NOT NULL,
  `cboletas` int(11) NOT NULL,
  `tienefoto` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  `fecharegistro` datetime NOT NULL,
  `estadoregistro` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblregistrodiarioseguimiento`
--

CREATE TABLE `mon_tblregistrodiarioseguimiento` (
  `idregistrodiarioseguimiento` int(11) DEFAULT NULL,
  `idregistrodiario` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `idaccion` int(11) NOT NULL,
  `idestado` int(11) NOT NULL,
  `detalle` varchar(512) NOT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblregistrodiariotranscripcion`
--

CREATE TABLE `mon_tblregistrodiariotranscripcion` (
  `idregistrodiariotranscripcion` int(11) DEFAULT NULL,
  `idregistrodiario` int(11) DEFAULT NULL,
  `tiporegistro` char(1) NOT NULL,
  `numero` int(11) NOT NULL,
  `nombre` varchar(128) DEFAULT NULL,
  `paternomaterno` varchar(256) DEFAULT NULL,
  `calificacion1` int(11) DEFAULT NULL,
  `calificacion2` int(11) DEFAULT NULL,
  `calificacion3` int(11) DEFAULT NULL,
  `idestado` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblregistrodiarioubicacion`
--

CREATE TABLE `mon_tblregistrodiarioubicacion` (
  `idregistrodiarioubicacion` int(11) NOT NULL,
  `nombreregistrodiarioubicacion` varchar(1024) NOT NULL,
  `fecharegistro` date NOT NULL,
  `estadoregistro` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tbltecnologia`
--

CREATE TABLE `mon_tbltecnologia` (
  `idtecnologia` int(11) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mon_tblteleconica`
--

CREATE TABLE `mon_tblteleconica` (
  `idtelefonica` int(11) NOT NULL,
  `descripcion` varchar(15) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visdepartamento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visdepartamento` (
`iddepartamento` int(11)
,`nombredepartamento` varchar(40)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_vislaveusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_vislaveusuario` (
`idllaveusuario` int(11)
,`idllave` int(11)
,`idusuario` int(11)
,`idestadollave` int(11)
,`fechaseguimiento` datetime
,`idusuarioregistra` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visllave`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visllave` (
`idllave` int(11)
,`departamento` int(11)
,`nrollave` int(11)
,`idestadollave` int(11)
,`contadorractual` int(11)
,`contadorrsiguiente` int(11)
,`contadorcactual` int(11)
,`contadorcsiguiente` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visllavefoto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visllavefoto` (
`idllavefoto` int(11)
,`idllave` int(11)
,`idtipofoto` int(11)
,`rutafoto` varchar(255)
,`numeroconter` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visllaveusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visllaveusuario` (
`idllaveusuario` int(11)
,`idllave` int(11)
,`idusuario` int(11)
,`idestadollave` int(11)
,`fechaseguimiento` datetime
,`idusuarioregistra` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_vismunicipio`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_vismunicipio` (
`idmunicipio` int(11)
,`nombremunicipio` varchar(40)
,`idprovincia` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visrecinto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visrecinto` (
`idrecinto` char(15)
,`nombrerecinto` varchar(70)
,`uglereci` int(11)
,`latitud` varchar(20)
,`longitud` varchar(20)
,`estado` varchar(15)
,`mesas` int(11)
,`idasientoelectoral` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visregistrodiario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visregistrodiario` (
`idregistrodiario` int(11)
,`idusuario` int(11)
,`celular` int(11)
,`fechahora` date
,`fecha` date
,`estacion` int(11)
,`ubicacion` varchar(512)
,`rini` int(11)
,`rfin` int(11)
,`rtotal` int(11)
,`rboletas` int(11)
,`estacionc` int(11)
,`cini` int(11)
,`cfin` int(11)
,`ctotal` int(11)
,`cboletas` int(11)
,`tienefoto` int(11)
,`idestado` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
,`usuario` varchar(30)
,`nombres` varchar(40)
,`primerapellido` varchar(30)
,`segundoapellido` varchar(30)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visregistrodiarioseguimiento`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visregistrodiarioseguimiento` (
`idregistrodiarioseguimiento` int(11)
,`idregistrodiario` int(11)
,`descripcion` varchar(100)
,`idusuario` int(11)
,`fecha` datetime
,`idaccion` int(11)
,`idestado` int(11)
,`detalle` varchar(512)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visregistrodiariotranscripcion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visregistrodiariotranscripcion` (
`idregistrodiariotranscripcion` int(11)
,`idregistrodiario` int(11)
,`tiporegistro` char(1)
,`numero` int(11)
,`nombre` varchar(128)
,`paternomaterno` varchar(256)
,`calificacion1` int(11)
,`calificacion2` int(11)
,`calificacion3` int(11)
,`idestado` int(11)
,`idusuario` int(11)
,`fecha` date
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `mon_visregistrodiarioubicacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `mon_visregistrodiarioubicacion` (
`idregistrodiarioubicacion` int(11)
,`nombreregistrodiarioubicacion` varchar(1024)
,`fecharegistro` date
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_tblrol`
--

CREATE TABLE `seg_tblrol` (
  `idrol` int(11) NOT NULL,
  `roldescripcion` varchar(30) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_tblusuario`
--

CREATE TABLE `seg_tblusuario` (
  `idusuario` int(11) NOT NULL,
  `cedula` int(11) DEFAULT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `primerapellido` varchar(30) DEFAULT NULL,
  `segundoapellido` varchar(30) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `usuario` varchar(30) DEFAULT NULL,
  `clave` varchar(256) DEFAULT NULL,
  `estadousuario` bit(1) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_tblusuariologueado`
--

CREATE TABLE `seg_tblusuariologueado` (
  `idusuariologueado` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idrolusuario` int(11) DEFAULT NULL,
  `llave` varchar(300) DEFAULT NULL,
  `idestadollave` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `direccionip` varchar(25) DEFAULT NULL,
  `direccionhost` varchar(25) DEFAULT NULL,
  `direcciondest` varchar(250) DEFAULT NULL,
  `idubicacion` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seg_tblusuariorol`
--

CREATE TABLE `seg_tblusuariorol` (
  `idusuariorol` int(11) DEFAULT NULL,
  `fechaalta` timestamp NULL DEFAULT NULL,
  `fechabaja` timestamp NULL DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `idrol` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `fecharegistro` datetime DEFAULT NULL,
  `estadoregistro` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `seg_visrol`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `seg_visrol` (
`idrol` int(11)
,`roldescripcion` varchar(30)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `seg_visusuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `seg_visusuario` (
`idusuario` int(11)
,`cedula` int(11)
,`nombres` varchar(40)
,`primerapellido` varchar(30)
,`segundoapellido` varchar(30)
,`fechanacimiento` date
,`usuario` varchar(30)
,`clave` varchar(256)
,`estadousuario` bit(1)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `seg_visusuariorol`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `seg_visusuariorol` (
`idusuariorol` int(11)
,`fechaalta` timestamp
,`fechabaja` timestamp
,`estado` bit(1)
,`idrol` int(11)
,`idusuario` int(11)
,`fecharegistro` datetime
,`estadoregistro` bit(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vis_tblllave`
--

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `vis_tblllave`  AS SELECT `mon_tblllave`.`idllave` AS `idllave`, `mon_tblllave`.`departamento` AS `departamento`, `mon_tblllave`.`nrollave` AS `nrollave`, `u898421718_observer`.`mon_tblllave`.`asignado` AS `asignado`, `u898421718_observer`.`mon_tblllave`.`contadorractual` AS `contadorractual`, `u898421718_observer`.`mon_tblllave`.`contadorrsiguiente` AS `contadorrsiguiente`, `u898421718_observer`.`mon_tblllave`.`contadorcactual` AS `contadorcactual`, `u898421718_observer`.`mon_tblllave`.`contadorcsiguiente` AS `contadorcsiguiente`, `u898421718_observer`.`mon_tblllave`.`fecharegistro` AS `fecharegistro`, `u898421718_observer`.`mon_tblllave`.`estadoregistro` AS `estadoregistro` FROM `mon_tblllave` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mon_tblasientoelectoral`
--
ALTER TABLE `mon_tblasientoelectoral`
  ADD PRIMARY KEY (`idasientoelectoral`),
  ADD KEY `mon_tbl_municipio_mon_tbl_asientoelectoral` (`idmunicipio`);

--
-- Indices de la tabla `mon_tblbitacora`
--
ALTER TABLE `mon_tblbitacora`
  ADD PRIMARY KEY (`idbitacora`),
  ADD KEY `mon_tbl_usuario_mon_tbl_bitacora` (`idusuario`);

--
-- Indices de la tabla `mon_tblcobertura`
--
ALTER TABLE `mon_tblcobertura`
  ADD PRIMARY KEY (`idcobertura`),
  ADD KEY `mon_tbl_tecnologia_mon_tbl_cobertura` (`idtecnologia`),
  ADD KEY `mon_tbl_telefonica_mon_tbl_cobertura` (`idtelefonica`),
  ADD KEY `mon_tbl_recinto_mon_tbl_cobertura` (`idrecinto`);

--
-- Indices de la tabla `mon_tbldepartamento`
--
ALTER TABLE `mon_tbldepartamento`
  ADD PRIMARY KEY (`iddepartamento`);

--
-- Indices de la tabla `mon_tblestadomesa`
--
ALTER TABLE `mon_tblestadomesa`
  ADD PRIMARY KEY (`idestadomesa`);

--
-- Indices de la tabla `mon_tblmesa`
--
ALTER TABLE `mon_tblmesa`
  ADD PRIMARY KEY (`idmesa`),
  ADD KEY `mon_tbl_recinto_mon_tbl_mesa` (`idrecinto`);

--
-- Indices de la tabla `mon_tblmesabitacora`
--
ALTER TABLE `mon_tblmesabitacora`
  ADD PRIMARY KEY (`idmesabitacora`),
  ADD KEY `mon_tbl_mesausuario_mon_tbl_mesabitacora` (`idmesausuario`),
  ADD KEY `mon_tbl_estadomesa_mon_tbl_mesabitacora` (`idestadomesa`);

--
-- Indices de la tabla `mon_tblmesausuario`
--
ALTER TABLE `mon_tblmesausuario`
  ADD PRIMARY KEY (`idmesausuario`),
  ADD KEY `mon_tbl_mesa_mon_tbl_mesausuario` (`idmesa`),
  ADD KEY `mon_tbl_usuario_mon_tbl_mesausuario` (`idusuario`);

--
-- Indices de la tabla `mon_tblmunicipio`
--
ALTER TABLE `mon_tblmunicipio`
  ADD PRIMARY KEY (`idmunicipio`),
  ADD KEY `mon_tbl_provincia_mon_tbl_municipio` (`idprovincia`);

--
-- Indices de la tabla `mon_tblprovincia`
--
ALTER TABLE `mon_tblprovincia`
  ADD PRIMARY KEY (`idprovincia`),
  ADD KEY `mon_tbl_departamento_mon_tbl_provincia` (`iddepartamento`);

--
-- Indices de la tabla `mon_tblrecinto`
--
ALTER TABLE `mon_tblrecinto`
  ADD PRIMARY KEY (`idrecinto`),
  ADD KEY `mon_tbl_asientoelectoral_mon_tbl_recinto` (`idasientoelectoral`);

--
-- Indices de la tabla `mon_tbltecnologia`
--
ALTER TABLE `mon_tbltecnologia`
  ADD PRIMARY KEY (`idtecnologia`);

--
-- Indices de la tabla `mon_tblteleconica`
--
ALTER TABLE `mon_tblteleconica`
  ADD PRIMARY KEY (`idtelefonica`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mon_tblbitacora`
--
ALTER TABLE `mon_tblbitacora`
  MODIFY `idbitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblcobertura`
--
ALTER TABLE `mon_tblcobertura`
  MODIFY `idcobertura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblestadomesa`
--
ALTER TABLE `mon_tblestadomesa`
  MODIFY `idestadomesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblmesa`
--
ALTER TABLE `mon_tblmesa`
  MODIFY `idmesa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblmesabitacora`
--
ALTER TABLE `mon_tblmesabitacora`
  MODIFY `idmesabitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblmesausuario`
--
ALTER TABLE `mon_tblmesausuario`
  MODIFY `idmesausuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tbltecnologia`
--
ALTER TABLE `mon_tbltecnologia`
  MODIFY `idtecnologia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mon_tblteleconica`
--
ALTER TABLE `mon_tblteleconica`
  MODIFY `idtelefonica` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visdepartamento`
--
DROP TABLE IF EXISTS `mon_visdepartamento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visdepartamento`  AS SELECT `mon_tbldepartamento`.`iddepartamento` AS `iddepartamento`, `mon_tbldepartamento`.`nombredepartamento` AS `nombredepartamento` FROM `mon_tbldepartamento` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_vislaveusuario`
--
DROP TABLE IF EXISTS `mon_vislaveusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_vislaveusuario`  AS SELECT `mon_tblllaveusuario`.`idllaveusuario` AS `idllaveusuario`, `mon_tblllaveusuario`.`idllave` AS `idllave`, `mon_tblllaveusuario`.`idusuario` AS `idusuario`, `mon_tblllaveusuario`.`idestadollave` AS `idestadollave`, `mon_tblllaveusuario`.`fechaseguimiento` AS `fechaseguimiento`, `mon_tblllaveusuario`.`idusuarioregistra` AS `idusuarioregistra`, `mon_tblllaveusuario`.`fecharegistro` AS `fecharegistro`, `mon_tblllaveusuario`.`estadoregistro` AS `estadoregistro` FROM `mon_tblllaveusuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visllave`
--
DROP TABLE IF EXISTS `mon_visllave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visllave`  AS SELECT `mon_tblllave`.`idllave` AS `idllave`, `mon_tblllave`.`departamento` AS `departamento`, `mon_tblllave`.`nrollave` AS `nrollave`, `mon_tblllave`.`idestadollave` AS `idestadollave`, `mon_tblllave`.`contadorractual` AS `contadorractual`, `mon_tblllave`.`contadorrsiguiente` AS `contadorrsiguiente`, `mon_tblllave`.`contadorcactual` AS `contadorcactual`, `mon_tblllave`.`contadorcsiguiente` AS `contadorcsiguiente`, `mon_tblllave`.`fecharegistro` AS `fecharegistro`, `mon_tblllave`.`estadoregistro` AS `estadoregistro` FROM `mon_tblllave` WHERE `mon_tblllave`.`estadoregistro` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visllavefoto`
--
DROP TABLE IF EXISTS `mon_visllavefoto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visllavefoto`  AS SELECT `mon_tblllavefoto`.`idllavefoto` AS `idllavefoto`, `mon_tblllavefoto`.`idllave` AS `idllave`, `mon_tblllavefoto`.`idtipofoto` AS `idtipofoto`, `mon_tblllavefoto`.`rutafoto` AS `rutafoto`, `mon_tblllavefoto`.`numeroconter` AS `numeroconter`, `mon_tblllavefoto`.`fecharegistro` AS `fecharegistro`, `mon_tblllavefoto`.`estadoregistro` AS `estadoregistro` FROM `mon_tblllavefoto` WHERE `mon_tblllavefoto`.`estadoregistro` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visllaveusuario`
--
DROP TABLE IF EXISTS `mon_visllaveusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visllaveusuario`  AS SELECT `mon_tblllaveusuario`.`idllaveusuario` AS `idllaveusuario`, `mon_tblllaveusuario`.`idllave` AS `idllave`, `mon_tblllaveusuario`.`idusuario` AS `idusuario`, `mon_visllave`.`idestadollave` AS `idestadollave`, `mon_tblllaveusuario`.`fechaseguimiento` AS `fechaseguimiento`, `mon_tblllaveusuario`.`idusuarioregistra` AS `idusuarioregistra`, `mon_tblllaveusuario`.`fecharegistro` AS `fecharegistro`, `mon_tblllaveusuario`.`estadoregistro` AS `estadoregistro` FROM (`mon_tblllaveusuario` join `mon_visllave`) WHERE `mon_tblllaveusuario`.`estadoregistro` = 1 AND `mon_visllave`.`idllave` = `mon_tblllaveusuario`.`idllave` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_vismunicipio`
--
DROP TABLE IF EXISTS `mon_vismunicipio`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_vismunicipio`  AS SELECT `mon_tblmunicipio`.`idmunicipio` AS `idmunicipio`, `mon_tblmunicipio`.`nombremunicipio` AS `nombremunicipio`, `mon_tblmunicipio`.`idprovincia` AS `idprovincia` FROM `mon_tblmunicipio` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visrecinto`
--
DROP TABLE IF EXISTS `mon_visrecinto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visrecinto`  AS SELECT `mon_tblrecinto`.`idrecinto` AS `idrecinto`, `mon_tblrecinto`.`nombrerecinto` AS `nombrerecinto`, `mon_tblrecinto`.`uglereci` AS `uglereci`, `mon_tblrecinto`.`latitud` AS `latitud`, `mon_tblrecinto`.`longitud` AS `longitud`, `mon_tblrecinto`.`estado` AS `estado`, `mon_tblrecinto`.`mesas` AS `mesas`, `mon_tblrecinto`.`idasientoelectoral` AS `idasientoelectoral` FROM `mon_tblrecinto` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visregistrodiario`
--
DROP TABLE IF EXISTS `mon_visregistrodiario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visregistrodiario`  AS SELECT `mon_tblregistrodiario`.`idregistrodiario` AS `idregistrodiario`, `mon_tblregistrodiario`.`idusuario` AS `idusuario`, `mon_tblregistrodiario`.`celular` AS `celular`, `mon_tblregistrodiario`.`fechahora` AS `fechahora`, `mon_tblregistrodiario`.`fecha` AS `fecha`, `mon_tblregistrodiario`.`estacion` AS `estacion`, `mon_tblregistrodiario`.`ubicacion` AS `ubicacion`, `mon_tblregistrodiario`.`rini` AS `rini`, `mon_tblregistrodiario`.`rfin` AS `rfin`, `mon_tblregistrodiario`.`rtotal` AS `rtotal`, `mon_tblregistrodiario`.`rboletas` AS `rboletas`, `mon_tblregistrodiario`.`estacionc` AS `estacionc`, `mon_tblregistrodiario`.`cini` AS `cini`, `mon_tblregistrodiario`.`cfin` AS `cfin`, `mon_tblregistrodiario`.`ctotal` AS `ctotal`, `mon_tblregistrodiario`.`cboletas` AS `cboletas`, `mon_tblregistrodiario`.`tienefoto` AS `tienefoto`, `mon_tblregistrodiario`.`idestado` AS `idestado`, `mon_tblregistrodiario`.`fecharegistro` AS `fecharegistro`, `mon_tblregistrodiario`.`estadoregistro` AS `estadoregistro`, `u`.`usuario` AS `usuario`, `u`.`nombres` AS `nombres`, `u`.`primerapellido` AS `primerapellido`, `u`.`segundoapellido` AS `segundoapellido` FROM (`mon_tblregistrodiario` join `seg_visusuario` `u`) WHERE `mon_tblregistrodiario`.`estadoregistro` = 1 AND `mon_tblregistrodiario`.`idusuario` = `u`.`idusuario` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visregistrodiarioseguimiento`
--
DROP TABLE IF EXISTS `mon_visregistrodiarioseguimiento`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visregistrodiarioseguimiento`  AS SELECT `mon_tblregistrodiarioseguimiento`.`idregistrodiarioseguimiento` AS `idregistrodiarioseguimiento`, `mon_tblregistrodiarioseguimiento`.`idregistrodiario` AS `idregistrodiario`, `mon_tblregistrodiarioseguimiento`.`descripcion` AS `descripcion`, `mon_tblregistrodiarioseguimiento`.`idusuario` AS `idusuario`, `mon_tblregistrodiarioseguimiento`.`fecha` AS `fecha`, `mon_tblregistrodiarioseguimiento`.`idaccion` AS `idaccion`, `mon_tblregistrodiarioseguimiento`.`idestado` AS `idestado`, `mon_tblregistrodiarioseguimiento`.`detalle` AS `detalle`, `mon_tblregistrodiarioseguimiento`.`fecharegistro` AS `fecharegistro`, `mon_tblregistrodiarioseguimiento`.`estadoregistro` AS `estadoregistro` FROM `mon_tblregistrodiarioseguimiento` WHERE `mon_tblregistrodiarioseguimiento`.`estadoregistro` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visregistrodiariotranscripcion`
--
DROP TABLE IF EXISTS `mon_visregistrodiariotranscripcion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visregistrodiariotranscripcion`  AS SELECT `mon_tblregistrodiariotranscripcion`.`idregistrodiariotranscripcion` AS `idregistrodiariotranscripcion`, `mon_tblregistrodiariotranscripcion`.`idregistrodiario` AS `idregistrodiario`, `mon_tblregistrodiariotranscripcion`.`tiporegistro` AS `tiporegistro`, `mon_tblregistrodiariotranscripcion`.`numero` AS `numero`, `mon_tblregistrodiariotranscripcion`.`nombre` AS `nombre`, `mon_tblregistrodiariotranscripcion`.`paternomaterno` AS `paternomaterno`, `mon_tblregistrodiariotranscripcion`.`calificacion1` AS `calificacion1`, `mon_tblregistrodiariotranscripcion`.`calificacion2` AS `calificacion2`, `mon_tblregistrodiariotranscripcion`.`calificacion3` AS `calificacion3`, `mon_tblregistrodiariotranscripcion`.`idestado` AS `idestado`, `mon_tblregistrodiariotranscripcion`.`idusuario` AS `idusuario`, `mon_tblregistrodiariotranscripcion`.`fecha` AS `fecha`, `mon_tblregistrodiariotranscripcion`.`fecharegistro` AS `fecharegistro`, `mon_tblregistrodiariotranscripcion`.`estadoregistro` AS `estadoregistro` FROM `mon_tblregistrodiariotranscripcion` WHERE `mon_tblregistrodiariotranscripcion`.`estadoregistro` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `mon_visregistrodiarioubicacion`
--
DROP TABLE IF EXISTS `mon_visregistrodiarioubicacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `mon_visregistrodiarioubicacion`  AS SELECT `mon_tblregistrodiarioubicacion`.`idregistrodiarioubicacion` AS `idregistrodiarioubicacion`, `mon_tblregistrodiarioubicacion`.`nombreregistrodiarioubicacion` AS `nombreregistrodiarioubicacion`, `mon_tblregistrodiarioubicacion`.`fecharegistro` AS `fecharegistro`, `mon_tblregistrodiarioubicacion`.`estadoregistro` AS `estadoregistro` FROM `mon_tblregistrodiarioubicacion` WHERE 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `seg_visrol`
--
DROP TABLE IF EXISTS `seg_visrol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `seg_visrol`  AS SELECT `seg_tblrol`.`idrol` AS `idrol`, `seg_tblrol`.`roldescripcion` AS `roldescripcion`, `seg_tblrol`.`fecharegistro` AS `fecharegistro`, `seg_tblrol`.`estadoregistro` AS `estadoregistro` FROM `seg_tblrol` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `seg_visusuario`
--
DROP TABLE IF EXISTS `seg_visusuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `seg_visusuario`  AS SELECT `seg_tblusuario`.`idusuario` AS `idusuario`, `seg_tblusuario`.`cedula` AS `cedula`, `seg_tblusuario`.`nombres` AS `nombres`, `seg_tblusuario`.`primerapellido` AS `primerapellido`, `seg_tblusuario`.`segundoapellido` AS `segundoapellido`, `seg_tblusuario`.`fechanacimiento` AS `fechanacimiento`, `seg_tblusuario`.`usuario` AS `usuario`, `seg_tblusuario`.`clave` AS `clave`, `seg_tblusuario`.`estadousuario` AS `estadousuario`, `seg_tblusuario`.`fecharegistro` AS `fecharegistro`, `seg_tblusuario`.`estadoregistro` AS `estadoregistro` FROM `seg_tblusuario` WHERE `seg_tblusuario`.`estadoregistro` = 1 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `seg_visusuariorol`
--
DROP TABLE IF EXISTS `seg_visusuariorol`;

CREATE ALGORITHM=UNDEFINED DEFINER=`u898421718_observer_user`@`127.0.0.1` SQL SECURITY DEFINER VIEW `seg_visusuariorol`  AS SELECT `seg_tblusuariorol`.`idusuariorol` AS `idusuariorol`, `seg_tblusuariorol`.`fechaalta` AS `fechaalta`, `seg_tblusuariorol`.`fechabaja` AS `fechabaja`, `seg_tblusuariorol`.`estado` AS `estado`, `seg_tblusuariorol`.`idrol` AS `idrol`, `seg_tblusuariorol`.`idusuario` AS `idusuario`, `seg_tblusuariorol`.`fecharegistro` AS `fecharegistro`, `seg_tblusuariorol`.`estadoregistro` AS `estadoregistro` FROM `seg_tblusuariorol` WHERE `seg_tblusuariorol`.`estadoregistro` = 1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mon_tblasientoelectoral`
--
ALTER TABLE `mon_tblasientoelectoral`
  ADD CONSTRAINT `mon_tbl_municipio_mon_tbl_asientoelectoral` FOREIGN KEY (`idmunicipio`) REFERENCES `mon_tblmunicipio` (`idmunicipio`);

--
-- Filtros para la tabla `mon_tblbitacora`
--
ALTER TABLE `mon_tblbitacora`
  ADD CONSTRAINT `mon_tbl_usuario_mon_tbl_bitacora` FOREIGN KEY (`idusuario`) REFERENCES `seg_tblusuario` (`idusuario`);

--
-- Filtros para la tabla `mon_tblcobertura`
--
ALTER TABLE `mon_tblcobertura`
  ADD CONSTRAINT `mon_tbl_recinto_mon_tbl_cobertura` FOREIGN KEY (`idrecinto`) REFERENCES `mon_tblrecinto` (`idrecinto`),
  ADD CONSTRAINT `mon_tbl_tecnologia_mon_tbl_cobertura` FOREIGN KEY (`idtecnologia`) REFERENCES `mon_tbltecnologia` (`idtecnologia`),
  ADD CONSTRAINT `mon_tbl_telefonica_mon_tbl_cobertura` FOREIGN KEY (`idtelefonica`) REFERENCES `mon_tblteleconica` (`idtelefonica`);

--
-- Filtros para la tabla `mon_tblmesa`
--
ALTER TABLE `mon_tblmesa`
  ADD CONSTRAINT `mon_tbl_recinto_mon_tbl_mesa` FOREIGN KEY (`idrecinto`) REFERENCES `mon_tblrecinto` (`idrecinto`);

--
-- Filtros para la tabla `mon_tblmesabitacora`
--
ALTER TABLE `mon_tblmesabitacora`
  ADD CONSTRAINT `mon_tbl_estadomesa_mon_tbl_mesabitacora` FOREIGN KEY (`idestadomesa`) REFERENCES `mon_tblestadomesa` (`idestadomesa`),
  ADD CONSTRAINT `mon_tbl_mesausuario_mon_tbl_mesabitacora` FOREIGN KEY (`idmesausuario`) REFERENCES `mon_tblmesausuario` (`idmesausuario`);

--
-- Filtros para la tabla `mon_tblmesausuario`
--
ALTER TABLE `mon_tblmesausuario`
  ADD CONSTRAINT `mon_tbl_mesa_mon_tbl_mesausuario` FOREIGN KEY (`idmesa`) REFERENCES `mon_tblmesa` (`idmesa`),
  ADD CONSTRAINT `mon_tbl_usuario_mon_tbl_mesausuario` FOREIGN KEY (`idusuario`) REFERENCES `seg_tblusuario` (`idusuario`);

--
-- Filtros para la tabla `mon_tblmunicipio`
--
ALTER TABLE `mon_tblmunicipio`
  ADD CONSTRAINT `mon_tbl_provincia_mon_tbl_municipio` FOREIGN KEY (`idprovincia`) REFERENCES `mon_tblprovincia` (`idprovincia`);

--
-- Filtros para la tabla `mon_tblprovincia`
--
ALTER TABLE `mon_tblprovincia`
  ADD CONSTRAINT `mon_tbl_departamento_mon_tbl_provincia` FOREIGN KEY (`iddepartamento`) REFERENCES `mon_tbldepartamento` (`iddepartamento`);

--
-- Filtros para la tabla `mon_tblrecinto`
--
ALTER TABLE `mon_tblrecinto`
  ADD CONSTRAINT `mon_tbl_asientoelectoral_mon_tbl_recinto` FOREIGN KEY (`idasientoelectoral`) REFERENCES `mon_tblasientoelectoral` (`idasientoelectoral`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
