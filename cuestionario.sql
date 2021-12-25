-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-12-2021 a las 22:23:10
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
-- Base de datos: `cuestionario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `Id` int(11) NOT NULL,
  `categoria` varchar(110) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`Id`, `categoria`) VALUES
(101, 'deportes'),
(102, 'matematicas'),
(103, 'ciencias'),
(104, 'programacion'),
(105, 'ingles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `pregunta` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RTA1` varchar(100) NOT NULL,
  `RTA2` varchar(100) NOT NULL,
  `RTA3` varchar(100) NOT NULL,
  `RTACORRECTA` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nivel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `pregunta`, `RTA1`, `RTA2`, `RTA3`, `RTACORRECTA`, `id_categoria`, `nivel`) VALUES
(1, 'framework de java', 'angular', 'react', 'laravel', 'springboot', 104, 1),
(2, 'cual de estos es un IDE?', 'visual studio code', 'notepad', 'sublime text', 'pycharm', 104, 2),
(3, 'codigo para eliminar una tabla en una base de datos relacional', 'truncate table', 'set table', 'delete table', 'drop table', 104, 3),
(4, 'lenguaje de programacion creado en 1975', 'c#', 'c++', 'phyton', 'java', 104, 4),
(5, 'cuales una base de datos no relacional', 'postgre', 'sqlserver', 'Mysql', 'mongoDB', 104, 5),
(6, 'es un equipo de futbol', 'lakers', 'new york nicks', 'stanford', 'leicester city', 101, 1),
(7, 'hombre mas rapido de  jamaica', 'maikel phels', 'mario carrick', 'juan garcia', 'usaint bolt', 101, 2),
(8, 'bicicrocista colombiana exitosa', 'catherine ibarguen', 'marta ramirez', 'maria pajon', 'mariana pajon', 101, 3),
(9, 'donde se hicieron los juegos olimpicos de 2016', 'Atenas', 'Buenos aires', 'tokio', 'Rio de janeiro', 101, 4),
(10, 'en que año se celebraron los primeros juegos olimpicos', '1891', '1923', '1894', '1896', 101, 5),
(11, 'cuanto es la derivada de 2x^2', '2x', '16x^2', '8x', '4x', 102, 1),
(12, 'cual es la derivada de e^x', '3x', '3x^2-2x', '16x-2x', 'e^x', 102, 2),
(13, 'cual es el valor aproximado de π', '3,161726712', '2,14157116', '3,1010129', '3,14159265', 102, 3),
(14, 'famoso matematico,denominado el principe de las matematicas', 'Arquimedes', 'Leonhard Euler', 'sthepen hawking', 'Carl Friedrich Gauss', 102, 4),
(15, 'crador del famoso libro algebra de baldor', 'karl marx', 'rogelio baldor', 'arquimedes', 'Aurelio Baldor', 102, 5),
(16, 'I __________ in a bank. ', 'works', 'is working', 'working', 'work', 105, 1),
(17, 'Barbara __________ everyday.', 'run', 'is running', 'unning', 'runs', 105, 2),
(18, 'He __________ in Canada. ', 'dont live', 'not live', 'not lives', 'doesnt live', 105, 3),
(19, 'We __________ English. ', 'studies', 'is studying', 'studys', 'are studying', 105, 4),
(20, 'He __________ next week. ', 'not is working', 'is working not', ' not works', 'isnt working', 105, 5),
(21, 'rama de la ciencia que estudia las propiedades del espacio,el tiempo,la materia y la energia', 'quimica', 'biologia', 'matematicas', 'fisica', 103, 1),
(22, 'a que velocidad se trasmite el sonido en el aire aproximadamente', '1200 m/h', '358 m/m', '1200 m/s', '340 m/s', 103, 2),
(23, 'a que familia de resptiles pertenece la tortuga', 'saurios', 'ofidios', 'resfios', 'quelonios', 103, 3),
(24, 'rama de la ciencia que se ocupa del estudio de la tierra y de los cuerpos celestes y rocosos y la materia que los compone', 'geologia', 'astrologia', 'fisica', 'Astronomia', 103, 4),
(25, 'organo mas grande del cuerpo humano', 'cerebro', 'pancreas', 'tiroides', 'piel', 103, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `puntaje` varchar(100) DEFAULT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `puntaje`, `categoria`) VALUES
(1, 'juan', '100', 'matematicas'),
(2, 'sdsd', '0', 'programacion'),
(3, 'lina ortiz', '1500', 'programacion');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
