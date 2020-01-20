-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: jojuanita
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito_producto`
--

DROP TABLE IF EXISTS `carrito_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_producto` (
  `id_carrito_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_carrito` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `precio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_carrito_producto`),
  KEY `idcarrito_idx` (`id_carrito`),
  KEY `idproducto_idx` (`id_producto`),
  CONSTRAINT `F_K_carrito_id` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`),
  CONSTRAINT `F_K_producto_id` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_producto`
--

LOCK TABLES `carrito_producto` WRITE;
/*!40000 ALTER TABLE `carrito_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritos`
--

DROP TABLE IF EXISTS `carritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos` (
  `id_carrito` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carrito`),
  KEY `idusuario_idx` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos`
--

LOCK TABLES `carritos` WRITE;
/*!40000 ALTER TABLE `carritos` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categorias` int(11) NOT NULL AUTO_INCREMENT,
  `categorias` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categorias`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'carteras'),(2,'mochilas'),(3,'billeteras'),(4,'mochila'),(5,'mochilas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colores`
--

DROP TABLE IF EXISTS `colores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colores` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colores`
--

LOCK TABLES `colores` WRITE;
/*!40000 ALTER TABLE `colores` DISABLE KEYS */;
INSERT INTO `colores` VALUES (1,'blanco'),(2,'celeste'),(3,'negro'),(4,'rosa'),(5,'Blanco');
/*!40000 ALTER TABLE `colores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `id_color` int(11) DEFAULT NULL,
  `descripcion` varchar(600) DEFAULT NULL,
  `stock` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `precio` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categorias_idx` (`id_categoria`),
  KEY `id_color_idx` (`id_color`),
  CONSTRAINT `id_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categorias`),
  CONSTRAINT `id_color` FOREIGN KEY (`id_color`) REFERENCES `colores` (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,2,1,'INNOVACIÓN: material cristal. Cartera innovadora, con impresión en el frente. Herrajes nuevos con forma de corazón y neceser que puede ser utilizado, en si mismo, como otra cartera del tipo sobre. Las dos manijas cortas son rígidas y la correa larga es extraíble. Combina material efecto cuero y tela impresa exclusiva de la marca. Tiene varios bolsillo internos, con y sin cierre. Posee las chapas de Juanita Jo (redonda y rectangular), forro y herrajes personalizados de la marca. Está confeccionada con material alternativo al cuero animal. Las medidas aproximadas son: 39 cm por 42 cm','30','mochila gerdenia','6500'),(2,1,2,'INNOVACIÓN: material cristal. Cartera innovadora, con impresión en el frente. Herrajes nuevos con forma de corazón y neceser que puede ser utilizado, en si mismo, como otra cartera del tipo sobre. Las dos manijas cortas son rígidas y la correa larga es extraíble. Combina material efecto cuero y tela impresa exclusiva de la marca. Tiene varios bolsillo internos, con y sin cierre. Posee las chapas de Juanita Jo (redonda y rectangular), forro y herrajes personalizados de la marca. Está confeccionada con material alternativo al cuero animal. Las medidas aproximadas son: 39 cm por 42 cm','25','cartera climit','5500'),(3,3,3,'INNOVACIÓN: material cristal. Cartera innovadora, con impresión en el frente. Herrajes nuevos con forma de corazón y neceser que puede ser utilizado, en si mismo, como otra cartera del tipo sobre. Las dos manijas cortas son rígidas y la correa larga es extraíble. Combina material efecto cuero y tela impresa exclusiva de la marca. Tiene varios bolsillo internos, con y sin cierre. Posee las chapas de Juanita Jo (redonda y rectangular), forro y herrajes personalizados de la marca. Está confeccionada con material alternativo al cuero animal. Las medidas aproximadas son: 39 cm por 42 cm','36','billetera casual','2700'),(4,NULL,NULL,NULL,NULL,'Mochila gerdenia','$6500');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `dni` varchar(8) NOT NULL,
  `domicilio` varchar(50) DEFAULT NULL,
  `tel_fijo` char(20) DEFAULT NULL,
  `tel_celular` char(20) DEFAULT NULL,
  `mail` varchar(100) NOT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `dni_UNIQUE` (`dni`),
  UNIQUE KEY `email_UNIQUE` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'yesica','benito','1995-02-04','argentina','47888834','pergamino 260','42372508','1559982660','yesicamicaelabenito@gmail.com',NULL),(2,'Mercedes','Cusi','1997-02-05','argentina','37123123','Larrea 150','42872501','1559982630','mcusi@gmail.com',NULL),(3,'Vanina','Meza','1987-02-12','argentina','29331203','Lavalle 1520','42104512','1559942375','vanmeza@gmail.com',NULL),(4,'Tatiana','Maqueira','1937-02-15','argentina','23444851','Lima 2506','42815784','1553002323','tatianam@gmail.com',NULL),(6,'Yesica','Benito',NULL,NULL,'47888830',NULL,NULL,'1559982660','ybenito@bpba.com',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_carrito` int(11) DEFAULT NULL,
  `met_de_pago` int(11) DEFAULT NULL,
  `precio_final` int(11) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `idcarrito_idx` (`id_carrito`),
  CONSTRAINT `id_carrito` FOREIGN KEY (`id_carrito`) REFERENCES `carritos` (`id_carrito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-20 13:41:10
