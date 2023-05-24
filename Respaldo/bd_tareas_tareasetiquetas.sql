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
-- Table structure for table `tareasetiquetas`
--

DROP TABLE IF EXISTS `tareasetiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareasetiquetas` (
  `idTarea` int(11) NOT NULL,
  `idEtiqueta` int(11) NOT NULL,
  PRIMARY KEY (`idTarea`,`idEtiqueta`),
  KEY `FK_TAREASETIQUETAS_ETIQUETAS_idx` (`idEtiqueta`),
  CONSTRAINT `FK_TAREASETIQUETAS_ETIQUETAS` FOREIGN KEY (`idEtiqueta`) REFERENCES `etiquetas` (`idEtiqueta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREASETIQUETAS_TAREAS` FOREIGN KEY (`idTarea`) REFERENCES `tareas` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareasetiquetas`
--

LOCK TABLES `tareasetiquetas` WRITE;
/*!40000 ALTER TABLE `tareasetiquetas` DISABLE KEYS */;
INSERT INTO `tareasetiquetas` VALUES (8,2),(19,2),(27,2),(50,2),(9,3),(32,3),(43,3),(45,3),(2,4),(3,4),(16,4),(29,5),(30,6),(11,7),(12,7),(22,7),(47,8),(14,10),(33,10),(34,10),(25,11),(28,11),(6,12),(15,12),(21,13),(18,15),(35,15),(48,15);
/*!40000 ALTER TABLE `tareasetiquetas` ENABLE KEYS */;
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
