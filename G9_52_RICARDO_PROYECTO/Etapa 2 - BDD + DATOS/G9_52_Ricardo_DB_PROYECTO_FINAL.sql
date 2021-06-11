-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2021 a las 21:40:45
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_restaurante_kerule`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_clientes`
--

CREATE TABLE `tbl_clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `APELLIDO` varchar(100) NOT NULL,
  `TELEFONO` int(20) NOT NULL,
  `DIRECCION` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_clientes`
--

INSERT INTO `tbl_clientes` (`ID_CLIENTE`, `NOMBRE`, `APELLIDO`, `TELEFONO`, `DIRECCION`) VALUES
(6, 'Erick ', 'Santos', 32252590, 'Brisas de Altamira'),
(7, 'Maria ', 'Ortega', 77093388, 'Tres Caminos'),
(8, 'Hector ', 'Rodríguez', 38220908, 'Barrio San Blas'),
(9, 'Josue', 'Recarte', 88555590, 'Barrio San Sebastián'),
(10, 'Ricardo', 'Tovez', 12345678, 'Lomas del Rio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credito`
--

CREATE TABLE `tbl_credito` (
  `ID_TARJETA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `NUMERO` varchar(50) NOT NULL,
  `FECHA` varchar(5) NOT NULL,
  `CODIGO` int(3) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_credito`
--

INSERT INTO `tbl_credito` (`ID_TARJETA`, `NOMBRE`, `NUMERO`, `FECHA`, `CODIGO`, `ID_CLIENTE`) VALUES
(6, 'Erick David Blanco Santos', '0989 12334 3728 9013', '06/22', 33, 6),
(7, 'María José Ortega Argueta', '0044 9938 5623 1838', '12/22', 16, 7),
(8, 'Hector Josue Rodríguez Discua', '2144 5567 1520 3188', '12/21', 22, 8),
(9, 'Josue Enmanuel Bonilla Recarte', '1234 2356 7382 0928', '09/23', 51, 9),
(10, 'Ricardo Tovez Palomo', '9092 8273 8910 9302', '02/22', 23, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `COMIDA` varchar(100) NOT NULL,
  `BEBIDA` varchar(100) NOT NULL,
  `CANTIDAD` int(20) NOT NULL,
  `PRECIO` double NOT NULL,
  `SUBTOTAL` double NOT NULL,
  `IMPUESTO` double NOT NULL,
  `TOTAL` double NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `COMIDA`, `BEBIDA`, `CANTIDAD`, `PRECIO`, `SUBTOTAL`, `IMPUESTO`, `TOTAL`, `ID_CLIENTE`) VALUES
(6, 'Carne de Res Asada con Tajadas', 'Coca Cola', 1, 90, 90, 14, 104, 7),
(7, 'Huevo con Chorizo, Frijoles y Plátano', 'Jugo de Naranja', 3, 50, 150, 14, 164, 10),
(8, 'Pescado Frito con Tajadas', 'Cerveza Barena', 2, 200, 400, 14, 414, 9),
(9, 'Pasta con Camarones', 'Horchata', 4, 200, 800, 14, 814, 6),
(10, 'Tortillas con Quesillo', 'Jugo de Maracuyá', 5, 25, 125, 14, 139, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  ADD PRIMARY KEY (`ID_TARJETA`),
  ADD KEY `FK_CLIENTES_CREDITO` (`ID_CLIENTE`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`),
  ADD KEY `FK_CLIENTES_MENU` (`ID_CLIENTE`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  MODIFY `ID_TARJETA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  ADD CONSTRAINT `FK_CLIENTES_CREDITO` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_clientes` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD CONSTRAINT `FK_CLIENTES_MENU` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `tbl_clientes` (`ID_CLIENTE`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
