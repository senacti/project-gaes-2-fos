-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2023 a las 06:02:51
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEvento` (IN `p_COD_ORDEN` INT, IN `p_FECHA` DATE, IN `p_ACTIVIDADES` VARCHAR(45), IN `p_PRODUCTOS` VARCHAR(45), IN `p_CANTIDAD_PRODUCTOS` INT, IN `p_DESCRIPCION_EVENTO` VARCHAR(45), IN `p_ID_PRODUCTO` INT, IN `p_ID_VENTA` INT, IN `p_COD_EVENTO` INT)   BEGIN
  INSERT INTO `orden_eventos` (
    `COD_ORDEN`,
    `FECHA`,
    `ACTIVIDADES`,
    `PRODUCTOS`,
    `CANTIDAD_PRODUCTOS`,
    `DESCRIPCION_EVENTO`,
    `ID_PRODUCTO`,
    `ID_VENTA`,
    `COD_EVENTO`
  ) VALUES (
    p_COD_ORDEN,
    p_FECHA,
    p_ACTIVIDADES,
    p_PRODUCTOS,
    p_CANTIDAD_PRODUCTOS,
    p_DESCRIPCION_EVENTO,
    p_ID_PRODUCTO,
    p_ID_VENTA,
    p_COD_EVENTO
  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerActividades` ()   BEGIN
  SELECT * FROM actividades;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDireccionCliente` (IN `idCliente` INT)   BEGIN
  DECLARE direccionCliente VARCHAR(45);

  -- Obtener la dirección del cliente según su ID
  SELECT DIRECCION INTO direccionCliente
  FROM domicilio
  WHERE ID_CLIENTE = idCliente
  LIMIT 1;

  -- Imprimir la dirección del cliente
  SELECT direccionCliente AS 'Dirección del Cliente';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerDomiciliosPorEstado` (IN `estado` INT)   BEGIN
    SELECT * FROM domicilio WHERE COD_ESTADO_D = estado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerEventos` ()   BEGIN
  SELECT * FROM eventos;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerInventario` ()   BEGIN
  SELECT * FROM inventario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorMarca` (IN `marca` VARCHAR(45))   BEGIN
  SELECT *
  FROM producto
  WHERE MARCA_PRO = marca;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RealizarVentaCompleja` (IN `p_ID_VENTA` INT, IN `p_FECHA_VEN` DATE, IN `p_CANTIDAD_VEN` INT, IN `p_ENVIO_VEN` VARCHAR(45), IN `p_VALOR_UNITARIO` INT, IN `p_DESCUENTO` INT, IN `p_IVA` INT, IN `p_ID_PRODUCTO` INT, IN `p_ID_CLIENTE` INT)   BEGIN
  -- Variables locales
  DECLARE v_SUBTOTAL INT;
  DECLARE v_TOTAL INT;
  
  -- Calcular subtotal
  SET v_SUBTOTAL = p_CANTIDAD_VEN * p_VALOR_UNITARIO;
  
  -- Calcular descuento
  IF p_DESCUENTO IS NOT NULL THEN
    SET v_SUBTOTAL = v_SUBTOTAL - p_DESCUENTO;
  END IF;
  
  -- Calcular IVA
  SET v_TOTAL = v_SUBTOTAL + (v_SUBTOTAL * p_IVA / 100);
  
  -- Insertar venta
  INSERT INTO `venta` (
    `ID_VENTA`,
    `FECHA_VEN`,
    `CANTIDAD_VEN`,
    `ENVIO_VEN`,
    `VALOR_UNITARIO`,
    `DESCUENTO`,
    `IVA`,
    `SUBTOTAL`,
    `TOTAL`,
    `ID_PRODUCTO`,
    `ID_CLIENTE`
  ) VALUES (
    p_ID_VENTA,
    p_FECHA_VEN,
    p_CANTIDAD_VEN,
    p_ENVIO_VEN,
    p_VALOR_UNITARIO,
    p_DESCUENTO,
    p_IVA,
    v_SUBTOTAL,
    v_TOTAL,
    p_ID_PRODUCTO,
    p_ID_CLIENTE
  );
  
  SELECT 'Venta realizada correctamente.' AS Resultado;
  
  -- Realizar otras acciones complejas aquí...
  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividades`
--

CREATE TABLE `actividades` (
  `COD_ACTIVIDAD` int(10) NOT NULL,
  `NOMBRE` varchar(20) DEFAULT NULL,
  `ESTADO` varchar(45) DEFAULT NULL,
  `TIEMPO_DT` datetime DEFAULT NULL,
  `COD_TE` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='				';

--
-- Volcado de datos para la tabla `actividades`
--

INSERT INTO `actividades` (`COD_ACTIVIDAD`, `NOMBRE`, `ESTADO`, `TIEMPO_DT`, `COD_TE`) VALUES
(1, 'Mesero', 'Disponible', '2023-05-25 22:26:34', 1),
(2, 'Cocinero', 'No Disponible', '2023-05-25 22:26:49', 1),
(3, 'DJ', 'Disponible', '2023-05-25 22:27:00', 2),
(4, 'Animador', 'No Disponible', '2023-05-25 22:27:18', 3),
(5, 'Titiritero', 'Disponible', '2023-05-25 22:27:27', 4),
(6, 'Bartender', 'No Disponible', '2023-05-25 22:27:35', 1),
(7, 'Aseador', 'No Disponible', '2023-05-25 22:27:44', 1),
(8, 'Guardia de Seguridad', 'Disponible', '2023-06-17 10:00:00', 2),
(9, 'DJ_2', 'Disponible', '2023-06-17 10:00:00', 2);

--
-- Disparadores `actividades`
--
DELIMITER $$
CREATE TRIGGER `actividades_trigger` AFTER INSERT ON `actividades` FOR EACH ROW BEGIN
    -- Acciones a realizar después de insertar un nuevo registro en la tabla
    -- Ejemplo: INSERT INTO log_actividades (COD_ACTIVIDAD, ACCION) VALUES (NEW.COD_ACTIVIDAD, 'Insertado');
    -- Aquí puedes realizar la lógica personalizada que necesites
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `actividades_trigger_after_update` AFTER UPDATE ON `actividades` FOR EACH ROW BEGIN
    -- Acciones a realizar después de actualizar un registro en la tabla
    -- Ejemplo: INSERT INTO log_actividades (COD_ACTIVIDAD, ACCION) VALUES (NEW.COD_ACTIVIDAD, 'Actualizado');
    -- Aquí puedes realizar la lógica personalizada que necesites
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `COD_CATEGORIA_P` int(11) NOT NULL,
  `CATEGORIA` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`COD_CATEGORIA_P`, `CATEGORIA`) VALUES
(1, 'Piñata'),
(2, 'Eventos'),
(3, 'Cosas varias ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `COD_CIUDAD` int(11) NOT NULL,
  `CIUDAD` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`COD_CIUDAD`, `CIUDAD`) VALUES
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_CLIENTE`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50),
(51),
(52),
(53),
(54),
(55),
(56),
(57),
(58),
(59),
(60),
(61),
(62),
(63),
(64),
(65),
(66),
(67),
(68),
(69),
(70),
(71),
(72),
(73),
(74),
(75),
(76),
(77),
(78),
(79),
(80),
(81),
(82),
(83),
(84),
(85),
(86),
(87),
(88),
(89),
(90),
(91),
(92),
(93),
(94),
(95),
(96),
(97),
(98),
(99),
(100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `ID_DOMICILIO` int(11) NOT NULL,
  `NRO_GUIA` int(11) DEFAULT NULL,
  `FECHA` date DEFAULT NULL,
  `DIRECCION` varchar(45) DEFAULT NULL,
  `COD_ESTADO_D` int(11) DEFAULT NULL,
  `ID_VENTA` int(11) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`ID_DOMICILIO`, `NRO_GUIA`, `FECHA`, `DIRECCION`, `COD_ESTADO_D`, `ID_VENTA`, `ID_CLIENTE`) VALUES
(1, 12345, '2023-05-10', 'Calle Falsa 123', 2, 1, 1),
(2, 67890, '2023-05-11', 'Av. Siempreviva 742', 1, 1, 2),
(3, 13579, '2023-05-12', 'Pasaje del Terror 13', 2, 1, 13),
(4, 65, '2023-05-02', 'Cll 151 C # 109 A 50', 1, 1, 1),
(5, 67, '2023-05-03', 'Ak. 58 #127-59', 1, 2, 10),
(6, 69, '2023-05-04', 'Av. Boyac? #80-94', 2, 3, 9),
(7, 71, '2023-05-05', 'Av. C/ 63 #60-80', 1, 4, 50),
(8, 73, '2023-05-06', 'Cl. 24 #27a - 62', 2, 5, 20),
(9, 75, '2023-05-07', 'Cra. 13 #6510', 2, 5, 6),
(10, 77, '2023-05-08', 'Cra. 6 #15-88', 1, 28, 4),
(11, 79, '2023-05-09', 'Cra. 104 #148 - 07', 2, 30, 3),
(12, 81, '2023-05-10', 'Cra. 13 #63-27', 1, 30, 2),
(13, 83, '2023-05-11', 'Cl. 12c #3-07', 1, 28, 1),
(14, 85, '2023-05-12', 'Cra. 11 #82-71', 2, 10, 58),
(15, 87, '2023-05-13', '?Cl. 145 #91-19', 1, 12, 100),
(16, 89, '2023-05-14', 'Cl. 147 #101-56', 1, 15, 50),
(17, 91, '2023-05-16', 'Cl. 145 #91-34', 2, 20, 28),
(18, 93, '2023-05-17', 'Cra. 13 #55 - 45', 1, 23, 60),
(19, 95, '2023-05-22', 'Cra. 13 #54-56', 2, 24, 10),
(20, 97, '2023-05-26', 'Cl. 72 #13-85', 1, 17, 100);

--
-- Disparadores `domicilio`
--
DELIMITER $$
CREATE TRIGGER `afterInsertDomicilio` AFTER INSERT ON `domicilio` FOR EACH ROW BEGIN
  -- Obtener el ID de venta del nuevo registro de domicilio
  DECLARE idVenta INT;
  SET idVenta = NEW.ID_VENTA;

  -- Actualizar el campo "ENVIO_VEN" en la tabla "venta" según el ID de venta
  UPDATE venta
  SET ENVIO_VEN = 'Enviado'
  WHERE ID_VENTA = idVenta;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `ID_EMPLEADO` int(11) NOT NULL,
  `EMPLEADO` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`ID_EMPLEADO`, `EMPLEADO`) VALUES
(1, 'Juan Pérez'),
(2, 'María Gómez'),
(3, 'Pedro Rodríguez'),
(4, 'Daniel Marin'),
(5, 'Osman Sex'),
(6, 'Felipe Matador'),
(7, 'Johan Smith Rodriguez'),
(8, 'Maycha Muñoz Reyes'),
(9, 'David Guabave Vargas'),
(10, 'Jose Javier Guabave'),
(11, 'Imelda Vargas Angarita'),
(12, 'Juan Camilo Guabave'),
(13, 'Mariela Vargas Angarita'),
(14, 'Nelson Antonio Vargas'),
(15, 'Andres Felipe Sanchez'),
(16, 'Daniel Felipe Garzon'),
(17, 'Ana Sofia Ballesteros'),
(18, 'Elizabeth Polo'),
(19, 'Erick Daniel Renteria'),
(20, 'Karen Sofia Cardenas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_transportadora`
--

CREATE TABLE `empresa_transportadora` (
  `NIT_EMPRESA` int(11) NOT NULL,
  `FECHA_ENTREGA` varchar(45) DEFAULT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresa_transportadora`
--

INSERT INTO `empresa_transportadora` (`NIT_EMPRESA`, `FECHA_ENTREGA`, `ID_DOMICILIO`) VALUES
(246810121, '2023-05-13', 20),
(369121518, '2023-05-14', 4),
(909090909, '2023-05-11', 4),
(951753852, '2023-05-15', 5),
(987654321, '2023-05-12', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrada`
--

CREATE TABLE `entrada` (
  `COD_ENTRADA` int(10) NOT NULL,
  `CANTIDAD` int(100) DEFAULT NULL,
  `DETALLE` varchar(30) DEFAULT NULL,
  `FECHA_ENTRADA` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrada`
--

INSERT INTO `entrada` (`COD_ENTRADA`, `CANTIDAD`, `DETALLE`, `FECHA_ENTRADA`) VALUES
(1, 50, 'Buen estado', '2023-05-11'),
(2, 100, 'Piezas en mal estado', '2023-05-10'),
(3, 75, 'Productos estropeados ', '2023-05-09'),
(4, 500, 'Buen estado', '2023-06-17'),
(5, 1000, 'Piezas para uso de evento', '1900-01-17'),
(6, 1500, 'Productos Disponibles', '2023-06-18'),
(7, 2000, 'Piezas mal estado', '2023-06-19'),
(8, 2500, 'Buen estado', '2023-06-20'),
(9, 3000, 'Piezas para uso de evento', '2023-06-21'),
(10, 3500, 'Productos Disponibles', '2023-06-21'),
(11, 4000, 'Piezas mal estado', '2023-06-22'),
(12, 4500, 'Buen estado', '2023-06-23'),
(13, 5000, 'Piezas para uso de evento', '2023-06-17'),
(14, 5500, 'Productos Disponibles', '2023-06-23'),
(15, 6000, 'Piezas mal estado', '2023-06-24'),
(16, 6500, 'Buen estado', '2023-06-25'),
(17, 7000, 'Piezas para uso de evento', '2023-06-26'),
(18, 7500, 'Productos Disponibles', '2023-06-27'),
(19, 8000, 'Piezas mal estado', '2023-06-28'),
(20, 8500, 'Buen estado', '2023-06-29'),
(21, 9000, 'Piezas para uso de evento', '2023-06-30'),
(22, 9500, 'Productos Disponibles', '2023-07-01'),
(23, 10000, 'Piezas mal estado', '2023-06-02'),
(24, 10500, 'Buen estado', '2023-06-03'),
(25, 11000, 'Piezas para uso de evento', '2023-06-04'),
(26, 11500, 'Productos Disponibles', '2023-07-05'),
(27, 12000, 'Piezas mal estado', '2023-06-06'),
(28, 12500, 'Buen estado', '2023-07-12'),
(29, 13000, 'Piezas para uso de evento', '2023-07-13'),
(30, 13500, 'Productos Disponibles', '2023-07-14'),
(31, 14000, 'Piezas mal estado', '2023-07-14'),
(32, 14500, 'Buen estado', '2023-07-15'),
(33, 15000, 'Piezas para uso de evento', '2023-07-16'),
(34, 15500, 'Productos Disponibles', '2023-07-17'),
(35, 16000, 'Piezas mal estado', '2023-07-17'),
(36, 16500, 'Buen estado', '2023-07-18'),
(37, 17000, 'Piezas para uso de evento', '2023-07-19'),
(38, 17500, 'Productos Disponibles', '2023-07-20'),
(39, 18000, 'Piezas mal estado', '2023-07-21'),
(40, 18500, 'Buen estado', '2023-07-22'),
(41, 19000, 'Piezas para uso de evento', '2023-07-23'),
(42, 19500, 'Productos Disponibles', '2023-07-23'),
(43, 20000, 'Piezas mal estado', '2023-07-24'),
(44, 20500, 'Buen estado', '2023-06-23'),
(45, 21000, 'Piezas para uso de evento', '2023-06-14'),
(46, 21500, 'Productos Disponibles', '2023-06-05'),
(47, 22000, 'Piezas mal estado', '2023-06-21'),
(48, 22500, 'Buen estado', '2023-06-30'),
(49, 23000, 'Piezas para uso de evento', '2023-06-13'),
(50, 23500, 'Productos Disponibles', '2023-06-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_domicilio`
--

CREATE TABLE `estado_domicilio` (
  `COD_ESTADO_D` int(10) NOT NULL,
  `ESTADO_D` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_domicilio`
--

INSERT INTO `estado_domicilio` (`COD_ESTADO_D`, `ESTADO_D`) VALUES
(1, 'Entregado\r'),
(2, 'Pendiente\r');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_evento`
--

CREATE TABLE `estado_evento` (
  `COD_ESTADO_E` int(11) NOT NULL,
  `ESTADO_E` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_evento`
--

INSERT INTO `estado_evento` (`COD_ESTADO_E`, `ESTADO_E`) VALUES
(1, 'No-Disponible'),
(2, 'Disponible');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_producto`
--

CREATE TABLE `estado_producto` (
  `COD_ESTADO_P` int(10) NOT NULL,
  `ESTADO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_producto`
--

INSERT INTO `estado_producto` (`COD_ESTADO_P`, `ESTADO`) VALUES
(1, 'Activo\r'),
(2, 'Inactivo\r'),
(3, 'Agotado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_proveedor`
--

CREATE TABLE `estado_proveedor` (
  `COD_ESTADO` int(10) NOT NULL,
  `ESTADO_P` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_proveedor`
--

INSERT INTO `estado_proveedor` (`COD_ESTADO`, `ESTADO_P`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_solicitud`
--

CREATE TABLE `estado_solicitud` (
  `COD_ESTADO_S` int(10) NOT NULL,
  `ESTADO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estado_solicitud`
--

INSERT INTO `estado_solicitud` (`COD_ESTADO_S`, `ESTADO`) VALUES
(1, 'En proceso'),
(2, 'Cancelado'),
(3, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `COD_EVENTO` int(11) NOT NULL,
  `TEMATICA` varchar(45) DEFAULT NULL,
  `COD_ESTADO_E` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`COD_EVENTO`, `TEMATICA`, `COD_ESTADO_E`) VALUES
(1, 'Fiesta de cumpleaños', 2),
(2, 'Boda', 2),
(3, 'Quince años', 2),
(4, 'Baby showers', 2),
(5, 'Grados', 2),
(6, 'Primeras comuniones y confirmaciones ', 1);

--
-- Disparadores `eventos`
--
DELIMITER $$
CREATE TRIGGER `eventos_trigger` AFTER INSERT ON `eventos` FOR EACH ROW BEGIN
    -- Acciones a realizar después de insertar un nuevo registro en la tabla
    -- Ejemplo: INSERT INTO log_eventos (COD_EVENTO, ACCION) VALUES (NEW.COD_EVENTO, 'Insertado');
    -- Aquí puedes realizar la lógica personalizada que necesites
  END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `eventos_trigger_after_update` AFTER UPDATE ON `eventos` FOR EACH ROW BEGIN
    -- Acciones a realizar después de actualizar un registro en la tabla
    -- Ejemplo: INSERT INTO log_eventos (COD_EVENTO, ACCION) VALUES (NEW.COD_EVENTO, 'Actualizado');
    -- Aquí puedes realizar la lógica personalizada que necesites
  END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha_nacimiento`
--

CREATE TABLE `fecha_nacimiento` (
  `COD_FECHA_N` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `ID_USUARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `fecha_nacimiento`
--

INSERT INTO `fecha_nacimiento` (`COD_FECHA_N`, `FECHA`, `ID_USUARIO`) VALUES
(1, '1980-06-15', 10),
(2, '2013-05-17', 11),
(3, '2004-04-01', 27),
(4, '2002-06-21', 24),
(5, '1999-06-04', 11),
(6, '1998-06-04', 12),
(7, '1969-10-24', 21),
(8, '1977-06-08', 7),
(9, '1978-09-11', 15),
(10, '1980-11-11', 14),
(11, '2000-12-12', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `COD_GENERO` int(10) NOT NULL,
  `GENERO` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`COD_GENERO`, `GENERO`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'No binario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `ID_INVENTARIO` int(11) NOT NULL,
  `STOCK` varchar(45) DEFAULT NULL,
  `CANTIDAD_IN` int(11) DEFAULT NULL,
  `CANT_MINIMA` int(11) DEFAULT NULL,
  `COD_ENTRADA` int(10) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL,
  `COD_SALIDA` int(11) DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_INVENTARIO`, `STOCK`, `CANTIDAD_IN`, `CANT_MINIMA`, `COD_ENTRADA`, `ID_EMPLEADO`, `COD_SALIDA`, `ID_PRODUCTO`) VALUES
(1010, 'SI ', 1000, 500, 50, 1, 10, 10),
(2020, 'NO', 2000, 1000, 49, 2, 11, 20),
(3030, 'SI ', 3000, 1500, 48, 3, 9, 30),
(4040, 'SI ', 4000, 2000, 20, 4, 8, 40),
(5050, 'NO', 5000, 2500, 12, 5, 7, 50),
(6060, 'SI ', 6000, 3000, 40, 6, 6, 60),
(7070, 'SI ', 7000, 3500, 47, 7, 5, 70),
(8080, 'NO', 8000, 4000, 8, 2, 50, 80),
(9090, 'SI ', 9000, 4500, 44, 7, 49, 90),
(10100, 'SI ', 10000, 5000, 16, 8, 8, 100),
(11110, 'NO', 11000, 5500, 4, 9, 48, 110),
(12120, 'SI ', 12000, 6000, 49, 10, 32, 200),
(13130, 'SI ', 13000, 6500, 16, 11, 31, 150),
(14140, 'NO', 14000, 7000, 4, 12, 30, 250),
(15150, 'SI ', 15000, 7500, 44, 11, 23, 260),
(16160, 'SI ', 16000, 8000, 28, 12, 26, 300),
(17170, 'NO', 17000, 8500, 47, 15, 47, 50),
(18180, 'SI ', 18000, 9000, 27, 18, 20, 10),
(19190, 'SI ', 19000, 9500, 32, 20, 5, 20),
(20200, 'NO', 20000, 10000, 48, 17, 45, 500),
(21210, 'SI ', 21000, 10500, 39, 5, 4, 480),
(22220, 'SI ', 22000, 11000, 22, 6, 4, 420),
(23230, 'NO', 23000, 11500, 50, 7, 10, 350),
(24240, 'SI ', 24000, 12000, 2, 8, 36, 300),
(25250, 'SI ', 25000, 12500, 8, 2, 20, 310),
(26260, 'NO', 26000, 13000, NULL, NULL, NULL, NULL),
(27270, 'SI ', 27000, 13500, NULL, NULL, NULL, NULL),
(28280, 'SI ', 28000, 14000, NULL, NULL, NULL, NULL),
(29290, 'NO', 29000, 14500, NULL, NULL, NULL, NULL),
(30300, 'SI ', 30000, 15000, NULL, NULL, NULL, NULL),
(31310, 'SI ', 31000, 15500, NULL, NULL, NULL, NULL),
(32320, 'NO', 32000, 16000, NULL, NULL, NULL, NULL),
(33330, 'SI ', 33000, 16500, NULL, NULL, NULL, NULL),
(34340, 'SI ', 34000, 17000, NULL, NULL, NULL, NULL),
(35350, 'NO', 35000, 17500, NULL, NULL, NULL, NULL),
(36360, 'SI ', 36000, 18000, NULL, NULL, NULL, NULL),
(37370, 'SI ', 37000, 18500, NULL, NULL, NULL, NULL),
(38380, 'NO', 38000, 19000, NULL, NULL, NULL, NULL),
(39390, 'SI ', 39000, 19500, NULL, NULL, NULL, NULL),
(40400, 'SI ', 40000, 20000, NULL, NULL, NULL, NULL),
(41410, 'SI ', 41000, 20500, NULL, NULL, NULL, NULL),
(42420, 'NO', 42000, 21000, NULL, NULL, NULL, NULL),
(43430, 'SI ', 43000, 21500, NULL, NULL, NULL, NULL),
(44440, 'SI ', 44000, 22000, NULL, NULL, NULL, NULL),
(45450, 'NO', 45000, 22500, NULL, NULL, NULL, NULL),
(46460, 'SI ', 46000, 23000, NULL, NULL, NULL, NULL),
(47470, 'SI ', 47000, 23500, NULL, NULL, NULL, NULL),
(48480, 'NO', 48000, 24000, NULL, NULL, NULL, NULL),
(49490, 'SI ', 49000, 24500, NULL, NULL, NULL, NULL),
(50500, 'NO', 50000, 25000, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_eventos`
--

CREATE TABLE `orden_eventos` (
  `COD_ORDEN` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `ACTIVIDADES` varchar(45) DEFAULT NULL,
  `PRODUCTOS` varchar(45) DEFAULT NULL,
  `CANTIDAD_PRODUCTOS` int(11) DEFAULT NULL,
  `DESCRIPCION_EVENTO` varchar(45) DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL,
  `ID_VENTA` int(11) DEFAULT NULL,
  `COD_EVENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden_eventos`
--

INSERT INTO `orden_eventos` (`COD_ORDEN`, `FECHA`, `ACTIVIDADES`, `PRODUCTOS`, `CANTIDAD_PRODUCTOS`, `DESCRIPCION_EVENTO`, `ID_PRODUCTO`, `ID_VENTA`, `COD_EVENTO`) VALUES
(1, '2023-06-15', 'Mesero, Cocinero, DJ, Animador, Bartender, As', 'Bebidas alcohólicas, bocadillos, refrescos, l', 200, 'Boda', 130, 20, 1),
(2, '2023-06-15', 'Música en vivo, presentación de artistas loca', 'Bebidas alcohólicas, bocadillos, refrescos', 200, 'Primera comunion', 190, 30, 2),
(3, '2023-06-15', 'Música en vivo, presentación de artistas loca', 'Bebidas alcohólicas, bocadillos, refrescos', 200, 'Boda', 100, 25, 3),
(4, '2023-07-02', 'Baile karaoke', 'Bebidas sin alcohol, comida rápida', 100, 'Confirmación', 500, 1, 4),
(5, '2023-07-02', 'Baile, karaoke', 'Bebidas sin alcohol, comida rápida', 100, 'Cumpleaños', 280, 2, 5),
(6, '2023-07-02', 'Baile karaoke', 'Bebidas sin alcohol, comida rápida', 100, 'Grado', 180, 23, 6),
(7, '2023-08-10', 'Taller de pintura, presentación de artistas', 'Bebidas sin alcohol, refrigerios', 50, 'Funeral, noche de entierro', 200, 15, 1),
(8, '2023-09-01', 'Presentación musical', 'Bebidas alcohólicas, bocadillos', 150, 'Concierto', 250, 10, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `NOMBRE_PRO` varchar(45) DEFAULT NULL,
  `MARCA_PRO` varchar(45) DEFAULT NULL,
  `CANTIDAD_PRO` int(11) DEFAULT NULL,
  `FECHA_FABRICACION` date DEFAULT NULL,
  `COLOR_PRO` varchar(45) DEFAULT NULL,
  `PROMOCION` varchar(45) DEFAULT NULL,
  `DESCUENTO` int(11) DEFAULT NULL,
  `COD_ESTADO_P` int(11) DEFAULT NULL,
  `COD_ CATEGORIA_P` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_PRODUCTO`, `NOMBRE_PRO`, `MARCA_PRO`, `CANTIDAD_PRO`, `FECHA_FABRICACION`, `COLOR_PRO`, `PROMOCION`, `DESCUENTO`, `COD_ESTADO_P`, `COD_ CATEGORIA_P`) VALUES
(10, 'Globos', 'Payaso', 50, '0000-00-00', 'Multicolor', 'Tiene ', 10000, 1, 3),
(20, 'Pi?atas', 'Payasito ', 100, '0000-00-00', 'Multicolor', 'No tiene', 15000, 3, 2),
(30, 'Manteles', 'Nerium', 150, '0000-00-00', 'Multicolor', 'Segun el dia', 20000, 2, 1),
(40, 'juguetes', 'Hasbro', 200, '0000-00-00', 'Multicolor', 'Tiene ', 25000, 3, 2),
(50, 'peluches', 'Pepe Ganga', 250, '0000-00-00', 'Multicolor', 'No tiene', 30000, 1, 1),
(60, 'anchetas', 'House Cas', 300, '0000-00-00', 'Multicolor', 'Segun el dia', 35000, 2, 2),
(70, 'dulces', 'Colombina', 350, '0000-00-00', 'Multicolor', 'Tiene ', 40000, 1, 3),
(80, 'vasos', 'corona', 400, '0000-00-00', 'Multicolor', 'No tiene', 45000, 3, 1),
(90, 'letreros', 'Alixpr', 450, '0000-00-00', 'Multicolor', 'Segun el dia', 50000, 3, 2),
(100, 'gorros', 'Today', 500, '0000-00-00', 'Multicolor', 'Tiene ', 55000, 1, 3),
(110, 'diademas', 'Colombiana S.A', 550, '0000-00-00', 'Multicolor', 'No tiene', 60000, 3, 1),
(120, 'decoracion en icopor', 'Sue?os S.A.S', 600, '0000-00-00', 'Multicolor', 'Segun el dia', 65000, 1, 2),
(130, 'accesorios', 'salco', 650, '0000-00-00', 'Multicolor', 'Tiene ', 70000, 1, 1),
(140, 'Globos', 'Payaso', 700, '0000-00-00', 'Multicolor', 'No tiene', 75000, 3, 2),
(150, 'Pi?atas', 'Payasito ', 750, '0000-00-00', 'Multicolor', 'Segun el dia', 80000, 3, 3),
(160, 'Manteles', 'Nerium', 800, '0000-00-00', 'Multicolor', 'Tiene ', 85000, 1, 3),
(170, 'juguetes', 'Hasbro', 850, '0000-00-00', 'Multicolor', 'No tiene', 90000, 2, 1),
(180, 'peluches', 'Pepe Ganga', 900, '0000-00-00', 'Multicolor', 'Segun el dia', 95000, 3, 2),
(190, 'anchetas', 'House Cas', 950, '0000-00-00', 'Multicolor', 'Tiene ', 100000, 1, 3),
(200, 'dulces', 'Colombina', 1000, '0000-00-00', 'Multicolor', 'No tiene', 105000, 1, 2),
(210, 'vasos', 'corona', 1050, '0000-00-00', 'Multicolor', 'Segun el dia', 110000, 2, 1),
(220, 'letreros', 'Alixpr', 1100, '0000-00-00', 'Multicolor', 'Tiene ', 115000, 3, 2),
(230, 'gorros', 'Today', 1150, '0000-00-00', 'Multicolor', 'No tiene', 120000, 1, 3),
(240, 'diademas', 'Colombiana S.A', 1200, '0000-00-00', 'Multicolor', 'Segun el dia', 125000, 2, 1),
(250, 'decoracion en icopor', 'Sue?os S.A.S', 1250, '0000-00-00', 'Multicolor', 'Tiene ', 130000, 3, 2),
(260, 'accesorios', 'salco', 1300, '0000-00-00', 'Multicolor', 'No tiene', 135000, NULL, NULL),
(270, 'Globos', 'Payaso', 1350, '0000-00-00', 'Multicolor', 'Segun el dia', 140000, NULL, NULL),
(280, 'Pi?atas', 'Payasito ', 1400, '0000-00-00', 'Multicolor', 'Tiene ', 145000, NULL, NULL),
(290, 'Manteles', 'Nerium', 1450, '0000-00-00', 'Multicolor', 'No tiene', 150000, NULL, NULL),
(300, 'juguetes', 'Hasbro', 1500, '0000-00-00', 'Multicolor', 'Segun el dia', 155000, NULL, NULL),
(310, 'peluches', 'Pepe Ganga', 1550, '0000-00-00', 'Multicolor', 'Tiene ', 160000, NULL, NULL),
(320, 'anchetas', 'House Cas', 1600, '0000-00-00', 'Multicolor', 'No tiene', 165000, NULL, NULL),
(330, 'dulces', 'Colombina', 1650, '0000-00-00', 'Multicolor', 'Segun el dia', 170000, NULL, NULL),
(340, 'vasos', 'corona', 1700, '0000-00-00', 'Multicolor', 'Tiene ', 175000, NULL, NULL),
(350, 'letreros', 'Alixpr', 1750, '0000-00-00', 'Multicolor', 'No tiene', 180000, NULL, NULL),
(360, 'gorros', 'Today', 1800, '0000-00-00', 'Multicolor', 'Tiene ', 185000, NULL, NULL),
(370, 'diademas', 'Colombiana S.A', 1850, '0000-00-00', 'Multicolor', 'No tiene', 190000, NULL, NULL),
(380, 'Globos', 'Payaso', 1900, '0000-00-00', 'Multicolor', 'Segun el dia', 195000, NULL, NULL),
(390, 'Pi?atas', 'Payasito ', 1950, '0000-00-00', 'Multicolor', 'Tiene ', 200000, NULL, NULL),
(400, 'Manteles', 'Nerium', 2000, '0000-00-00', 'Multicolor', 'No tiene', 205000, NULL, NULL),
(410, 'juguetes', 'Hasbro', 2050, '0000-00-00', 'Multicolor', 'Segun el dia', 210000, NULL, NULL),
(420, 'peluches', 'Pepe Ganga', 2100, '0000-00-00', 'Multicolor', 'Tiene ', 215000, NULL, NULL),
(430, 'anchetas', 'House Cas', 2150, '0000-00-00', 'Multicolor', 'No tiene', 220000, NULL, NULL),
(440, 'dulces', 'Colombina', 2200, '0000-00-00', 'Multicolor', 'Segun el dia', 225000, NULL, NULL),
(450, 'vasos', 'corona', 2250, '0000-00-00', 'Multicolor', 'Tiene ', 230000, NULL, NULL),
(460, 'letreros', 'Alixpr', 2300, '0000-00-00', 'Multicolor', 'No tiene', 235000, NULL, NULL),
(470, 'gorros', 'Today', 2350, '0000-00-00', 'Multicolor', 'Tiene ', 240000, NULL, NULL),
(480, 'diademas', 'Payaso', 2400, '0000-00-00', 'Multicolor', 'No tiene', 245000, NULL, NULL),
(490, 'decoracion en icopor', 'Payasito ', 2450, '0000-00-00', 'Multicolor', 'Segun el dia', 250000, NULL, NULL),
(500, 'Globos', 'Nerium', 2500, '0000-00-00', 'Multicolor', 'Tiene ', 255000, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `NIT` int(11) DEFAULT NULL,
  `NOM_REP_LEGAL` varchar(45) DEFAULT NULL,
  `TELEFONO` int(10) DEFAULT NULL,
  `ID_SOLICITUD_P` int(11) DEFAULT NULL,
  `COD_ESTADO_PROVE` int(11) DEFAULT NULL,
  `COD_CIUDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`ID_PROVEEDOR`, `NIT`, `NOM_REP_LEGAL`, `TELEFONO`, `ID_SOLICITUD_P`, `COD_ESTADO_PROVE`, `COD_CIUDAD`) VALUES
(1, 123456789, 'Juan Perez', 987573653, 123, 1, 1),
(2, 987654321, 'Maria Gomez', 214748364, 246, 2, 2),
(3, 456789123, 'Pedro Rodriguez', 214748369, 369, 3, 3),
(4, 987654321, 'Maria Gomez', 214748362, 492, 1, 1),
(5, 456789123, 'Pedro Rodriguez', 214748367, 615, 1, 2),
(6, 123456789, 'Juan Perez', 214748364, 1111, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `COD_SALIDA` int(11) NOT NULL,
  `CANTIDAD_S` int(11) DEFAULT NULL,
  `DETALLE` varchar(45) DEFAULT NULL,
  `FECHA_SALIDA` datetime DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`COD_SALIDA`, `CANTIDAD_S`, `DETALLE`, `FECHA_SALIDA`, `ID_PRODUCTO`) VALUES
(1, 500, 'Piezas en mal estado', '0000-00-00 00:00:00', 10),
(2, 1000, 'Retiro por proveedor', '0000-00-00 00:00:00', 20),
(3, 1500, 'Uso de eventos', '0000-00-00 00:00:00', 30),
(4, 2000, 'Devoluciones', '0000-00-00 00:00:00', 40),
(5, 2500, 'Productos vencidos', '0000-00-00 00:00:00', 50),
(6, 3000, 'Piezas en mal estado', '0000-00-00 00:00:00', 60),
(7, 3500, 'Retiro por proveedor', '0000-00-00 00:00:00', 70),
(8, 4000, 'Uso de eventos', '0000-00-00 00:00:00', 80),
(9, 4500, 'Devoluciones', '0000-00-00 00:00:00', 90),
(10, 5000, 'Productos vencidos', '0000-00-00 00:00:00', 100),
(11, 5500, 'Piezas en mal estado', '0000-00-00 00:00:00', 110),
(12, 6000, 'Retiro por proveedor', '0000-00-00 00:00:00', 120),
(13, 6500, 'Uso de eventos', '0000-00-00 00:00:00', 130),
(14, 7000, 'Devoluciones', '0000-00-00 00:00:00', 140),
(15, 7500, 'Productos vencidos', '0000-00-00 00:00:00', 150),
(16, 8000, 'Piezas en mal estado', '0000-00-00 00:00:00', 160),
(17, 8500, 'Retiro por proveedor', '0000-00-00 00:00:00', 170),
(18, 9000, 'Uso de eventos', '0000-00-00 00:00:00', 180),
(19, 9500, 'Devoluciones', '0000-00-00 00:00:00', 190),
(20, 10000, 'Productos vencidos', '0000-00-00 00:00:00', 200),
(21, 10500, 'Piezas en mal estado', '0000-00-00 00:00:00', 210),
(22, 11000, 'Retiro por proveedor', '0000-00-00 00:00:00', 220),
(23, 11500, 'Uso de eventos', '0000-00-00 00:00:00', 230),
(24, 12000, 'Devoluciones', '0000-00-00 00:00:00', 240),
(25, 12500, 'Productos vencidos', '0000-00-00 00:00:00', 250),
(26, 13000, 'Piezas en mal estado', '0000-00-00 00:00:00', 260),
(27, 13500, 'Retiro por proveedor', '0000-00-00 00:00:00', 270),
(28, 14000, 'Uso de eventos', '0000-00-00 00:00:00', 280),
(29, 14500, 'Devoluciones', '0000-00-00 00:00:00', 290),
(30, 15000, 'Productos vencidos', '0000-00-00 00:00:00', 300),
(31, 15500, 'Piezas en mal estado', '0000-00-00 00:00:00', 310),
(32, 16000, 'Retiro por proveedor', '0000-00-00 00:00:00', 320),
(33, 16500, 'Uso de eventos', '0000-00-00 00:00:00', 330),
(34, 17000, 'Devoluciones', '0000-00-00 00:00:00', 340),
(35, 17500, 'Productos vencidos', '0000-00-00 00:00:00', 350),
(36, 18000, 'Piezas en mal estado', '0000-00-00 00:00:00', 360),
(37, 18500, 'Retiro por proveedor', '0000-00-00 00:00:00', 370),
(38, 19000, 'Uso de eventos', '0000-00-00 00:00:00', 380),
(39, 19500, 'Devoluciones', '0000-00-00 00:00:00', 390),
(40, 20000, 'Productos vencidos', '0000-00-00 00:00:00', 400),
(41, 20500, 'Piezas en mal estado', '0000-00-00 00:00:00', 410),
(42, 21000, 'Retiro por proveedor', '0000-00-00 00:00:00', 420),
(43, 21500, 'Uso de eventos', '0000-00-00 00:00:00', 430),
(44, 22000, 'Devoluciones', '0000-00-00 00:00:00', 10),
(45, 22500, 'Productos vencidos', '0000-00-00 00:00:00', 20),
(46, 23000, 'Piezas en mal estado', '0000-00-00 00:00:00', 30),
(47, 23500, 'Retiro por proveedor', '0000-00-00 00:00:00', 40),
(48, 24000, 'Uso de eventos', '0000-00-00 00:00:00', 50),
(49, 24500, 'Devoluciones', '0000-00-00 00:00:00', 60),
(50, 25000, 'Productos vencidos', '0000-00-00 00:00:00', 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud_producto`
--

CREATE TABLE `solicitud_producto` (
  `ID_SOLICITUD_P` int(11) NOT NULL,
  `PRECIO_PEDIDO` int(11) DEFAULT NULL,
  `FECHA_ENTREGA` datetime DEFAULT NULL,
  `COD_ESTADO_S` int(11) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitud_producto`
--

INSERT INTO `solicitud_producto` (`ID_SOLICITUD_P`, `PRECIO_PEDIDO`, `FECHA_ENTREGA`, `COD_ESTADO_S`, `ID_EMPLEADO`) VALUES
(123, 5000, NULL, 1, 1),
(246, 10000, NULL, 2, 2),
(369, 15000, NULL, 3, 3),
(492, 20000, NULL, 1, 4),
(615, 25000, NULL, 2, 5),
(738, 30000, NULL, 3, 6),
(861, 35000, NULL, 1, 7),
(984, 40000, NULL, 2, 8),
(1107, 45000, NULL, 3, 9),
(1111, 200, '2023-05-15 10:00:00', 1, 1),
(1230, 50000, NULL, 1, 11),
(1353, 55000, NULL, 2, 12),
(1476, 60000, NULL, 3, 13),
(1599, 65000, NULL, 1, 14),
(1722, 70000, NULL, 2, 15),
(1845, 75000, NULL, 3, 16),
(1968, 80000, NULL, 1, 17),
(2091, 85000, NULL, 2, 18),
(2214, 90000, NULL, 1, 19),
(2222, 350, '2023-05-17 14:00:00', 2, 2),
(2337, 95000, NULL, 2, 12),
(2460, 100000, NULL, 3, 10),
(2583, 105000, NULL, 1, 1),
(2706, 110000, NULL, 2, 2),
(2829, 115000, NULL, 3, 20),
(2952, 120000, NULL, NULL, NULL),
(3075, 125000, NULL, NULL, NULL),
(3198, 130000, NULL, NULL, NULL),
(3321, 135000, NULL, NULL, NULL),
(3444, 140000, NULL, NULL, NULL),
(3567, 145000, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempo_trabajo`
--

CREATE TABLE `tiempo_trabajo` (
  `COD_TDT` int(10) NOT NULL,
  `HORARIO` varchar(20) DEFAULT NULL,
  `DIAS` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tiempo_trabajo`
--

INSERT INTO `tiempo_trabajo` (`COD_TDT`, `HORARIO`, `DIAS`) VALUES
(1, '08:00 - 17:00', 'Lunes a Viernes'),
(2, '09:00 - 18:00', 'Martes a Sábados'),
(3, '07:00 - 16:00', 'Miércoles a Domingos'),
(4, '10:00 - 19:00', 'Jueves a Lunes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_cliente`
--

CREATE TABLE `tipo_cliente` (
  `COD_TIPO_C` int(11) NOT NULL,
  `TIPO_CLIENTE` varchar(45) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_cliente`
--

INSERT INTO `tipo_cliente` (`COD_TIPO_C`, `TIPO_CLIENTE`, `ID_CLIENTE`) VALUES
(1, 'Premium', 1),
(2, 'Estándar', 2),
(3, 'Básico', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_empleado`
--

CREATE TABLE `tipo_empleado` (
  `COD_TE` int(10) NOT NULL,
  `TIPO_EMPLEADO` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_empleado`
--

INSERT INTO `tipo_empleado` (`COD_TE`, `TIPO_EMPLEADO`) VALUES
(1, 'Gerente'),
(2, 'Vendedor'),
(3, 'Técnico'),
(4, 'Asistente'),
(5, 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificacion`
--

CREATE TABLE `tipo_identificacion` (
  `ID_TIPO_IDENTI` int(11) NOT NULL,
  `TIPO_IDENTIFI` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_identificacion`
--

INSERT INTO `tipo_identificacion` (`ID_TIPO_IDENTI`, `TIPO_IDENTIFI`) VALUES
(1, 'Cédula'),
(2, 'Pasaporte'),
(3, 'Carné de extranjería');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_USUARIO` int(10) NOT NULL,
  `PRIMER_NOMBRE` varchar(30) DEFAULT NULL,
  `SEGUNDO_NOMBRE` varchar(30) DEFAULT NULL,
  `PRIMER_APELLIDO` varchar(30) DEFAULT NULL,
  `SEGUNDO_APELLIDO` varchar(30) DEFAULT NULL,
  `TELEFONO` int(10) DEFAULT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `ID_EMPLEADO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `PRIMER_NOMBRE`, `SEGUNDO_NOMBRE`, `PRIMER_APELLIDO`, `SEGUNDO_APELLIDO`, `TELEFONO`, `CORREO`, `DIRECCION`, `ID_EMPLEADO`) VALUES
(1, 'Juan', 'Pablo', 'García', 'Pérez', 123456789, 'juan@example.com', 'Calle Principal 1', 1),
(2, 'María', 'Luisa', 'López', 'Gómez', 987654321, 'maria@example.com', 'Avenida Central 2', 2),
(3, 'Carlos', NULL, 'Sánchez', 'Martínez', 555555555, 'carlos@example.com', 'Calle Secundaria 3', 3),
(4, 'Ana', 'Isabel', 'González', 'Rodríguez', 111111111, 'ana@example.com', 'Avenida Principal 4', 4),
(5, 'Pedro', 'José', 'Ramírez', 'Soto', 222222222, 'pedro@example.com', 'Calle Central 5', 5),
(6, 'Luis', NULL, 'Hernández', 'Guzmán', 333333333, 'luis@example.com', 'Calle Secundaria 6', 6),
(7, 'Marta', 'Lucía', 'Torres', 'Fernández', 444444444, 'marta@example.com', 'Avenida Principal 7', 7),
(8, 'Sofía', NULL, 'López', 'Sánchez', 555555555, 'sofia@example.com', 'Calle Central 8', 8),
(9, 'David', 'Andrés', 'Mendoza', 'Gómez', 666666666, 'david@example.com', 'Calle Secundaria 9', 9),
(10, 'Carolina', NULL, 'Vargas', 'Pérez', 777777777, 'carolina@example.com', 'Avenida Principal 10', 10),
(11, 'Fernando', 'Andrés', 'López', 'Pérez', 888888888, 'fernando@example.com', 'Calle Principal 11', 11),
(12, 'Isabella', NULL, 'Gómez', 'Martínez', 999999999, 'isabella@example.com', 'Avenida Central 12', 12),
(13, 'Alejandro', 'Javier', 'Ramírez', 'Hernández', 777777777, 'alejandro@example.com', 'Calle Secundaria 13', 13),
(14, 'Valentina', NULL, 'Torres', 'González', 666666666, 'valentina@example.com', 'Avenida Principal 14', 14),
(15, 'Andrés', 'Felipe', 'Soto', 'Fernández', 555555555, 'andres@example.com', 'Calle Central 15', 15),
(16, 'Camila', NULL, 'García', 'López', 444444444, 'camila@example.com', 'Calle Secundaria 16', 1),
(17, 'José', 'Luis', 'Hernández', 'Sánchez', 333333333, 'jose@example.com', 'Avenida Principal 17', 12),
(18, 'Laura', NULL, 'Pérez', 'Gómez', 222222222, 'laura@example.com', 'Calle Central 18', 3),
(19, 'Diego', 'Andrés', 'González', 'Ramírez', 111111111, 'diego@example.com', 'Calle Secundaria 19', 4),
(20, 'Sara', NULL, 'Martínez', 'López', 0, 'sara@example.com', 'Avenida Principal 20', 5),
(21, 'Gabriel', 'Antonio', 'Sánchez', 'Gómez', 111111111, 'gabriel@example.com', 'Calle Principal 21', 6),
(22, 'Valeria', NULL, 'Ramírez', 'Fernández', 222222222, 'valeria@example.com', 'Avenida Central 22', 7),
(23, 'Mateo', 'Andrés', 'López', 'Pérez', 333333333, 'mateo@example.com', 'Calle Secundaria 23', 8),
(24, 'Carolina', NULL, 'González', 'Martínez', 444444444, 'carolina@example.com', 'Avenida Principal 24', 9),
(25, 'Sebastián', 'José', 'Fernández', 'García', 555555555, 'sebastian@example.com', 'Calle Central 25', 10),
(26, 'Juliana', NULL, 'Martínez', 'Soto', 666666666, 'juliana@example.com', 'Calle Secundaria 26', 11),
(27, 'Andrés', 'Felipe', 'Gómez', 'Hernández', 777777777, 'andres@example.com', 'Avenida Principal 27', 12),
(28, 'Catalina', NULL, 'Pérez', 'López', 888888888, 'catalina@example.com', 'Calle Central 28', 13),
(29, 'Javier', 'Andrés', 'Hernández', 'Ramírez', 999999999, 'javier@example.com', 'Calle Secundaria 29', 14),
(30, 'Daniela', NULL, 'López', 'Gómez', 0, 'daniela@example.com', 'Avenida Principal 30', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `ID_VENTA` int(11) NOT NULL,
  `FECHA_VEN` date DEFAULT NULL,
  `CANTIDAD_VEN` int(11) DEFAULT NULL,
  `ENVIO_VEN` varchar(45) DEFAULT NULL,
  `VALOR_UNITARIO` int(11) DEFAULT NULL,
  `DESCUENTO` int(11) DEFAULT NULL,
  `IVA` int(11) DEFAULT NULL,
  `SUBTOTAL` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`ID_VENTA`, `FECHA_VEN`, `CANTIDAD_VEN`, `ENVIO_VEN`, `VALOR_UNITARIO`, `DESCUENTO`, `IVA`, `SUBTOTAL`, `TOTAL`, `ID_PRODUCTO`, `ID_CLIENTE`) VALUES
(1, '2023-06-16', 500, '', 2000, 900, 1000, 10000, 50000, 10, 1),
(2, '2023-05-10', 1000, '', 4000, 1800, 1500, 10000, 60000, 20, 1),
(3, '2023-06-15', 1500, '', 6000, 2700, 2000, 10000, 70000, 30, 1),
(4, '2023-06-11', 2000, '', 8000, 3600, 2500, 10000, 80000, 40, 2),
(5, '0000-00-00', 2500, '', 10000, 4500, 3000, 10000, 90000, 50, 3),
(6, '0000-00-00', 3000, '', 12000, 5400, 3500, 10000, 100000, 60, 4),
(7, '0000-00-00', 3500, '', 14000, 6300, 4000, 10000, 110000, 70, 5),
(8, '0000-00-00', 4000, '', 16000, 7200, 4500, 10000, 120000, 80, 6),
(9, '0000-00-00', 4500, '', 18000, 8100, 5000, 10000, 130000, 90, 1),
(10, '0000-00-00', 5000, '', 20000, 9000, 5500, 10000, 140000, 100, 2),
(11, '0000-00-00', 5500, '', 22000, 9900, 6000, 10000, 150000, 110, 4),
(12, '0000-00-00', 6000, '', 24000, 10800, 6500, 10000, 160000, 120, 10),
(13, '0000-00-00', 6500, '', 26000, 11700, 7000, 10000, 170000, 130, 20),
(14, '0000-00-00', 7000, '', 28000, 12600, 7500, 10000, 180000, 140, 40),
(15, '0000-00-00', 7500, '', 30000, 13500, 8000, 10000, 190000, 150, 50),
(16, '0000-00-00', 8000, '', 32000, 14400, 8500, 10000, 200000, 160, 10),
(17, '0000-00-00', 8500, '', 34000, 15300, 9000, 10000, 210000, 170, 2),
(18, '0000-00-00', 9000, '', 36000, 16200, 9500, 10000, 220000, 180, 25),
(19, '0000-00-00', 9500, '', 38000, 17100, 10000, 10000, 230000, 190, 10),
(20, '0000-00-00', 10000, '', 40000, 18000, 10500, 10000, 240000, 200, 20),
(21, '0000-00-00', 10500, '', 42000, 18900, 11000, 10000, 250000, 210, 30),
(22, '0000-00-00', 11000, '', 44000, 19800, 11500, 10000, 260000, 220, 40),
(23, '0000-00-00', 11500, '', 46000, 20700, 12000, 10000, 270000, 230, 50),
(24, '0000-00-00', 12000, '', 48000, 21600, 12500, 10000, 280000, 240, 12),
(25, '0000-00-00', 12500, '', 50000, 22500, 13000, 10000, 290000, 250, 13),
(26, '0000-00-00', 13000, '', 52000, 23400, 13500, 10000, 300000, NULL, NULL),
(27, '0000-00-00', 13500, '', 54000, 24300, 14000, 10000, 310000, NULL, NULL),
(28, '0000-00-00', 14000, '', 56000, 25200, 14500, 10000, 320000, NULL, NULL),
(29, '0000-00-00', 14500, '', 58000, 26100, 15000, 10000, 330000, NULL, NULL),
(30, '0000-00-00', 15000, '', 60000, 27000, 15500, 10000, 340000, NULL, NULL),
(500, '2023-06-01', 10, 'Envío rápido', 100, 10, 16, 1000, 1006, 1, 1);

--
-- Disparadores `venta`
--
DELIMITER $$
CREATE TRIGGER `actualizarStock` AFTER INSERT ON `venta` FOR EACH ROW BEGIN
  DECLARE stockActual int;
  DECLARE cantidadVenta int;
  DECLARE nuevoStock int;

  SELECT CANTIDAD_IN INTO stockActual FROM inventario WHERE ID_INVENTARIO = NEW.ID_PRODUCTO;
  SELECT CANTIDAD_VEN INTO cantidadVenta FROM venta WHERE ID_VENTA = NEW.ID_VENTA;

  SET nuevoStock = stockActual - cantidadVenta;

  UPDATE inventario SET CANTIDAD_IN = nuevoStock WHERE ID_INVENTARIO = NEW.ID_PRODUCTO;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcularTotal` BEFORE INSERT ON `venta` FOR EACH ROW BEGIN
  DECLARE subtotal INT;
  DECLARE total INT;

  SET subtotal = NEW.CANTIDAD_VEN * NEW.VALOR_UNITARIO;
  SET total = subtotal - NEW.DESCUENTO + NEW.IVA;

  SET NEW.SUBTOTAL = subtotal;
  SET NEW.TOTAL = total;
END
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD PRIMARY KEY (`COD_ACTIVIDAD`),
  ADD KEY `FK_COD_TE_idx` (`COD_TE`);

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`COD_CATEGORIA_P`);

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`COD_CIUDAD`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_CLIENTE`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`ID_DOMICILIO`),
  ADD KEY `COD_ESTADO_D_idx` (`COD_ESTADO_D`),
  ADD KEY `ID_VENTA_idx` (`ID_VENTA`),
  ADD KEY `ID_CLIENTE_idx` (`ID_CLIENTE`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`ID_EMPLEADO`);

--
-- Indices de la tabla `empresa_transportadora`
--
ALTER TABLE `empresa_transportadora`
  ADD PRIMARY KEY (`NIT_EMPRESA`),
  ADD KEY `ID_DOMICILIO_idx` (`ID_DOMICILIO`);

--
-- Indices de la tabla `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`COD_ENTRADA`);

--
-- Indices de la tabla `estado_domicilio`
--
ALTER TABLE `estado_domicilio`
  ADD PRIMARY KEY (`COD_ESTADO_D`);

--
-- Indices de la tabla `estado_evento`
--
ALTER TABLE `estado_evento`
  ADD PRIMARY KEY (`COD_ESTADO_E`);

--
-- Indices de la tabla `estado_producto`
--
ALTER TABLE `estado_producto`
  ADD PRIMARY KEY (`COD_ESTADO_P`);

--
-- Indices de la tabla `estado_proveedor`
--
ALTER TABLE `estado_proveedor`
  ADD PRIMARY KEY (`COD_ESTADO`);

--
-- Indices de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  ADD PRIMARY KEY (`COD_ESTADO_S`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`COD_EVENTO`),
  ADD KEY `COD_ESTADO_E_idx` (`COD_ESTADO_E`);

--
-- Indices de la tabla `fecha_nacimiento`
--
ALTER TABLE `fecha_nacimiento`
  ADD PRIMARY KEY (`COD_FECHA_N`),
  ADD KEY `ID_USUARIO_idx` (`ID_USUARIO`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`COD_GENERO`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD KEY `FK_COD_ENTRADA` (`COD_ENTRADA`),
  ADD KEY `FK_ID_EMPLEADO` (`ID_EMPLEADO`),
  ADD KEY `FK_COD_SALIDA` (`COD_SALIDA`),
  ADD KEY `FK_ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `orden_eventos`
--
ALTER TABLE `orden_eventos`
  ADD PRIMARY KEY (`COD_ORDEN`),
  ADD KEY `ID_VENTA_idx` (`ID_VENTA`),
  ADD KEY `COD_EVENTO_idx` (`COD_EVENTO`),
  ADD KEY `ID_PRODUCTO_idx` (`ID_PRODUCTO`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `COD_ESTADO_P_idx` (`COD_ESTADO_P`),
  ADD KEY `COD_CATEGORIA_P_idx` (`COD_ CATEGORIA_P`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_PROVEEDOR`),
  ADD KEY `ID_SOLICITUD_P_idx` (`ID_SOLICITUD_P`),
  ADD KEY `COD_ESTADO_PROVE_idx` (`COD_ESTADO_PROVE`),
  ADD KEY `COD_CIUDAD_idx` (`COD_CIUDAD`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`COD_SALIDA`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `solicitud_producto`
--
ALTER TABLE `solicitud_producto`
  ADD PRIMARY KEY (`ID_SOLICITUD_P`),
  ADD KEY `ID_EMPLEADO_idx` (`ID_EMPLEADO`),
  ADD KEY `COD_ESTADO_S_idx` (`COD_ESTADO_S`);

--
-- Indices de la tabla `tiempo_trabajo`
--
ALTER TABLE `tiempo_trabajo`
  ADD PRIMARY KEY (`COD_TDT`);

--
-- Indices de la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD PRIMARY KEY (`COD_TIPO_C`),
  ADD KEY `ID_CLIENTE_idx` (`ID_CLIENTE`);

--
-- Indices de la tabla `tipo_empleado`
--
ALTER TABLE `tipo_empleado`
  ADD PRIMARY KEY (`COD_TE`);

--
-- Indices de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  ADD PRIMARY KEY (`ID_TIPO_IDENTI`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `ID_EMPLEADO` (`ID_EMPLEADO`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD KEY `ID_CLIENTE_idx` (`ID_CLIENTE`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tipo_identificacion`
--
ALTER TABLE `tipo_identificacion`
  MODIFY `ID_TIPO_IDENTI` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3333334;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actividades`
--
ALTER TABLE `actividades`
  ADD CONSTRAINT `FK_COD_TE` FOREIGN KEY (`COD_TE`) REFERENCES `tipo_empleado` (`COD_TE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FK_COD_ESTADO_D_domicilio` FOREIGN KEY (`COD_ESTADO_D`) REFERENCES `estado_domicilio` (`COD_ESTADO_D`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ID_CLIENTE_domicilio` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_ID_VENTA_domicilio` FOREIGN KEY (`ID_VENTA`) REFERENCES `venta` (`ID_VENTA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa_transportadora`
--
ALTER TABLE `empresa_transportadora`
  ADD CONSTRAINT `ID_DOMICILIO` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilio` (`ID_DOMICILIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `COD_ESTADO_E` FOREIGN KEY (`COD_ESTADO_E`) REFERENCES `estado_evento` (`COD_ESTADO_E`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fecha_nacimiento`
--
ALTER TABLE `fecha_nacimiento`
  ADD CONSTRAINT `ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `FK_COD_ENTRADA` FOREIGN KEY (`COD_ENTRADA`) REFERENCES `entrada` (`COD_ENTRADA`),
  ADD CONSTRAINT `FK_COD_SALIDA` FOREIGN KEY (`COD_SALIDA`) REFERENCES `salida` (`COD_SALIDA`),
  ADD CONSTRAINT `FK_ID_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`),
  ADD CONSTRAINT `FK_ID_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `orden_eventos`
--
ALTER TABLE `orden_eventos`
  ADD CONSTRAINT `COD_EVENTO` FOREIGN KEY (`COD_EVENTO`) REFERENCES `eventos` (`COD_EVENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_PRODUCTO` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_VENTA` FOREIGN KEY (`ID_VENTA`) REFERENCES `venta` (`ID_VENTA`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `COD_CATEGORIA_P` FOREIGN KEY (`COD_ CATEGORIA_P`) REFERENCES `categoria_producto` (`COD_CATEGORIA_P`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `COD_ESTADO_P` FOREIGN KEY (`COD_ESTADO_P`) REFERENCES `estado_producto` (`COD_ESTADO_P`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `COD_CIUDAD` FOREIGN KEY (`COD_CIUDAD`) REFERENCES `ciudad` (`COD_CIUDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `COD_ESTADO_PROVE` FOREIGN KEY (`COD_ESTADO_PROVE`) REFERENCES `estado_proveedor` (`COD_ESTADO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_SOLICITUD_P` FOREIGN KEY (`ID_SOLICITUD_P`) REFERENCES `solicitud_producto` (`ID_SOLICITUD_P`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `solicitud_producto`
--
ALTER TABLE `solicitud_producto`
  ADD CONSTRAINT `COD_ESTADO_S` FOREIGN KEY (`COD_ESTADO_S`) REFERENCES `estado_solicitud` (`COD_ESTADO_S`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ID_EMPLEADO` FOREIGN KEY (`ID_EMPLEADO`) REFERENCES `empleado` (`ID_EMPLEADO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tipo_cliente`
--
ALTER TABLE `tipo_cliente`
  ADD CONSTRAINT `FK_ID_CLIENTE_tipo_cliente` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `ID_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
