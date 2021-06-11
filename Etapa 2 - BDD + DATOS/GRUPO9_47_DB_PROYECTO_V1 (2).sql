-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2021 a las 01:04:25
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
-- Base de datos: `db_restaurante`
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
(1, 'Jorge Fernando ', 'David Fernandez', 98547345, 'Col. Los Arcos, 3er Arco, 4ta Casa a la derecha'),
(2, 'Marcos Luis ', 'Canales Rivera', 84569842, 'Barrio El Chipotle, al lado de la Iglesia los Cármenes'),
(3, 'David Antonio ', 'Linarez Sociedad', 34781298, 'Residencial Roberto Alonso 3 cuadras adelante del hospital la Tirita, Casa 2 plantas azúl'),
(4, 'Mario Manuel ', 'Miranda Martínez', 87904595, 'Al lado del Parque San Francisco, casa anaranjada 3 plantas'),
(5, 'Lautaro Emmanuel ', 'Chávez Castillo', 96036528, 'Barrio Los Pajaritos, calle el Chamuco, Casa color verde oscuro, dos portones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_credito`
--

CREATE TABLE `tbl_credito` (
  `ID_TARJETA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `NUMERO` int(20) NOT NULL,
  `FECHA` varchar(5) NOT NULL,
  `CODIGO` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_credito`
--

INSERT INTO `tbl_credito` (`ID_TARJETA`, `NOMBRE`, `NUMERO`, `FECHA`, `CODIGO`) VALUES
(1, 'Jorge Fernando David Fernandez', 18756849, '05/25', 768),
(2, 'Marcos Luis Canales Rivera', 65848460, '06/22', 965),
(3, 'David Antonio Linarez Sociedad', 765849930, '03/24', 432),
(4, 'Mario Manuel Miranda Martínez', 18702365, '12/27', 417),
(5, 'Lautaro Emmanuel Chávez Castillo', 56789342, '11/23', 98);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `ID_MENU` int(11) NOT NULL,
  `COMIDA` varchar(100) NOT NULL,
  `BEBIDA` varchar(100) NOT NULL,
  `CANTIDAD` int(20) NOT NULL,
  `PRECIO` float NOT NULL,
  `SUBTOTAL` float NOT NULL,
  `IMPUESTO` float NOT NULL,
  `TOTAL` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`ID_MENU`, `COMIDA`, `BEBIDA`, `CANTIDAD`, `PRECIO`, `SUBTOTAL`, `IMPUESTO`, `TOTAL`) VALUES
(1, 'Pollo Asado con Papas', 'Coca Cola 500ml', 2, 300, 600, 90, 690),
(2, 'Sopa de Frijoles con Costilla', 'Cerveza Corona', 2, 125, 250, 37.5, 287.5),
(3, 'Pizza Grande de Pepperoni', 'Coca Cola 2L', 1, 300, 300, 45, 345),
(4, 'Menú Kerule con extra de Rule', 'Agua 1l', 3, 230, 690, 103.5, 793.5),
(5, 'Hamburguesa Kerule', 'Refresco 500ml', 2, 165, 330, 49.5, 379.5);

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
  ADD PRIMARY KEY (`ID_TARJETA`);

--
-- Indices de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`ID_MENU`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_clientes`
--
ALTER TABLE `tbl_clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_credito`
--
ALTER TABLE `tbl_credito`
  MODIFY `ID_TARJETA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `ID_MENU` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
