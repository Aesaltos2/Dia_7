-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2024 a las 04:34:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adriandatabase`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `direccion`, `correo_electronico`, `dni`, `edad`, `fecha_creacion`, `telefono`) VALUES
(41, 'Juan', 'Pérez', 'Calle 123', 'juan@example.com', '12345678A', 30, '2024-06-07', '123456789'),
(42, 'María', 'Gómez', 'Avenida 456', 'maria@example.com', '87654321B', 25, '2024-06-07', '987654321'),
(43, 'Carlos', 'López', 'Plaza Principal', 'carlos@example.com', '45678901C', 35, '2024-06-07', '987654321'),
(44, 'Ana', 'Martínez', 'Paseo 789', 'ana@example.com', '09876543D', 28, '2024-06-07', '123456789'),
(45, 'Pedro', 'Sánchez', 'Callejón 456', 'pedro@example.com', '34567890E', 32, '2024-06-07', '123456789'),
(46, 'Laura', 'Rodríguez', 'Camino 123', 'laura@example.com', '56789012F', 27, '2024-06-07', '987654321'),
(47, 'David', 'Fernández', 'Ronda 789', 'david@example.com', '21098765G', 29, '2024-06-07', '123456789'),
(48, 'Sofía', 'López', 'Paseo 456', 'sofia@example.com', '54321987H', 31, '2024-06-07', '987654321'),
(49, 'Elena', 'González', 'Calle 789', 'elena@example.com', '10987654I', 33, '2024-06-07', '123456789'),
(50, 'Manuel', 'Díaz', 'Avenida 123', 'manuel@example.com', '32109876J', 26, '2024-06-07', '987654321'),
(51, 'Carmen', 'Pérez', 'Plaza 456', 'carmen@example.com', '54321098K', 34, '2024-06-07', '123456789'),
(52, 'Javier', 'Gómez', 'Callejón 789', 'javier@example.com', '76543210L', 29, '2024-06-07', '987654321'),
(53, 'Ana', 'Sánchez', 'Avenida 123', 'ana.s@example.com', '98765432M', 30, '2024-06-07', '123456789'),
(54, 'Daniel', 'Martín', 'Camino 456', 'daniel@example.com', '87654321N', 28, '2024-06-07', '987654321'),
(55, 'María', 'López', 'Ronda 789', 'maria.l@example.com', '76543210O', 35, '2024-06-07', '123456789'),
(56, 'Lucía', 'García', 'Plaza 123', 'lucia@example.com', '65432109P', 31, '2024-06-07', '987654321'),
(57, 'José', 'Martínez', 'Paseo 456', 'jose@example.com', '54321098Q', 33, '2024-06-07', '123456789'),
(58, 'Ana', 'Rodríguez', 'Avenida 789', 'ana.r@example.com', '43210987R', 27, '2024-06-07', '987654321'),
(59, 'Carlos', 'González', 'Callejón 123', 'carlos.g@example.com', '32109876S', 32, '2024-06-07', '123456789'),
(60, 'Marta', 'Sánchez', 'Camino 456', 'marta@example.com', '21098765T', 29, '2024-06-07', '987654321'),
(61, 'Martina', 'Salazr', 'Camino 420', 'marta@exa.com', '21098842A', 29, '0000-00-00', '987654631');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
