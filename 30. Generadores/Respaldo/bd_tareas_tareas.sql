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
-- Table structure for table `tareas`
--

DROP TABLE IF EXISTS `tareas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareas` (
  `idTarea` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idTareaPadre` int(11) DEFAULT NULL,
  `idCarpeta` int(11) DEFAULT NULL,
  `titulo` varchar(100) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fechaInicio` datetime DEFAULT NULL,
  `fechaVencimiento` datetime DEFAULT NULL,
  `prioridad` enum('Alta','Media','Baja') DEFAULT NULL,
  `estado` enum('Completado','No completado') NOT NULL,
  `enPapelera` tinyint(4) NOT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `hola_idx` (`idUsuario`),
  KEY `FK_SUBTAREAS_TAREAS_idx` (`idTareaPadre`),
  KEY `FK_TAREAS_CARPETAS_idx` (`idCarpeta`),
  CONSTRAINT `FK_SUBTAREAS_TAREAS` FOREIGN KEY (`idTareaPadre`) REFERENCES `tareas` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREAS_CARPETAS` FOREIGN KEY (`idCarpeta`) REFERENCES `carpetas` (`idCarpeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREAS_USUARIOS` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,4,NULL,15,'Revisar informe de ventas','','2023-04-25 01:15:45','2023-05-05 05:05:23','Alta','Completado',0),(2,4,NULL,3,'Organizar reunión de equipo','','2023-04-26 02:23:43','2023-05-06 05:06:23','Alta','Completado',0),(3,4,1,15,'Actualizar sitio web','','2023-04-27 13:24:59','2023-05-07 15:44:58','Alta','No completado',0),(4,10,NULL,8,'Investigar nuevos proveedores','','2023-04-28 12:34:12','2023-05-08 11:22:33','Alta','Completado',0),(5,6,NULL,NULL,'Preparar presentación para cliente','','2023-04-29 15:22:54','2023-05-09 17:47:56','Media','No completado',0),(6,3,NULL,2,'Realizar análisis de mercado','','2023-04-30 05:54:11','2023-05-10 19:19:19','Alta','Completado',1),(7,1,NULL,NULL,'Planificar evento corporativo','','2023-05-01 12:33:55','2023-05-11 22:01:34','Media','Completado',1),(8,5,NULL,11,'Configurar sistema de gestión de proyectos','','2023-05-02 03:45:45','2023-05-12 05:09:56','Baja','No completado',0),(9,1,7,NULL,'Capacitacion en nuevas tecnologías','','2023-05-03 09:56:00','2023-05-13 23:59:59','Baja','Completado',1),(10,7,NULL,12,'Realizar análisis financiero','','2023-05-04 08:33:17','2023-05-14 17:25:45','Baja','No completado',0),(11,10,NULL,5,'Desarrollar estrategia de redes sociales','','2023-05-05 05:05:23','2023-05-15 15:12:09','Media','Completado',0),(12,10,11,5,'Investigar nuevas oportunidades de negocio','','2023-05-06 05:06:23','2023-05-16 09:35:12','Alta','Completado',0),(13,5,NULL,10,'Realizar pruebas de calidad','','2023-05-07 15:44:58','2023-05-17 21:53:11','Media','Completado',0),(14,1,7,NULL,'Optimizar procesos internos','','2023-05-08 11:22:33','2023-05-18 13:14:41','Alta','No completado',1),(15,3,6,2,'Investigar tendencias de mercado','','2023-05-09 17:47:56','2023-05-19 16:28:41','Baja','Completado',1),(16,4,2,3,'Realizar campaña publicitaria','','2023-05-10 19:19:19','2023-05-20 13:25:07','Baja','Completado',0),(17,10,4,8,'Evaluar el rendimiento del personal','','2023-05-11 22:01:34','2023-05-21 15:55:18','Alta','No completado',0),(18,6,5,NULL,'Actualizar políticas y procedimientos','','2023-05-12 05:09:56','2023-05-22 09:12:34','Alta','Completado',0),(19,5,NULL,9,'Coordinar el lanzamiento de un producto','','2023-05-13 23:59:59','2023-05-23 06:00:00','Baja','No completado',0),(20,3,6,2,'Realizar análisis de riesgos','','2023-05-14 17:25:45','2023-05-24 07:27:59','Alta','No completado',1),(21,9,NULL,7,'Mantenimiento del equipo informático','','2023-05-15 15:12:09','2023-05-25 22:41:23','Alta','Completado',0),(22,10,4,8,'Elaborar estrategia de fidelización de clientes','','2023-05-16 09:35:12','2023-05-26 23:11:23','Alta','Completado',0),(23,10,22,8,'Participar en una conferencia de la industria','','2023-05-17 21:53:11','2023-05-27 18:36:00','Alta','Completado',1),(24,9,NULL,13,'Realizar seguimiento de ventas','','2023-05-18 13:14:41','2023-05-28 12:08:45','Alta','No completado',0),(25,5,8,11,'Desarrollar una estrategia de SEO','','2023-05-19 16:28:41','2023-05-29 15:34:16','Alta','Completado',0),(26,7,10,12,'Implementar un sistema de gestión de inventario','','2023-05-20 13:25:07','2023-05-30 15:43:15','Alta','Completado',0),(27,5,13,10,'Realizar investigaciones de satisfacción del cliente','','2023-05-21 15:55:18','2023-05-31 15:08:44','Baja','Completado',0),(28,9,NULL,6,'Preparar informe de gastos','','2023-05-22 09:12:34','2023-06-01 16:23:01','Media','No completado',1),(29,7,NULL,12,'Diseñar un nuevo logotipo','','2023-05-23 06:00:00','2023-06-02 22:45:45','Alta','Completado',1),(30,8,NULL,4,'Realizar auditoría interna','','2023-05-24 07:27:59','2023-06-03 16:37:07','Alta','Completado',1),(31,5,13,10,'Revisar informe de ventas','','2023-05-25 22:41:23','2023-06-04 04:21:16','Baja','No completado',0),(32,1,NULL,NULL,'Organizar reunión de equipo','','2023-05-26 23:11:23','2023-06-05 22:15:34','Media','No completado',1),(33,1,NULL,NULL,'Actualizar sitio web','','2023-05-27 18:36:00','2023-06-06 12:12:11','Alta','No completado',1),(34,1,NULL,NULL,'Investigar nuevos proveedores','','2023-05-28 12:08:45','2023-06-07 18:56:23','Alta','No completado',1),(35,6,NULL,NULL,'Preparar presentación para cliente','','2023-05-29 15:34:16','2023-06-08 12:56:34','Media','Completado',1),(36,6,NULL,NULL,'Realizar análisis de mercado','','2023-05-30 15:43:15','2023-06-09 09:12:43','Baja','No completado',1),(37,6,NULL,NULL,'Planificar evento corporativo','','2023-05-31 15:08:44','2023-06-10 10:15:36','Media','No completado',1),(38,8,NULL,1,'Configurar sistema de gestión de proyectos','','2023-06-01 16:23:01','2023-06-11 12:12:12','Baja','No completado',0),(39,8,NULL,4,'Capacitación en nuevas tecnologías','','2023-06-02 22:45:45','2023-06-12 07:06:17','Media','No completado',0),(40,1,NULL,NULL,'Realizar análisis financiero','','2023-06-03 16:37:07','2023-06-13 23:34:51','Media','No completado',0),(41,7,10,12,'Desarrollar estrategia de redes sociales','','2023-06-04 04:21:16','2023-06-14 01:15:45','Alta','Completado',0),(42,6,NULL,NULL,'Investigar nuevas oportunidades de negocio','','2023-06-05 22:15:34','2023-06-15 02:23:43','Alta','Completado',0),(43,1,NULL,NULL,'Realizar pruebas de calidad','','2023-06-06 12:12:11','2023-06-16 13:24:59','Alta','Completado',0),(44,3,6,2,'Optimizar procesos internos','','2023-06-07 18:56:23','2023-06-17 12:34:12','Baja','No completado',1),(45,1,NULL,NULL,'Investigar tendencias de mercado','','2023-06-08 12:56:34','2023-06-18 15:22:54','Alta','Completado',0),(46,4,2,3,'Realizar campaña publicitaria','','2023-06-09 09:12:43','2023-06-19 05:54:11','Alta','Completado',0),(47,2,NULL,NULL,'Evaluar el rendimiento del personal','','2023-06-10 10:15:36','2023-06-20 12:33:55','Alta','Completado',0),(48,6,NULL,NULL,'Actualizar políticas y procedimientos','','2023-06-11 12:12:12','2023-06-21 03:45:45','Alta','Completado',0),(49,7,10,12,'Coordinar el lanzamiento de un producto','','2023-06-12 07:06:17','2023-06-22 09:56:00','Media','No completado',0),(50,5,NULL,10,'Realizar seguimiento de ventas','','2023-06-13 23:34:51','2023-06-23 08:33:17','Baja','No completado',1);
/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-24  5:09:07
