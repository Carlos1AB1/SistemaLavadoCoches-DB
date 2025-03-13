-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2025 a las 01:35:49
-- Versión del servidor: 10.1.26-MariaDB
-- Versión de PHP: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carwashdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `visitas` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre`, `telefono`, `email`, `zona`, `visitas`) VALUES
(1, 'Juan Pérez', '123456789', 'juan@email.com', 'Centro', 5),
(2, 'Ana López', '987654321', 'ana@email.com', 'Norte', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariosempleados`
--

CREATE TABLE `comentariosempleados` (
  `id_comentario` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `comentario` text,
  `tipo` enum('Positivo','Negativo') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comentariosempleados`
--

INSERT INTO `comentariosempleados` (`id_comentario`, `id_empleado`, `fecha`, `comentario`, `tipo`) VALUES
(1, 1, '2025-03-10', 'Excelente servicio', 'Positivo'),
(2, 2, '2025-03-11', 'Tardanza en la atención', 'Negativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprasinsumos`
--

CREATE TABLE `comprasinsumos` (
  `id_compra` int(11) NOT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comprasinsumos`
--

INSERT INTO `comprasinsumos` (`id_compra`, `id_proveedor`, `id_insumo`, `cantidad`, `fecha`) VALUES
(1, 1, 1, 50, '2025-02-15'),
(2, 2, 2, 30, '2025-02-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumoinsumos`
--

CREATE TABLE `consumoinsumos` (
  `id_consumo` int(11) NOT NULL,
  `id_orden` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `consumoinsumos`
--

INSERT INTO `consumoinsumos` (`id_consumo`, `id_orden`, `id_insumo`, `cantidad`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `puesto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `puesto`) VALUES
(1, 'Carlos Gómez', 'Lavador'),
(2, 'Pedro Díaz', 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialprecios`
--

CREATE TABLE `historialprecios` (
  `id_historial` int(11) NOT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `fecha_cambio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `insumos`
--

CREATE TABLE `insumos` (
  `id_insumo` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `insumos`
--

INSERT INTO `insumos` (`id_insumo`, `nombre`, `stock`, `precio`) VALUES
(1, 'Shampoo', 20, '5.00'),
(2, 'Cera', 15, '8.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mantenimientoequipos`
--

CREATE TABLE `mantenimientoequipos` (
  `id_mantenimiento` int(11) NOT NULL,
  `equipo` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenesservicio`
--

CREATE TABLE `ordenesservicio` (
  `id_orden` int(11) NOT NULL,
  `placa` varchar(10) DEFAULT NULL,
  `id_servicio` int(11) DEFAULT NULL,
  `id_receptor` int(11) DEFAULT NULL,
  `id_lavador` int(11) DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `estado` enum('Pendiente','Completado','Cancelado') DEFAULT NULL,
  `motivo_cancelacion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenesservicio`
--

INSERT INTO `ordenesservicio` (`id_orden`, `placa`, `id_servicio`, `id_receptor`, `id_lavador`, `fecha_recepcion`, `fecha_entrega`, `estado`, `motivo_cancelacion`) VALUES
(1, 'ABC123', 1, 2, 1, '2025-03-10 10:00:00', '2025-03-10 11:00:00', 'Completado', NULL),
(2, 'XYZ789', 2, 2, 1, '2025-03-11 14:00:00', NULL, 'Pendiente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `puntualidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `contacto`, `puntualidad`) VALUES
(1, 'Distribuidora ABC', 'abc@proveedor.com', 9),
(2, 'Suministros XYZ', 'xyz@proveedor.com', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `tipo`, `precio`) VALUES
(1, 'Lavado Básico', '20.00'),
(2, 'Lavado Premium', '35.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id_turno`, `id_empleado`, `dia_semana`, `hora_inicio`, `hora_fin`) VALUES
(1, 1, 'Lunes', '08:00:00', '16:00:00'),
(2, 2, 'Martes', '10:00:00', '18:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `placa` varchar(10) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`placa`, `id_cliente`, `tipo`) VALUES
('ABC123', 1, 'Sedán'),
('XYZ789', 2, 'SUV');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `comentariosempleados`
--
ALTER TABLE `comentariosempleados`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `comprasinsumos`
--
ALTER TABLE `comprasinsumos`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `consumoinsumos`
--
ALTER TABLE `consumoinsumos`
  ADD PRIMARY KEY (`id_consumo`),
  ADD KEY `id_orden` (`id_orden`),
  ADD KEY `id_insumo` (`id_insumo`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `historialprecios`
--
ALTER TABLE `historialprecios`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `insumos`
--
ALTER TABLE `insumos`
  ADD PRIMARY KEY (`id_insumo`);

--
-- Indices de la tabla `mantenimientoequipos`
--
ALTER TABLE `mantenimientoequipos`
  ADD PRIMARY KEY (`id_mantenimiento`);

--
-- Indices de la tabla `ordenesservicio`
--
ALTER TABLE `ordenesservicio`
  ADD PRIMARY KEY (`id_orden`),
  ADD KEY `placa` (`placa`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_receptor` (`id_receptor`),
  ADD KEY `id_lavador` (`id_lavador`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comentariosempleados`
--
ALTER TABLE `comentariosempleados`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `comprasinsumos`
--
ALTER TABLE `comprasinsumos`
  MODIFY `id_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `consumoinsumos`
--
ALTER TABLE `consumoinsumos`
  MODIFY `id_consumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historialprecios`
--
ALTER TABLE `historialprecios`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `insumos`
--
ALTER TABLE `insumos`
  MODIFY `id_insumo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mantenimientoequipos`
--
ALTER TABLE `mantenimientoequipos`
  MODIFY `id_mantenimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenesservicio`
--
ALTER TABLE `ordenesservicio`
  MODIFY `id_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentariosempleados`
--
ALTER TABLE `comentariosempleados`
  ADD CONSTRAINT `comentariosempleados_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `comprasinsumos`
--
ALTER TABLE `comprasinsumos`
  ADD CONSTRAINT `comprasinsumos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  ADD CONSTRAINT `comprasinsumos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `consumoinsumos`
--
ALTER TABLE `consumoinsumos`
  ADD CONSTRAINT `consumoinsumos_ibfk_1` FOREIGN KEY (`id_orden`) REFERENCES `ordenesservicio` (`id_orden`),
  ADD CONSTRAINT `consumoinsumos_ibfk_2` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`);

--
-- Filtros para la tabla `historialprecios`
--
ALTER TABLE `historialprecios`
  ADD CONSTRAINT `historialprecios_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`);

--
-- Filtros para la tabla `ordenesservicio`
--
ALTER TABLE `ordenesservicio`
  ADD CONSTRAINT `ordenesservicio_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `vehiculos` (`placa`),
  ADD CONSTRAINT `ordenesservicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `ordenesservicio_ibfk_3` FOREIGN KEY (`id_receptor`) REFERENCES `empleados` (`id_empleado`),
  ADD CONSTRAINT `ordenesservicio_ibfk_4` FOREIGN KEY (`id_lavador`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);

--
-- Filtros para la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD CONSTRAINT `vehiculos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
