CREATE DATABASE  IF NOT EXISTS `bd_tareas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_tareas`;
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

--
-- Table structure for table `carpetascompartidas`
--

DROP TABLE IF EXISTS `carpetascompartidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carpetascompartidas` (
  `idCarpeta` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCompartida` date NOT NULL,
  PRIMARY KEY (`idCarpeta`,`idUsuario`),
  KEY `FK_CARPETASCOMPARTIDAS_USUARIOS_idx` (`idUsuario`),
  CONSTRAINT `FK_CARPETASCOMPARTIDAS_CARPETAS` FOREIGN KEY (`idCarpeta`) REFERENCES `carpetas` (`idCarpeta`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CARPETASCOMPARTIDAS_USUARIOS` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpetascompartidas`
--

LOCK TABLES `carpetascompartidas` WRITE;
/*!40000 ALTER TABLE `carpetascompartidas` DISABLE KEYS */;
INSERT INTO `carpetascompartidas` VALUES (1,10,'2023-05-05'),(2,4,'2023-06-02'),(4,1,'2023-05-24'),(5,6,'2023-05-24'),(6,2,'2023-05-24'),(6,8,'2023-05-08'),(6,10,'2023-05-08'),(7,7,'2023-05-23'),(8,4,'2023-05-19'),(9,8,'2023-05-19'),(10,10,'2023-06-02'),(12,1,'2023-05-08'),(13,7,'2023-05-08'),(14,7,'2023-05-05');
/*!40000 ALTER TABLE `carpetascompartidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiquetas`
--

DROP TABLE IF EXISTS `etiquetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etiquetas` (
  `idEtiqueta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idEtiqueta`),
  KEY `FK_ETIQUETAS_USUARIOS_idx` (`idUsuario`),
  CONSTRAINT `FK_ETIQUETAS_USUARIOS` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (1,2,'Marketing'),(2,5,'Desarrollo'),(3,1,'Administrativo'),(4,4,'Diseño'),(5,7,'Ventas'),(6,8,'Investigación'),(7,10,'Proyectos'),(8,2,'Prioritario'),(9,6,'Eventos'),(10,1,'Informes'),(11,9,'SEO'),(12,3,'Mantenimiento'),(13,9,'Capacitación'),(14,2,'Finanzas'),(15,6,'Planificación');
/*!40000 ALTER TABLE `etiquetas` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tareascompartidas`
--

DROP TABLE IF EXISTS `tareascompartidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tareascompartidas` (
  `idTarea` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaCompartida` date NOT NULL,
  PRIMARY KEY (`idTarea`,`idUsuario`),
  KEY `FK_TAREASCOMPARTIDAS_USUARIO_idx` (`idUsuario`),
  CONSTRAINT `FK_TAREASCOMPARTIDAS_TARES` FOREIGN KEY (`idTarea`) REFERENCES `tareas` (`idTarea`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TAREASCOMPARTIDAS_USUARIO` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareascompartidas`
--

LOCK TABLES `tareascompartidas` WRITE;
/*!40000 ALTER TABLE `tareascompartidas` DISABLE KEYS */;
INSERT INTO `tareascompartidas` VALUES (3,4,'2023-05-05'),(4,10,'2023-06-02'),(6,4,'2023-06-02'),(9,1,'2023-05-24'),(10,1,'2023-05-18'),(10,7,'2023-06-15'),(12,6,'2023-05-24'),(14,1,'2023-05-23'),(15,4,'2023-05-30'),(17,10,'2023-06-19'),(18,6,'2023-07-19'),(19,8,'2023-06-05'),(21,9,'2023-07-08'),(22,4,'2023-06-08'),(24,9,'2023-08-08'),(28,8,'2023-06-05'),(29,1,'2023-06-05'),(30,1,'2023-06-19'),(32,1,'2023-06-21'),(35,6,'2023-06-23'),(37,6,'2023-06-19'),(39,1,'2023-06-19'),(40,1,'2023-06-27'),(41,7,'2023-06-19'),(43,1,'2023-06-19'),(44,3,'2023-06-19'),(48,6,'2023-06-23'),(50,5,'2023-06-27');
/*!40000 ALTER TABLE `tareascompartidas` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(60) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario1@example.com','8tH$1J@f','john','smith'),(2,'john.doe@example.com','p2#Ri5!e','john','doe'),(3,'emily.smith@example.com','S@7bK3*d','emily','smith'),(4,'jennifer.wilson@example.com','x9#Pm@L7','jennifer','wilson'),(5,'david.miller@example.com','3@Yz$9pX','david','miller'),(6,'sarah.johnson@example.com','Q6^fD9@2','sarah','johnson'),(7,'michael.brown@example.com','m@5z8!eF','michael','brown'),(8,'linda.davis@example.com','H2&kS7!l','linda ','davis'),(9,'robert.jones@example.com','T@1wR3!e','robert','jones'),(10,'laura.thompson@example.com','b@4Lm8#S','laura','thompson');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-01  3:10:51
