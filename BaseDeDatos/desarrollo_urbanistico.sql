-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-02-2025 a las 21:43:40
-- Versión del servidor: 8.3.0
-- Versión de PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desarrollo_urbanistico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `id_favorito` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_property` int NOT NULL,
  `fecha_guardado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_favorito`),
  KEY `id_user` (`id_user`),
  KEY `id_property` (`id_property`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id_favorito`, `id_user`, `id_property`, `fecha_guardado`) VALUES
(3, 16, 40, '2025-02-09 21:32:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmobiliarias`
--

DROP TABLE IF EXISTS `inmobiliarias`;
CREATE TABLE IF NOT EXISTS `inmobiliarias` (
  `id_agency` int NOT NULL AUTO_INCREMENT,
  `name_agency` varchar(20) NOT NULL,
  `mail_agency` varchar(50) NOT NULL,
  `phone_agency` varchar(15) NOT NULL,
  `website` varchar(50) NOT NULL,
  PRIMARY KEY (`id_agency`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `inmobiliarias`
--

INSERT INTO `inmobiliarias` (`id_agency`, `name_agency`, `mail_agency`, `phone_agency`, `website`) VALUES
(2, 'REMAX', 'remax@inmobiliaria.com', '+54968754656', 'https://www.remax.com.ar/'),
(3, 'Ferrara Propiedades', 'ferrara@propiedades.com', '+5492944518657', 'https://www.ferrarapropiedades.com/'),
(4, 'Urzainqui Cejas Nego', 'info@urzainquicejas.com.ar', '+5492944362142', 'https://urzainquicejas.com.ar/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes_contacto`
--

DROP TABLE IF EXISTS `mensajes_contacto`;
CREATE TABLE IF NOT EXISTS `mensajes_contacto` (
  `name` text NOT NULL,
  `phone` int NOT NULL,
  `email` text NOT NULL,
  `subject` text NOT NULL,
  `message` int NOT NULL,
  `id_message` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_message`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `mensajes_contacto`
--

INSERT INTO `mensajes_contacto` (`name`, `phone`, `email`, `subject`, `message`, `id_message`) VALUES
('Cata', 2147483647, 'cata@gmail.com', 'Consultar', 0, 1),
('Cata', 2147483647, 'cata@gmail.com', 'Consultar', 0, 2),
('Cata', 2147483647, 'cata@gmail.com', 'Visitar', 0, 3),
('Cata', 2147483647, 'cata@gmail.com', 'Visitar', 0, 4),
('CataTela', 2147483647, 'cata@gmail.com', 'Visitar', 0, 5),
('CataTela', 2147483647, 'cata@gmail.com', 'Visitar', 0, 6),
('CataTela', 2147483647, 'cata@gmail.com', 'Visitar', 0, 7),
('CataTela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Visitar', 0, 8),
('CataTela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Visitar', 0, 9),
('CataTela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Consultar', 0, 10),
('CataTela', 2147483647, 'cata@gmail.com', 'Visitar', 0, 11),
('Catalina Tela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Consultar', 0, 12),
('Catalina Tela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Consultar', 0, 13),
('Catalina Tela', 2147483647, 'ailenrodriguez2812@gmail.com', 'Consultar', 0, 14),
('Cata', 2147483647, 'ailenrodriguez2812@gmail.com', 'Visitar', 0, 15),
('Cata', 2147483647, 'ailenrodriguez2812@gmail.com', 'Visitar', 0, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operacion_inmobiliaria`
--

DROP TABLE IF EXISTS `operacion_inmobiliaria`;
CREATE TABLE IF NOT EXISTS `operacion_inmobiliaria` (
  `id_operation` int NOT NULL AUTO_INCREMENT,
  `operation_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id_operation`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `operacion_inmobiliaria`
--

INSERT INTO `operacion_inmobiliaria` (`id_operation`, `operation_name`) VALUES
(13, 'Alquiler'),
(15, 'Venta'),
(16, 'Alquiler temporal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
CREATE TABLE IF NOT EXISTS `propiedades` (
  `id_property` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `observations` varchar(200) NOT NULL,
  `ubication` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` int NOT NULL,
  `picture` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_type` int NOT NULL,
  `id_operation` int NOT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`id_property`),
  KEY `id_type` (`id_type`),
  KEY `id_operation` (`id_operation`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`id_property`, `title`, `description`, `observations`, `ubication`, `value`, `picture`, `id_type`, `id_operation`, `latitud`, `longitud`) VALUES
(29, 'Tiny House', 'Práctica y moderna tiny house de diseño tipo container, ideal para quienes buscan comodidad y funcionalidad. Incluye un dormitorio, baño completo, cocina integrada y living-comedor.', 'La construcción permite aprovechar el resto del lote para ampliar la vivienda, construir otra unidad o desarrollar un proyecto personalizado. Ideal para inversión o primeras viviendas.', 'Los Abedules', 75000, '[\"assets\\/img\\/propiedad\\/678712c872e4e_tiny1.jpg\",\"assets\\/img\\/propiedad\\/678712c873c55_tiny2.jpg\",\"assets\\/img\\/propiedad\\/678712c873fa7_tiny3.jpg\",\"assets\\/img\\/propiedad\\/678712c87429c_tiny4.jpg\",\"assets\\/img\\/propiedad\\/678712c8745bf_tiny5.jpg\",\"assets\\/img\\/propiedad\\/678712c8748a0_tiny6.jpg\",\"assets\\/img\\/propiedad\\/678712c874bec_tiny7.jpg\",\"assets\\/img\\/propiedad\\/678712c877a14_tiny8.jpg\",\"assets\\/img\\/propiedad\\/678712c877f6d_tiny9.jpg\",\"assets\\/img\\/propiedad\\/678712c87835f_tiny10.jpg\",\"assets\\/img\\/propiedad\\/678712c87864a_tiny11.jpg\",\"assets\\/img\\/propiedad\\/678712c87896c_tiny12.jpg\",\"assets\\/img\\/propiedad\\/678712c878c7b_tiny13.jpg\",\"assets\\/img\\/propiedad\\/678712c87902c_tiny14.jpg\",\"assets\\/img\\/propiedad\\/678712c87932f_tiny15.jpg\"]', 16, 15, -41.14575400, -71.25796800),
(30, 'Tiny house tipo container', 'Práctica y moderna tiny house de diseño tipo container, ideal para quienes buscan comodidad y funcionalidad. Incluye un dormitorio, baño completo, cocina integrada y living-comedor.', 'La construcción permite aprovechar el resto del lote para ampliar la vivienda, construir otra unidad o desarrollar un proyecto personalizado. Ideal para inversión o primeras viviendas.', 'Los Abedules', 75000, '[\"assets\\/img\\/propiedad\\/678712d534b19_tiny1.jpg\",\"assets\\/img\\/propiedad\\/678712d535136_tiny2.jpg\",\"assets\\/img\\/propiedad\\/678712d5354fc_tiny3.jpg\",\"assets\\/img\\/propiedad\\/678712d53586a_tiny4.jpg\",\"assets\\/img\\/propiedad\\/678712d535c12_tiny5.jpg\",\"assets\\/img\\/propiedad\\/678712d536032_tiny6.jpg\",\"assets\\/img\\/propiedad\\/678712d536441_tiny7.jpg\",\"assets\\/img\\/propiedad\\/678712d5367cc_tiny8.jpg\",\"assets\\/img\\/propiedad\\/678712d536b83_tiny9.jpg\",\"assets\\/img\\/propiedad\\/678712d536fb0_tiny10.jpg\",\"assets\\/img\\/propiedad\\/678712d537372_tiny11.jpg\",\"assets\\/img\\/propiedad\\/678712d5376ad_tiny12.jpg\",\"assets\\/img\\/propiedad\\/678712d537a05_tiny13.jpg\",\"assets\\/img\\/propiedad\\/678712d537d30_tiny14.jpg\",\"assets\\/img\\/propiedad\\/678712d538080_tiny15.jpg\"]', 16, 15, -41.14575400, -71.25796800),
(31, 'Tiny house tipo container', 'Práctica y moderna tiny house de diseño tipo container, ideal para quienes buscan comodidad y funcionalidad. Incluye un dormitorio, baño completo, cocina integrada y living-comedor.', 'Cuenta con todos los servicios', 'Los Abedules', 400, '[\"assets\\/img\\/propiedad\\/678712dbb6388_tiny1.jpg\",\"assets\\/img\\/propiedad\\/678712dbb693e_tiny2.jpg\",\"assets\\/img\\/propiedad\\/678712dbb6cf5_tiny3.jpg\",\"assets\\/img\\/propiedad\\/678712dbb6f74_tiny4.jpg\",\"assets\\/img\\/propiedad\\/678712dbb7226_tiny5.jpg\",\"assets\\/img\\/propiedad\\/678712dbb74b6_tiny6.jpg\",\"assets\\/img\\/propiedad\\/678712dbb78a9_tiny7.jpg\",\"assets\\/img\\/propiedad\\/678712dbb7b4b_tiny8.jpg\",\"assets\\/img\\/propiedad\\/678712dbb7e03_tiny9.jpg\",\"assets\\/img\\/propiedad\\/678712dbb8044_tiny10.jpg\",\"assets\\/img\\/propiedad\\/678712dbb82d1_tiny11.jpg\",\"assets\\/img\\/propiedad\\/678712dbb856b_tiny12.jpg\",\"assets\\/img\\/propiedad\\/678712dbbcb51_tiny13.jpg\",\"assets\\/img\\/propiedad\\/678712dbbcf55_tiny14.jpg\",\"assets\\/img\\/propiedad\\/678712dbbd32f_tiny15.jpg\"]', 16, 13, -41.14575400, -71.25796800),
(32, 'Tiny house tipo container', 'Práctica y moderna tiny house de diseño tipo container, ideal para quienes buscan comodidad y funcionalidad. Incluye un dormitorio, baño completo, cocina integrada y living-comedor.', 'La construcción permite aprovechar el resto del lote para ampliar la vivienda, construir otra unidad o desarrollar un proyecto personalizado. Ideal para inversión o primeras viviendas.', 'Los Abedules', 70000, '[\"assets\\/img\\/propiedad\\/678712e225892_tiny1.jpg\",\"assets\\/img\\/propiedad\\/678712e225bef_tiny2.jpg\",\"assets\\/img\\/propiedad\\/678712e225eb2_tiny3.jpg\",\"assets\\/img\\/propiedad\\/678712e2260da_tiny4.jpg\",\"assets\\/img\\/propiedad\\/678712e2263fa_tiny5.jpg\",\"assets\\/img\\/propiedad\\/678712e226871_tiny6.jpg\",\"assets\\/img\\/propiedad\\/678712e226f17_tiny7.jpg\",\"assets\\/img\\/propiedad\\/678712e227318_tiny8.jpg\",\"assets\\/img\\/propiedad\\/678712e22762f_tiny9.jpg\",\"assets\\/img\\/propiedad\\/678712e227944_tiny10.jpg\",\"assets\\/img\\/propiedad\\/678712e227b8d_tiny11.jpg\",\"assets\\/img\\/propiedad\\/678712e227dba_tiny12.jpg\",\"assets\\/img\\/propiedad\\/678712e228066_tiny13.jpg\",\"assets\\/img\\/propiedad\\/678712e2282a5_tiny14.jpg\",\"assets\\/img\\/propiedad\\/678712e228500_tiny15.jpg\"]', 16, 15, -41.14575400, -71.25796800),
(33, 'Tiny house tipo container', 'Práctica y moderna tiny house de diseño tipo container, ideal para quienes buscan comodidad y funcionalidad. Incluye un dormitorio, baño completo, cocina integrada y living-comedor.', 'La construcción permite aprovechar el resto del lote para ampliar la vivienda, construir otra unidad o desarrollar un proyecto personalizado. Ideal para inversión o primeras viviendas.', 'Los Abedules', 60000, '[\"assets\\/img\\/propiedad\\/678712eb7ee47_tiny1.jpg\",\"assets\\/img\\/propiedad\\/678712eb7f7f1_tiny2.jpg\",\"assets\\/img\\/propiedad\\/678712eb7fd26_tiny3.jpg\",\"assets\\/img\\/propiedad\\/678712eb8015a_tiny4.jpg\",\"assets\\/img\\/propiedad\\/678712eb80470_tiny5.jpg\",\"assets\\/img\\/propiedad\\/678712eb8176e_tiny6.jpg\",\"assets\\/img\\/propiedad\\/678712eb81b4c_tiny7.jpg\",\"assets\\/img\\/propiedad\\/678712eb81f7f_tiny8.jpg\",\"assets\\/img\\/propiedad\\/678712eb823d6_tiny9.jpg\",\"assets\\/img\\/propiedad\\/678712eb826ff_tiny10.jpg\",\"assets\\/img\\/propiedad\\/678712eb829fd_tiny11.jpg\",\"assets\\/img\\/propiedad\\/678712eb82d00_tiny12.jpg\",\"assets\\/img\\/propiedad\\/678712eb831d6_tiny13.jpg\",\"assets\\/img\\/propiedad\\/678712eb83950_tiny14.jpg\",\"assets\\/img\\/propiedad\\/678712eb83e5a_tiny15.jpg\"]', 16, 15, NULL, NULL),
(34, 'Casa de vacaciones con vista a las montañas', 'Casa totalmente equipada para turismo, con capacidad para 6 personas. Cuenta con tres dormitorios, living, cocina-comedor y patio con parrilla. Ubicada cerca de atractivos turísticos.', 'Precio por noche, 3 noches, semana, quincena o mes', 'Los Abedules', 150, '[\"assets\\/img\\/propiedad\\/67871351de1f4_duplex1.jpg\",\"assets\\/img\\/propiedad\\/67871351deff7_duplex2.jpg\",\"assets\\/img\\/propiedad\\/67871351df3e5_duplex3.jpg\",\"assets\\/img\\/propiedad\\/67871351df729_duplex4.jpg\",\"assets\\/img\\/propiedad\\/67871351dfb8b_duplex5.jpg\",\"assets\\/img\\/propiedad\\/67871351e0602_duplex6.jpg\",\"assets\\/img\\/propiedad\\/67871351e0a60_duplex7.jpg\",\"assets\\/img\\/propiedad\\/67871351e0dc9_duplex8.jpg\",\"assets\\/img\\/propiedad\\/67871351e1151_duplex9.jpg\",\"assets\\/img\\/propiedad\\/67871351e14a7_duplex10.jpg\",\"assets\\/img\\/propiedad\\/67871351e18a1_duplex11.jpg\",\"assets\\/img\\/propiedad\\/67871351e207a_duplex12.jpg\",\"assets\\/img\\/propiedad\\/67871351e2620_duplex13.jpg\",\"assets\\/img\\/propiedad\\/67871351e2b71_duplex14.jpg\"]', 16, 16, -41.14575400, -71.25796800),
(35, 'Dúplex moderno en bariloche', 'Elegante dúplex de dos plantas con diseño contemporáneo. En planta baja cuenta con un amplio living-comedor, cocina integrada, baño social y cochera. En planta alta dispone de dos dormitorios luminoso', 'Lote de 7.5 x 30 m entradas independientes', 'Los Abedules', 90000, '[\"assets\\/img\\/propiedad\\/67871356c64e9_duplex1.jpg\",\"assets\\/img\\/propiedad\\/67871356c691b_duplex2.jpg\",\"assets\\/img\\/propiedad\\/67871356c6c92_duplex3.jpg\",\"assets\\/img\\/propiedad\\/67871356c6fa4_duplex4.jpg\",\"assets\\/img\\/propiedad\\/67871356c743c_duplex5.jpg\",\"assets\\/img\\/propiedad\\/67871356c7819_duplex6.jpg\",\"assets\\/img\\/propiedad\\/67871356c7b59_duplex7.jpg\",\"assets\\/img\\/propiedad\\/67871356c7e7f_duplex8.jpg\",\"assets\\/img\\/propiedad\\/67871356c81bf_duplex9.jpg\",\"assets\\/img\\/propiedad\\/67871356c853d_duplex10.jpg\",\"assets\\/img\\/propiedad\\/67871356c88c5_duplex11.jpg\",\"assets\\/img\\/propiedad\\/67871356c942a_duplex12.jpg\",\"assets\\/img\\/propiedad\\/67871356c980b_duplex13.jpg\",\"assets\\/img\\/propiedad\\/67871356c9c23_duplex14.jpg\"]', 19, 15, -41.14575400, -71.25796800),
(36, 'Dúplex moderno en bariloche', 'Elegante dúplex de con diseño contemporáneo. Cuenta con un amplio living-comedor, cocina integrada, baño social y dispone de dos dormitorios luminosos', 'Patio trasero ideal para disfrutar con amigos o familia. Ubicado en una zona tranquila con fácil acceso a servicios y transporte.', 'Los Abedules', 90000, '[\"assets\\/img\\/propiedad\\/6787135b5c8bb_duplex1.jpg\",\"assets\\/img\\/propiedad\\/6787135b5cc40_duplex2.jpg\",\"assets\\/img\\/propiedad\\/6787135b5cee1_duplex3.jpg\",\"assets\\/img\\/propiedad\\/6787135b5d1ca_duplex4.jpg\",\"assets\\/img\\/propiedad\\/6787135b5d4aa_duplex5.jpg\",\"assets\\/img\\/propiedad\\/6787135b5d6fa_duplex6.jpg\",\"assets\\/img\\/propiedad\\/6787135b5d982_duplex7.jpg\",\"assets\\/img\\/propiedad\\/6787135b5dcae_duplex8.jpg\",\"assets\\/img\\/propiedad\\/6787135b5df87_duplex9.jpg\",\"assets\\/img\\/propiedad\\/6787135b5e22f_duplex10.jpg\",\"assets\\/img\\/propiedad\\/6787135b5e4bd_duplex11.jpg\",\"assets\\/img\\/propiedad\\/6787135b5e985_duplex12.jpg\",\"assets\\/img\\/propiedad\\/6787135b5ec08_duplex13.jpg\",\"assets\\/img\\/propiedad\\/6787135b5ef09_duplex14.jpg\"]', 19, 15, -41.14575400, -71.25796800),
(37, 'Dúplex moderno en bariloche', 'Elegante dúplex de dos plantas con diseño contemporáneo. Cuenta con un amplio living-comedor, cocina integrada, baño social y dispone de dos dormitorios luminoso', 'Patio trasero ideal para disfrutar con amigos o familia. Ubicado en una zona tranquila con fácil acceso a servicios y transporte.', 'Los Abedules', 500, '[\"assets\\/img\\/propiedad\\/6787136014522_duplex1.jpg\",\"assets\\/img\\/propiedad\\/6787136014954_duplex2.jpg\",\"assets\\/img\\/propiedad\\/6787136015287_duplex3.jpg\",\"assets\\/img\\/propiedad\\/678713601569b_duplex4.jpg\",\"assets\\/img\\/propiedad\\/6787136015bbd_duplex5.jpg\",\"assets\\/img\\/propiedad\\/6787136015fc1_duplex6.jpg\",\"assets\\/img\\/propiedad\\/67871360162c2_duplex7.jpg\",\"assets\\/img\\/propiedad\\/67871360165b1_duplex8.jpg\",\"assets\\/img\\/propiedad\\/67871360168ea_duplex9.jpg\",\"assets\\/img\\/propiedad\\/678713601cbfd_duplex10.jpg\",\"assets\\/img\\/propiedad\\/678713601d960_duplex11.jpg\",\"assets\\/img\\/propiedad\\/678713601e3e9_duplex12.jpg\",\"assets\\/img\\/propiedad\\/6787136023786_duplex13.jpg\",\"assets\\/img\\/propiedad\\/67871360240d5_duplex14.jpg\"]', 19, 13, -41.14575400, -71.25796800),
(38, 'Moderna casa familiar', 'Amplia casa con jardín privado y cochera cubierta, ideal para familias. Cuenta con tres dormitorios, dos baños completos, cocina equipada y un luminoso living-comedor. Ubicada en un barrio tranquilo y', 'Lote de 10 m x 30 m, con todos los servicios', 'Los Abedules', 140000, '[\"assets\\/img\\/propiedad\\/678713c312a3c_casa1.jpg\",\"assets\\/img\\/propiedad\\/678713c312ed0_casa2.jpg\",\"assets\\/img\\/propiedad\\/678713c3134b7_croquis3.jpg\",\"assets\\/img\\/propiedad\\/678713c3138bb_croquis4.jpg\",\"assets\\/img\\/propiedad\\/678713c313bc1_croquis5.jpg\",\"assets\\/img\\/propiedad\\/678713c313ed3_croquis6.jpg\",\"assets\\/img\\/propiedad\\/678713c3141c5_croquis7.jpg\",\"assets\\/img\\/propiedad\\/678713c3144bf_croquis8.jpg\",\"assets\\/img\\/propiedad\\/678713c3147c8_croquis9.jpg\",\"assets\\/img\\/propiedad\\/678713c314aca_croquis10.jpg\"]', 16, 15, -41.14575400, -71.25796800),
(39, 'Moderna casa familiar', 'Amplia casa con jardín privado y cochera cubierta, ideal para familias. Cuenta con tres dormitorios, dos baños completos, cocina equipada y un luminoso living-comedor. Ubicada en un barrio tranquilo', 'cuenta con todos los servicios', 'Los Abedules', 600, '[\"assets\\/img\\/propiedad\\/678713c762dd9_casa1.jpg\",\"assets\\/img\\/propiedad\\/678713c763591_casa2.jpg\",\"assets\\/img\\/propiedad\\/678713c763acf_croquis3.jpg\",\"assets\\/img\\/propiedad\\/678713c763efa_croquis4.jpg\",\"assets\\/img\\/propiedad\\/678713c764314_croquis5.jpg\",\"assets\\/img\\/propiedad\\/678713c764628_croquis6.jpg\",\"assets\\/img\\/propiedad\\/678713c764930_croquis7.jpg\",\"assets\\/img\\/propiedad\\/678713c764c66_croquis8.jpg\",\"assets\\/img\\/propiedad\\/678713c764f62_croquis9.jpg\",\"assets\\/img\\/propiedad\\/678713c765271_croquis10.jpg\"]', 16, 13, -41.14575400, -71.25796800),
(40, 'Casa de estilo rustico', 'Hermosa casa de estilo rústico con detalles en madera y piedra. Ofrece dos dormitorios, baño completo, cocina-comedor integrada, y un patio con parrilla. Perfecta para quienes buscan tranquilidad.', 'Lote 10m x 30m. Con todos los servicios incluidos', 'Los Abedules', 100000, '[\"assets\\/img\\/propiedad\\/678713f1417f4_frente1.jpg\",\"assets\\/img\\/propiedad\\/678713f141b43_frente2.jpg\",\"assets\\/img\\/propiedad\\/678713f142316_frente3.jpg\",\"assets\\/img\\/propiedad\\/678713f142718_frente4.jpg\",\"assets\\/img\\/propiedad\\/678713f1429cc_frente5.jpg\",\"assets\\/img\\/propiedad\\/678713f142d1a_frente6.jpg\",\"assets\\/img\\/propiedad\\/678713f1430e9_frente7.jpg\",\"assets\\/img\\/propiedad\\/678713f1433e5_frente8.jpg\",\"assets\\/img\\/propiedad\\/678713f143615_frente9.jpg\",\"assets\\/img\\/propiedad\\/678713f143879_frente10.jpg\",\"assets\\/img\\/propiedad\\/678713f143bd3_frente11.jpg\",\"assets\\/img\\/propiedad\\/678713f143e94_frente12.jpg\",\"assets\\/img\\/propiedad\\/678713f144267_frente13.jpg\",\"assets\\/img\\/propiedad\\/678713f14455b_frente14.jpg\",\"assets\\/img\\/propiedad\\/678713f1447fd_frente15.jpg\",\"assets\\/img\\/propiedad\\/678713f144a3d_frente16.jpg\"]', 16, 15, -41.14575400, -71.25796800),
(41, 'Casa de estilo rústica', 'Hermosa casa de estilo rústico con detalles en madera y piedra. Ofrece dos dormitorios, baño completo, cocina-comedor integrada, y un patio con parrilla. Perfecta para quienes buscan tranquilidad y na', 'Cuenta con todos los servicios', 'Los Abedules', 500, '[\"assets\\/img\\/propiedad\\/678713f5e4655_frente1.jpg\",\"assets\\/img\\/propiedad\\/678713f5e4c23_frente2.jpg\",\"assets\\/img\\/propiedad\\/678713f5e50fe_frente3.jpg\",\"assets\\/img\\/propiedad\\/678713f5e54dd_frente4.jpg\",\"assets\\/img\\/propiedad\\/678713f5e580f_frente5.jpg\",\"assets\\/img\\/propiedad\\/678713f5e5b3e_frente6.jpg\",\"assets\\/img\\/propiedad\\/678713f5e5e33_frente7.jpg\",\"assets\\/img\\/propiedad\\/678713f5e612a_frente8.jpg\",\"assets\\/img\\/propiedad\\/678713f5e6442_frente9.jpg\",\"assets\\/img\\/propiedad\\/678713f5e673a_frente10.jpg\",\"assets\\/img\\/propiedad\\/678713f5e6a34_frente11.jpg\",\"assets\\/img\\/propiedad\\/678713f5e6d63_frente12.jpg\",\"assets\\/img\\/propiedad\\/678713f5e70c6_frente13.jpg\",\"assets\\/img\\/propiedad\\/678713f5e7526_frente14.jpg\",\"assets\\/img\\/propiedad\\/678713f5e785a_frente15.jpg\",\"assets\\/img\\/propiedad\\/678713f5e7b8b_frente16.jpg\"]', 16, 13, -41.14575400, -71.25796800),
(42, 'Lote en zona residencial', 'Terreno de 300 m², ubicado en una zona residencial en expansión. Ideal para construir la casa de tus sueños o para inversión a futuro. Con todos los servicios disponibles (agua, luz, gas).', 'Lote de 10m x 30 m, con servicios listo para construir', 'Los Abedules', 50000, '[\"assets\\/img\\/propiedad\\/678714328bc5d_barrio1.jpg\",\"assets\\/img\\/propiedad\\/678714328c0c4_barrio2.jpg\",\"assets\\/img\\/propiedad\\/678714328cee3_barrio3.jpg\",\"assets\\/img\\/propiedad\\/678714328d359_lote1.jpg\",\"assets\\/img\\/propiedad\\/678714328d862_lote2.jpg\",\"assets\\/img\\/propiedad\\/678714328dba0_lote3.jpg\",\"assets\\/img\\/propiedad\\/678714328df8d_lote4.jpg\",\"assets\\/img\\/propiedad\\/678714328e2b4_lote5.jpg\",\"assets\\/img\\/propiedad\\/678714328e655_lote6.jpg\",\"assets\\/img\\/propiedad\\/678714328e97b_lote7.jpg\",\"assets\\/img\\/propiedad\\/678714328ec8d_precios.jpg\"]', 6, 15, -41.14575400, -71.25796800),
(43, 'Lote comercial en avenida comercial', 'Lote de 300 m² en una ubicación estratégica, perfecto para proyectos comerciales. Alto tránsito vehicular y peatonal, ideal para locales o emprendimientos.', 'Lote 10m x 30m, cuenta con todos los servicios, en esquina', 'Los Abedules', 55000, '[\"assets\\/img\\/propiedad\\/67871436ab69c_barrio1.jpg\",\"assets\\/img\\/propiedad\\/67871436ab9c6_barrio2.jpg\",\"assets\\/img\\/propiedad\\/67871436abc92_barrio3.jpg\",\"assets\\/img\\/propiedad\\/67871436abf6c_lote1.jpg\",\"assets\\/img\\/propiedad\\/67871436ac41a_lote2.jpg\",\"assets\\/img\\/propiedad\\/67871436acae8_lote3.jpg\",\"assets\\/img\\/propiedad\\/67871436acf71_lote4.jpg\",\"assets\\/img\\/propiedad\\/67871436ad2c4_lote5.jpg\",\"assets\\/img\\/propiedad\\/67871436ad596_lote6.jpg\",\"assets\\/img\\/propiedad\\/67871436ad871_lote7.jpg\",\"assets\\/img\\/propiedad\\/67871436adb31_precios.jpg\"]', 6, 15, -41.14575400, -71.25796800),
(44, 'Lote en zona residencial', 'Terreno de 300 m², ubicado en una zona residencial en expansión. Ideal para construir la casa de tus sueños o para inversión a futuro. Con todos los servicios disponibles (agua, luz, gas).', 'Lote 10m x 30m. cuenta con todos los servicios, listo para construir', 'Los Abedules', 50000, '[\"assets\\/img\\/propiedad\\/6787143ad8878_barrio1.jpg\",\"assets\\/img\\/propiedad\\/6787143ad8fb3_barrio2.jpg\",\"assets\\/img\\/propiedad\\/6787143ad94bc_barrio3.jpg\",\"assets\\/img\\/propiedad\\/6787143ad9952_lote1.jpg\",\"assets\\/img\\/propiedad\\/6787143ad9d87_lote2.jpg\",\"assets\\/img\\/propiedad\\/6787143ada0a4_lote3.jpg\",\"assets\\/img\\/propiedad\\/6787143ada43e_lote4.jpg\",\"assets\\/img\\/propiedad\\/6787143ada83b_lote5.jpg\",\"assets\\/img\\/propiedad\\/6787143adac05_lote6.jpg\",\"assets\\/img\\/propiedad\\/6787143adaf82_lote7.jpg\",\"assets\\/img\\/propiedad\\/6787143adb34d_precios.jpg\"]', 6, 15, -41.14575400, -71.25796800),
(45, 'Lote en zona residencial', 'Terreno de 300 m², ubicado en una zona residencial en expansión. Ideal para construir la casa de tus sueños o para inversión a futuro. Con todos los servicios disponibles (agua, luz, gas).', 'lote 10x 30m cuenta con todos los servicios, en esquina', 'Los Abedules', 55000, '[\"assets\\/img\\/propiedad\\/6787143edbdba_barrio1.jpg\",\"assets\\/img\\/propiedad\\/6787143edc3e6_barrio2.jpg\",\"assets\\/img\\/propiedad\\/6787143edcc25_barrio3.jpg\",\"assets\\/img\\/propiedad\\/6787143edd037_lote1.jpg\",\"assets\\/img\\/propiedad\\/6787143ede5aa_lote2.jpg\",\"assets\\/img\\/propiedad\\/6787143ede9ed_lote3.jpg\",\"assets\\/img\\/propiedad\\/6787143edecfd_lote4.jpg\",\"assets\\/img\\/propiedad\\/6787143edf1e2_lote5.jpg\",\"assets\\/img\\/propiedad\\/6787143edf63b_lote6.jpg\",\"assets\\/img\\/propiedad\\/6787143edfaa4_lote7.jpg\",\"assets\\/img\\/propiedad\\/6787143edfe64_precios.jpg\"]', 6, 15, -41.14575400, -71.25796800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_propiedad`
--

DROP TABLE IF EXISTS `tipo_propiedad`;
CREATE TABLE IF NOT EXISTS `tipo_propiedad` (
  `id_type` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(25) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `tipo_propiedad`
--

INSERT INTO `tipo_propiedad` (`id_type`, `type_name`) VALUES
(6, 'Lote'),
(16, 'Casa'),
(17, 'Departamento'),
(19, 'Duplex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mail` varchar(50) NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(15) NOT NULL,
  `role` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `name`, `lastname`, `mail`, `password`, `phone`, `role`) VALUES
(11, 'Catalina', 'Tela', 'catatela@gmail.com', '$2y$10$FH3W9llstuRUXL4891n3dOJ29ecyAEkE5oQkWhjyUlC17/AAqSxoy', '+5492944568432', 'admin'),
(13, 'Hermes', 'Tela', 'hermes@gmail.com', '$2y$10$0xM0VQnm.zykDSs0LnsfUeguXKKE0KNwhrhdXbIAMDcjE4uEzfgK.', '+5492944568432', 'user'),
(14, 'cata', 'tela', 'tela.cata@gmail.com', '$2y$10$WGVL0JiR5fw9LAFiSVhMbeNYYhn2ZbotQaEoDe3gjbkkvARDamave', '+5497563214568', 'user'),
(15, 'admi', 'nistrador', 'admin@gmail.com', '$2y$10$KHc/Xyq0JuKskbpguZLCbesfUIztlEeBhDH/ozqm/HYBDONWXl1Qu', '+54687921354', 'admin'),
(16, 'user', 'usuario', 'user@gmail.com', '$2y$10$n.LkaD0TdU/u7/CneAmoneTqIQlYlQXfpx2skrVd2sm2xh9eLf3cy', '+54687921356', 'user'),
(22, 'ailen', 'rodriguez', 'ailenrodriguez2812@gmail.com', '$2y$10$wvVUL4jFwHkjiJlwTwvkjuw8alzcX79NEUZp1yETP23xYJw1IStGO', '+546879123', 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_pendientes`
--

DROP TABLE IF EXISTS `usuarios_pendientes`;
CREATE TABLE IF NOT EXISTS `usuarios_pendientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `mail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD CONSTRAINT `propiedades_ibfk_1` FOREIGN KEY (`id_operation`) REFERENCES `operacion_inmobiliaria` (`id_operation`),
  ADD CONSTRAINT `propiedades_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `tipo_propiedad` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
