-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2024 a las 02:04:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `anime_peliculas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--
-- Creación: 01-07-2024 a las 22:09:20
-- Última actualización: 01-07-2024 a las 23:34:22
--

CREATE TABLE `calificacion` (
  `id_calificacion` int(11) NOT NULL COMMENT 'identificador de la tabla calificacion de peliculas',
  `rangos etarios` varchar(10) NOT NULL COMMENT 'tipos de calificaciones segun la edad'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `calificacion`:
--

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id_calificacion`, `rangos etarios`) VALUES
(1, '+13 años');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--
-- Creación: 01-07-2024 a las 22:05:38
-- Última actualización: 01-07-2024 a las 23:26:05
--

CREATE TABLE `directores` (
  `id_director` int(200) NOT NULL COMMENT 'identificador de la tabla directores',
  `nombre` varchar(30) NOT NULL DEFAULT 'NOT NULL' COMMENT 'nombre del director',
  `apellido` varchar(30) NOT NULL DEFAULT 'NOT NULL' COMMENT 'apellido del director',
  `edad` int(100) NOT NULL COMMENT 'edad del director',
  `nacionalidad` varchar(50) NOT NULL COMMENT 'nacionalidad del director'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `directores`:
--

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`id_director`, `nombre`, `apellido`, `edad`, `nacionalidad`) VALUES
(1, 'Haruo', 'Sotozaki', 60, 'Japones'),
(2, 'Haruo', 'Sotozaki', 60, 'Japones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--
-- Creación: 01-07-2024 a las 22:27:48
-- Última actualización: 01-07-2024 a las 23:31:16
--

CREATE TABLE `generos` (
  `id_generos` int(11) NOT NULL COMMENT 'identificador de la tabla generos',
  `tipos` varchar(50) NOT NULL DEFAULT 'NOT NULL' COMMENT 'tipos de generos de peliculas '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `generos`:
--

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id_generos`, `tipos`) VALUES
(1, 'Ciencia ficcion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--
-- Creación: 01-07-2024 a las 22:29:19
--

CREATE TABLE `peliculas` (
  `id_pelicula` int(255) NOT NULL,
  `titulo` varchar(200) DEFAULT 'NOT NULL',
  `id_generos` int(11) NOT NULL,
  `id_director` int(11) NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `trailer url` varchar(50) NOT NULL,
  `id_calificacion` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `anio` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONES PARA LA TABLA `peliculas`:
--   `id_director`
--       `directores` -> `id_director`
--   `id_calificacion`
--       `calificacion` -> `id_calificacion`
--   `id_generos`
--       `generos` -> `id_generos`
--

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id_pelicula`, `titulo`, `id_generos`, `id_director`, `duracion`, `trailer url`, `id_calificacion`, `descripcion`, `anio`) VALUES
(1, 'Demon Slayer-Guardianes de la noche:Rumbo a la ald', 1, 1, '110min.', '', 1, 'Despues de que su familia es brutalmente asesinada, un chico llamado Tanjiro....', 2023),
(2, 'Demon Slayer-Kimetsu no Yaiba:Rumbo al entrenamien', 1, 1, '104min', '', 1, 'La conclusion de la  feroz batalla entre Tanjiro y la ...', 2024);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id_calificacion`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`id_director`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id_generos`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id_pelicula`),
  ADD KEY `id_generos` (`id_generos`),
  ADD KEY `id_director` (`id_director`),
  ADD KEY `id_calificacion` (`id_calificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla calificacion de peliculas', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `id_director` int(200) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla directores', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id_generos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la tabla generos', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id_pelicula` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`id_director`) REFERENCES `directores` (`id_director`),
  ADD CONSTRAINT `peliculas_ibfk_2` FOREIGN KEY (`id_calificacion`) REFERENCES `calificacion` (`id_calificacion`),
  ADD CONSTRAINT `peliculas_ibfk_3` FOREIGN KEY (`id_generos`) REFERENCES `generos` (`id_generos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
