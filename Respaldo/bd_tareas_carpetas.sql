-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_tareas
-- ------------------------------------------------------
-- Server version	5.7.34-log

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
-- Table structure for table `carpetas`
--

DROP TABLE IF EXISTS `carpetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpetas` (
  `idCarpeta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idCarpetaPadre` int(11) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `enPapelera` tinyint(4) NOT NULL,
  PRIMARY KEY (`idCarpeta`),
  KEY `FK_CARPETAS_USUARIOS_idx` (`idUsuario`),
  KEY `FK_CARPETAS_SUBCARPETAS_idx` (`idCarpetaPadre`),
  CONSTRAINT `FK_CARPETAS_USUARIOS` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_SUBCARPETAS_CARPETAS` FOREIGN KEY (`idCarpetaPadre`) REFERENCES `carpetas` (`idCarpeta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpetas`
--

LOCK TABLES `carpetas` WRITE;
/*!40000 ALTER TABLE `carpetas` DISABLE KEYS */;
INSERT INTO `carpetas` VALUES (1,8,NULL,'DAQO New Energy Corp.',0),(2,3,NULL,'Nuveen Build America Bond Fund',0),(3,4,NULL,'Rockwell Collins, Inc.',0),(4,8,NULL,'Analogic Corporation',0),(5,10,NULL,'Presentaciones para Clientes',1),(6,9,NULL,'Investigación de Mercado',0),(7,9,6,'Eventos Corporativos',0),(8,10,5,'Gestión de Proyectos',0),(9,5,NULL,'Capacitación y Desarrollo',0),(10,5,NULL,'Análisis Financiero',1),(11,8,NULL,'DAQO New Energy Corp.',0),(12,7,NULL,'Oportunidades de Negocio',0),(13,9,6,'Pruebas de Calidad',0),(14,8,1,'Optimización de Procesos',0),(15,10,NULL,'Presentaciones para Clientes',1);
/*!40000 ALTER TABLE `carpetas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24  5:09:08
