-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2020 a las 06:50:46
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libros_online_tsbd`
--
CREATE DATABASE IF NOT EXISTS `libros_online_tsbd` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `libros_online_tsbd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_total` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL,
  `nom_compra` varchar(30) COLLATE utf8_bin NOT NULL,
  `fecha_compra` date NOT NULL,
  `costo_total` int(4) NOT NULL,
  `descripcion` text COLLATE utf8_bin NOT NULL,
  `metodo_pago` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_carrito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descripcion_carrito`
--

CREATE TABLE `descripcion_carrito` (
  `id_des_c` int(11) NOT NULL,
  `cantidad` int(4) NOT NULL,
  `id_carrito` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id_facturas` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_bin NOT NULL,
  `apellido` varchar(30) COLLATE utf8_bin NOT NULL,
  `email` varchar(30) COLLATE utf8_bin NOT NULL,
  `uso_cfdi` varchar(30) COLLATE utf8_bin NOT NULL,
  `razon_social` varchar(30) COLLATE utf8_bin NOT NULL,
  `rfc` varchar(10) COLLATE utf8_bin NOT NULL,
  `fecha_factura` date NOT NULL,
  `direccion` text COLLATE utf8_bin NOT NULL,
  `cp` int(5) NOT NULL,
  `colonia` varchar(20) COLLATE utf8_bin NOT NULL,
  `ciudad` varchar(20) COLLATE utf8_bin NOT NULL,
  `estado` varchar(20) COLLATE utf8_bin NOT NULL,
  `pais` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_compra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `nombre_libro` varchar(45) COLLATE utf8_bin NOT NULL,
  `sinopsis` varchar(150) COLLATE utf8_bin NOT NULL,
  `stock` int(2) NOT NULL,
  `cantidad_vend` int(3) NOT NULL,
  `genero` varchar(30) COLLATE utf8_bin NOT NULL,
  `costo` int(5) NOT NULL,
  `editorial` varchar(20) COLLATE utf8_bin NOT NULL,
  `anio` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `nombre_libro`, `sinopsis`, `stock`, `cantidad_vend`, `genero`, `costo`, `editorial`, `anio`) VALUES
(1, 'La Guerra de los Dioses El Sacrificio', 'Los tiempos son extraños en el imperio Mandrágora. Un dios de las cinco esencias fue asesinado, y nadie se explica cómo sucedió. Algunos dicen que el ', 60, 0, 'Fantasia', 30, 'Pablo Andrés Wunderl', 2016),
(4, 'El enigma de la habitación 622', 'Joël Dicker Escritor suizo, Joël Dicker estudió Drama en París, pero volvió a Suiza donde estudió Derecho en la Universidad de Ginebra. Dicker ha desa', 34, 23, 'Novela', 239, 'Kindle', 2020),
(6, '	 El Arte de la Guerra', 'El Arte de la Guerra es el mejor libro de estrategia de todos los tiempos. Inspiró a Napoleón, Maquiavelo, Mao Tse Tung y muchas más figuras histórica', 10, 2, 'Tratado', 69, 'Aegitas', 1869),
(7, 'Sol de Medianoche', '¡Llega la nueva novela de Stephenie Meyer! ', 100, 89, 'Ficcion', 219, 'ALFAGUARA', 2020);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_carrito_c` (`id_carrito`);

--
-- Indices de la tabla `descripcion_carrito`
--
ALTER TABLE `descripcion_carrito`
  ADD PRIMARY KEY (`id_des_c`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_carrito` (`id_carrito`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id_facturas`),
  ADD KEY `id_compra_f` (`id_compra`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descripcion_carrito`
--
ALTER TABLE `descripcion_carrito`
  MODIFY `id_des_c` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `id_facturas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `id_carrito_c` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descripcion_carrito`
--
ALTER TABLE `descripcion_carrito`
  ADD CONSTRAINT `id_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_carrito`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `id_compra_f` FOREIGN KEY (`id_compra`) REFERENCES `compra` (`id_compra`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
