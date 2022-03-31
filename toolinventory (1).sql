-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-03-2022 a las 16:20:33
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `toolinventory`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `Id_Local` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `Producto_id` int(11) NOT NULL,
  `Telefono_almacen` varchar(12) DEFAULT NULL,
  `Direccion_almacen` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id_Categoria`, `Nombre_Categoria`) VALUES
(1, 'BUSO POLO'),
(2, 'CAMISETA POLO'),
(3, 'CAMISETA CUELLO REDO'),
(4, 'CAMISETA CUELLO V'),
(5, 'CAMIBUSO'),
(6, 'CAMISILLA'),
(7, 'CAMISETA ESTAMPADA'),
(11, 'chaqueta base');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre_Cliente` varchar(25) NOT NULL,
  `Correo_cliente` varchar(45) NOT NULL,
  `Direccion_cliente` varchar(45) NOT NULL,
  `RUT` int(20) NOT NULL,
  `Telefono_cliente` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `Nombre_Cliente`, `Correo_cliente`, `Direccion_cliente`, `RUT`, `Telefono_cliente`) VALUES
(11, 'Esteban', 'sapo@gmail.com', 'tugfa', 1, 2147483647);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `Id_Color` int(11) NOT NULL,
  `Color` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`Id_Color`, `Color`) VALUES
(1, 'Amarillo'),
(2, 'Blanco'),
(3, 'Negro'),
(4, 'Gris'),
(5, 'Rojo'),
(6, 'Azul'),
(7, 'Verde'),
(8, 'Rosado'),
(9, 'Salmón'),
(10, 'Morado'),
(11, 'Petróleo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_Factura` int(11) NOT NULL,
  `productosid` int(11) NOT NULL,
  `clienteid` int(11) NOT NULL,
  `Nombre_p` varchar(20) NOT NULL,
  `Precio_p` double NOT NULL,
  `Cantidad_p` int(3) NOT NULL,
  `Total` double NOT NULL,
  `Sub_total` double NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `Id_Kardex` int(11) NOT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Nombre_Producto` varchar(50) NOT NULL,
  `Valor_Venta` varchar(13) NOT NULL,
  `Valor_Compra` varchar(13) NOT NULL,
  `cantidad_productoC` int(4) NOT NULL,
  `cantidad_ProductoV` int(4) NOT NULL,
  `cantidad_productoE` int(4) NOT NULL,
  `fecha_compra` date NOT NULL,
  `fecha_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `kardex`
--

INSERT INTO `kardex` (`Id_Kardex`, `IdProducto`, `Nombre_Producto`, `Valor_Venta`, `Valor_Compra`, `cantidad_productoC`, `cantidad_ProductoV`, `cantidad_productoE`, `fecha_compra`, `fecha_venta`) VALUES
(2, 4, 'Camiseta cuello v', '123', '123', 10, 5, 5, '2022-03-11', '2022-03-13'),
(3, 3, 'Camibuzo', '123', '123', 123, 100, 23, '2022-03-12', '2022-03-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_Producto` int(11) NOT NULL,
  `Categoria_id` int(11) NOT NULL,
  `Talla_producto` int(11) NOT NULL,
  `Color_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(45) NOT NULL,
  `Precio_producto` int(20) NOT NULL,
  `Cantidad_producto` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_Producto`, `Categoria_id`, `Talla_producto`, `Color_producto`, `Nombre_producto`, `Precio_producto`, `Cantidad_producto`) VALUES
(3, 5, 1, 4, 'Camibuzo', 15000, 1),
(4, 4, 3, 2, 'Camiseta cuello v', 15000, 1),
(5, 6, 2, 3, 'Camisilla', 15000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `NIT` int(11) NOT NULL,
  `Id_prod` int(11) NOT NULL,
  `Nombre_Proveedor` varchar(45) NOT NULL,
  `Telefono_Proveedor` varchar(10) NOT NULL,
  `Direccion_Proveedor` varchar(45) NOT NULL,
  `Correo_Proveedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_Proveedor`, `NIT`, `Id_prod`, `Nombre_Proveedor`, `Telefono_Proveedor`, `Direccion_Proveedor`, `Correo_Proveedor`) VALUES
(4, 12345, 3, 'SERVE', '5632561', 'Vereda Jimena 1', 'SERVE@mail.com'),
(5, 64785, 4, 'AYE', '549321', 'Calle 98 Camila', 'AYE@mail.com'),
(6, 123512, 4, 'COTTON', '5445897', 'Distrito Pedo', 'COTTON@mail.com'),
(7, 12315212, 5, 'TEXTILES Y COLORES', '4567864', 'La calle del zodiaco 12', 'TEXTCOL@mail.com'),
(8, 123125125, 5, 'BEFORE', '78978956', 'Calle 34 con 87', 'BEFORE@mail.com'),
(31, 123, 4, 'coca cola', '123123211', 'asdasds', 'dasd@sdas'),
(32, 64688210, 4, 'COCA COLA ESPUMA', '5162383', 'Enriquecegobiano', 'SADASDA@AFSF.COM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `Id_Talla` int(11) NOT NULL,
  `Talla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `talla`
--

INSERT INTO `talla` (`Id_Talla`, `Talla`) VALUES
(1, 'S'),
(2, 'M'),
(3, 'L'),
(4, 'XL'),
(5, 'XXL'),
(6, 'XXL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contraseña_usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Nombre_usuario` varchar(20) NOT NULL,
  `Apellido_usuario` varchar(20) NOT NULL,
  `Correo_usuario` varchar(30) NOT NULL,
  `Telefono_usuario` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `Usuario`, `Contraseña_usuario`, `Nombre_usuario`, `Apellido_usuario`, `Correo_usuario`, `Telefono_usuario`) VALUES
(24, '1020460848', '827ccb0eea8a706c4c34a16891f84e7b', 'Allison', 'Giraldo', 'Alygiraldo19@gmail.com', 322544587);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`Id_Local`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `Producto_id` (`Producto_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`Id_Color`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_Factura`),
  ADD KEY `productosid` (`productosid`),
  ADD KEY `clienteid` (`clienteid`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`Id_Kardex`),
  ADD KEY `IdProducto` (`IdProducto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_Producto`),
  ADD KEY `Categoria_id` (`Categoria_id`),
  ADD KEY `Talla_producto` (`Talla_producto`),
  ADD KEY `Color_producto` (`Color_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`),
  ADD KEY `Id_prod` (`Id_prod`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`Id_Talla`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Id_Local` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `Id_Color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `Id_Kardex` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `Id_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123225;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `Id_Talla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`Id_usuario`),
  ADD CONSTRAINT `almacen_ibfk_2` FOREIGN KEY (`Producto_id`) REFERENCES `producto` (`Id_Producto`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`productosid`) REFERENCES `producto` (`Id_Producto`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`clienteid`) REFERENCES `cliente` (`ID_Cliente`);

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `kardex_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`Id_Producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Categoria_id`) REFERENCES `categoria` (`Id_Categoria`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`Talla_producto`) REFERENCES `talla` (`Id_Talla`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`Color_producto`) REFERENCES `colores` (`Id_Color`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`Id_prod`) REFERENCES `producto` (`Id_Producto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
