CREATE DATABASE  IF NOT EXISTS `bd_tareas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `bd_tareas`;
-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: tareas-db-2.cgk8ugadcxaa.us-east-2.rds.amazonaws.com    Database: bd_tareas
-- ------------------------------------------------------
-- Server version	5.7.42

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carpetas`
--

LOCK TABLES `carpetas` WRITE;
/*!40000 ALTER TABLE `carpetas` DISABLE KEYS */;
INSERT INTO `carpetas` VALUES (1,8,NULL,'DAQO New Energy Corp.',0),(3,4,NULL,'Rockwell Collins, Inc.',0),(4,8,NULL,'Analogic Corporation',0),(5,10,NULL,'Presentaciones para Clientes',1),(6,9,NULL,'Investigación de Mercado',0),(7,9,6,'Eventos Corporativos',0),(8,10,5,'Gestión de Proyectos',0),(9,5,NULL,'Capacitación y Desarrollo',0),(10,5,NULL,'Análisis Financiero',1),(11,8,NULL,'DAQO New Energy Corp.',0),(12,7,NULL,'Oportunidades de Negocio',0),(13,9,6,'Pruebas de Calidad',0),(14,8,1,'Optimización de Procesos',0),(15,10,NULL,'Presentaciones para Clientes',1),(29,21,NULL,'Carpeta Jose actualizada',0),(30,12,NULL,'asdf',0),(31,12,NULL,'asdff',0),(32,12,NULL,'afs',0),(33,12,NULL,'1234',0),(58,1,NULL,'Test 1',0),(59,1,NULL,'asdf',0);
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
INSERT INTO `carpetascompartidas` VALUES (1,10,'2023-05-05'),(4,1,'2023-05-24'),(5,6,'2023-05-24'),(6,2,'2023-05-24'),(6,8,'2023-05-08'),(6,10,'2023-05-08'),(7,7,'2023-05-23'),(8,4,'2023-05-19'),(9,8,'2023-05-19'),(10,10,'2023-06-02'),(12,1,'2023-05-08'),(13,7,'2023-05-08'),(14,7,'2023-05-05');
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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiquetas`
--

LOCK TABLES `etiquetas` WRITE;
/*!40000 ALTER TABLE `etiquetas` DISABLE KEYS */;
INSERT INTO `etiquetas` VALUES (2,5,'Desarrollo'),(3,1,'Administrativo'),(4,4,'Diseño'),(5,7,'Ventas'),(6,8,'Investigación'),(7,10,'Proyectos'),(8,2,'Prioritario'),(9,6,'Eventos'),(10,1,'Informes'),(11,9,'SEO'),(12,3,'Mantenimiento'),(13,9,'Capacitación'),(14,2,'Finanzas'),(15,6,'Planificación'),(37,1,'Prueba 1');
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tareas`
--

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;
INSERT INTO `tareas` VALUES (1,4,NULL,15,'Revisar informe de ventas','','2023-04-25 01:15:45','2023-05-05 05:05:23','Alta','No completado',0),(2,4,NULL,3,'Organizar reunión de equipo','','2023-04-26 02:23:43','2023-05-06 05:06:23','Alta','Completado',0),(3,4,1,15,'Actualizar sitio web','','2023-04-27 13:24:59','2023-05-07 15:44:58','Alta','No completado',0),(4,10,NULL,8,'Investigar nuevos proveedores','','2023-04-28 12:34:12','2023-05-08 11:22:33','Alta','Completado',0),(5,6,NULL,NULL,'Preparar presentación para cliente','','2023-04-29 15:22:54','2023-05-09 17:47:56','Media','No completado',0),(7,1,NULL,NULL,'Planificar evento corporativo','','2023-05-01 12:33:55','2023-05-11 22:01:34','Media','Completado',1),(8,5,NULL,11,'Configurar sistema de gestión de proyectos','','2023-05-02 03:45:45','2023-05-12 05:09:56','Baja','No completado',0),(9,1,7,NULL,'Capacitacion en nuevas tecnologías','','2023-05-03 09:56:00','2023-05-13 23:59:59','Baja','Completado',1),(10,7,NULL,12,'Realizar análisis financiero','','2023-05-04 08:33:17','2023-05-14 17:25:45','Baja','No completado',0),(11,10,NULL,5,'Desarrollar estrategia de redes sociales','','2023-05-05 05:05:23','2023-05-15 15:12:09','Media','Completado',0),(12,10,11,5,'Investigar nuevas oportunidades de negocio','','2023-05-06 05:06:23','2023-05-16 09:35:12','Alta','Completado',0),(13,5,NULL,10,'Realizar pruebas de calidad','','2023-05-07 15:44:58','2023-05-17 21:53:11','Media','Completado',0),(14,1,7,NULL,'Optimizar procesos internos','','2023-05-08 11:22:33','2023-05-18 13:14:41','Alta','No completado',1),(16,4,2,3,'Realizar campaña publicitaria','','2023-05-10 19:19:19','2023-05-20 13:25:07','Baja','Completado',0),(17,10,4,8,'Evaluar el rendimiento del personal','','2023-05-11 22:01:34','2023-05-21 15:55:18','Alta','No completado',0),(18,6,5,NULL,'Actualizar políticas y procedimientos','','2023-05-12 05:09:56','2023-05-22 09:12:34','Alta','Completado',0),(19,5,NULL,9,'Coordinar el lanzamiento de un producto','','2023-05-13 23:59:59','2023-05-23 06:00:00','Baja','No completado',0),(21,9,NULL,7,'Mantenimiento del equipo informático','','2023-05-15 15:12:09','2023-05-25 22:41:23','Alta','Completado',0),(22,10,4,8,'Elaborar estrategia de fidelización de clientes','','2023-05-16 09:35:12','2023-05-26 23:11:23','Alta','Completado',0),(23,10,22,8,'Participar en una conferencia de la industria','','2023-05-17 21:53:11','2023-05-27 18:36:00','Alta','Completado',1),(24,9,NULL,13,'Realizar seguimiento de ventas','','2023-05-18 13:14:41','2023-05-28 12:08:45','Alta','No completado',0),(25,5,8,11,'Desarrollar una estrategia de SEO','','2023-05-19 16:28:41','2023-05-29 15:34:16','Alta','Completado',0),(26,7,10,12,'Implementar un sistema de gestión de inventario','','2023-05-20 13:25:07','2023-05-30 15:43:15','Alta','Completado',0),(27,5,13,10,'Realizar investigaciones de satisfacción del cliente','','2023-05-21 15:55:18','2023-05-31 15:08:44','Baja','Completado',0),(28,9,NULL,6,'Preparar informe de gastos','','2023-05-22 09:12:34','2023-06-01 16:23:01','Media','No completado',1),(29,7,NULL,12,'Diseñar un nuevo logotipo','','2023-05-23 06:00:00','2023-06-02 22:45:45','Alta','Completado',1),(30,8,NULL,4,'Realizar auditoría interna','','2023-05-24 07:27:59','2023-06-03 16:37:07','Alta','Completado',1),(31,5,13,10,'Revisar informe de ventas','','2023-05-25 22:41:23','2023-06-04 04:21:16','Baja','No completado',0),(32,1,NULL,NULL,'Organizar reunión de equipo','','2023-05-26 23:11:23','2023-06-05 22:15:34','Media','No completado',1),(33,1,NULL,NULL,'Actualizar sitio web','','2023-05-27 18:36:00','2023-06-06 12:12:11','Alta','No completado',1),(34,1,NULL,NULL,'Investigar nuevos proveedores','','2023-05-28 12:08:45','2023-06-07 18:56:23','Alta','No completado',1),(35,6,NULL,NULL,'Preparar presentación para cliente','','2023-05-29 15:34:16','2023-06-08 12:56:34','Media','Completado',1),(36,6,NULL,NULL,'Realizar análisis de mercado','','2023-05-30 15:43:15','2023-06-09 09:12:43','Baja','No completado',1),(37,6,NULL,NULL,'Planificar evento corporativo','','2023-05-31 15:08:44','2023-06-10 10:15:36','Media','No completado',1),(38,8,NULL,1,'Configurar sistema de gestión de proyectos','','2023-06-01 16:23:01','2023-06-11 12:12:12','Baja','No completado',0),(39,8,NULL,4,'Capacitación en nuevas tecnologías','','2023-06-02 22:45:45','2023-06-12 07:06:17','Media','No completado',0),(40,1,NULL,NULL,'Realizar análisis financiero','','2023-04-03 16:37:07','2023-04-13 23:34:51','Media','Completado',1),(41,7,10,12,'Desarrollar estrategia de redes sociales','','2023-06-04 04:21:16','2023-06-14 01:15:45','Alta','Completado',0),(42,6,NULL,NULL,'Investigar nuevas oportunidades de negocio','','2023-06-05 22:15:34','2023-06-15 02:23:43','Alta','Completado',0),(43,1,NULL,NULL,'Realizar pruebas de calidad','','2023-04-06 12:12:11','2023-04-16 13:24:59','Alta','Completado',0),(45,1,NULL,NULL,'Investigar tendencias de mercado','','2023-05-08 12:56:34','2023-05-18 15:22:54','Alta','No completado',1),(46,4,2,3,'Realizar campaña publicitaria','','2023-06-09 09:12:43','2023-06-19 05:54:11','Alta','Completado',0),(47,2,NULL,NULL,'Evaluar el rendimiento del personal','','2023-06-10 10:15:36','2023-06-20 12:33:55','Alta','Completado',0),(48,6,NULL,NULL,'Actualizar políticas y procedimientos','','2023-06-11 12:12:12','2023-06-21 03:45:45','Alta','Completado',0),(49,7,10,12,'Coordinar el lanzamiento de un producto','','2023-06-12 07:06:17','2023-06-22 09:56:00','Media','No completado',0),(50,5,NULL,10,'Realizar seguimiento de ventas','','2023-06-13 23:34:51','2023-06-23 08:33:17','Baja','No completado',1),(64,21,NULL,29,'Tarea primera','primera',NULL,NULL,NULL,'No completado',1),(65,21,64,29,'Subtarea test','','2023-06-06 00:50:59','2023-06-06 23:59:59',NULL,'No completado',1),(66,1,NULL,NULL,'Prueba fecha','Nada','0000-00-00 00:00:00','2023-05-09 00:00:00','Alta','Completado',0),(67,1,NULL,NULL,'asdf','','2023-05-08 21:58:34','2023-05-08 23:59:59','','Completado',1),(68,1,NULL,58,'asdf','',NULL,NULL,'','Completado',1),(69,1,NULL,58,'Hola','',NULL,NULL,'','Completado',0),(70,1,NULL,NULL,'asdf','','2023-05-08 22:17:00','2023-05-08 23:59:59','','Completado',1),(71,1,NULL,NULL,'ASDF','','2023-05-08 22:27:41','2023-05-08 23:59:59','','Completado',1);
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
INSERT INTO `tareascompartidas` VALUES (3,4,'2023-05-05'),(4,10,'2023-06-02'),(7,5,'2023-06-02'),(9,1,'2023-05-24'),(9,5,'2023-06-02'),(10,1,'2023-05-18'),(10,7,'2023-06-15'),(12,6,'2023-05-24'),(14,1,'2023-05-23'),(14,5,'2023-06-02'),(17,10,'2023-06-19'),(18,6,'2023-07-19'),(19,8,'2023-06-05'),(21,9,'2023-07-08'),(22,4,'2023-06-08'),(24,9,'2023-08-08'),(28,8,'2023-06-05'),(29,1,'2023-06-05'),(30,1,'2023-06-19'),(32,1,'2023-06-21'),(35,6,'2023-06-23'),(37,6,'2023-06-19'),(39,1,'2023-06-19'),(40,1,'2023-06-27'),(41,7,'2023-06-19'),(43,1,'2023-06-19'),(48,6,'2023-06-23'),(50,5,'2023-06-27');
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
INSERT INTO `tareasetiquetas` VALUES (8,2),(19,2),(27,2),(50,2),(9,3),(32,3),(43,3),(45,3),(2,4),(3,4),(16,4),(29,5),(30,6),(11,7),(12,7),(21,7),(22,7),(47,8),(33,10),(34,10),(25,11),(28,11),(21,13),(31,13),(18,15),(35,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'usuario1@example.com','8tH$1J@f','john','smith'),(2,'john.doe@example.com','p2#Ri5!e','john','doe'),(3,'emily.smith@example.com','S@7bK3*d','emily','smith'),(4,'jennifer.wilson@example.com','x9#Pm@L7','jennifer','wilson'),(5,'david.miller@example.com','3@Yz$9pX','david','miller'),(6,'sarah.johnson@example.com','Q6^fD9@2','sarah','johnson'),(7,'michael.brown@example.com','m@5z8!eF','michael','brown'),(8,'linda.davis@example.com','H2&kS7!l','linda ','davis'),(9,'robert.jones@example.com','T@1wR3!e','robert','jones'),(10,'laura.thompson@example.com','b@4Lm8#S','laura','thompson'),(12,'correoprueba@gmail.com','contraseña','javier','west'),(15,'correoprueba2@gmail.com','contraseña','javier','west'),(21,'juanrazo@test.com','1234','T','est');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_tareas'
--

--
-- Dumping routines for database 'bd_tareas'
--
/*!50003 DROP PROCEDURE IF EXISTS `D_Carpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_Carpeta`(
    IN p_idCarpeta INT
)
BEGIN
    -- Verificar si la carpeta existe
    IF NOT EXISTS (SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Carpeta inválida';
    ELSE
		IF EXISTS (SELECT * FROM carpetas WHERE idCarpeta = p_idCarpeta and enPapelera = false)
			THEN CALL U_CarpetaAPapelera(p_idCarpeta);
		ELSE
			DELETE FROM carpetas WHERE idCarpeta = p_idCarpeta;

			DELETE FROM carpetas WHERE idCarpetaPadre = p_idCarpeta;

			DELETE FROM carpetas WHERE idCarpeta = p_idCarpeta;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_CarpetaCompartida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_CarpetaCompartida`(
        IN p_idCarpeta INT,
        IN p_idUsuario INT
)
BEGIN

SET @@SESSION.max_sp_recursion_depth=25;

DELETE FROM carpetascompartidas WHERE
        idCarpeta = p_idCarpeta
        AND idUsuario = p_idUsuario;

CALL D_SubcarpetasCompartidas(p_idCarpeta, p_idUsuario);

CALL D_TareasCarpetaCompartida(p_idCarpeta, p_idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_Etiqueta` */;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_Etiqueta`(
        IN p_idEtiqueta INT
)
BEGIN
        DELETE FROM etiquetas 
        WHERE idEtiqueta = p_idEtiqueta; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `D_SubcarpetasCompartidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_SubcarpetasCompartidas`(
	IN p_idCarpetaPadre INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idSubcarpeta INT;
DECLARE var_final_sc INT DEFAULT 0;

DECLARE c_subcarpetas CURSOR FOR SELECT idCarpeta FROM carpetas WHERE idCarpetaPadre = p_idCarpetaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_sc = 1;

OPEN c_subcarpetas;

FETCH c_subcarpetas INTO v_idSubcarpeta;
WHILE NOT var_final_sc = 1 DO

	CALL D_CarpetaCompartida(v_idSubcarpeta, p_idUsuario);

	FETCH c_subcarpetas INTO v_idSubcarpeta;
END WHILE;
CLOSE c_subcarpetas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_SubtareasCompartidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_SubtareasCompartidas`(
	IN p_idTareaPadre INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idSubtarea INT;
DECLARE var_final_st INT DEFAULT 0;

DECLARE c_subtareas CURSOR FOR SELECT idTarea FROM tareas WHERE idTareaPadre = p_idTareaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_st = 1;

OPEN c_subtareas;

FETCH c_subtareas INTO v_idSubtarea;
WHILE NOT var_final_st = 1 DO

	CALL D_TareaCompartida(v_idSubtarea, p_idUsuario);

	FETCH c_subtareas INTO v_idSubtarea;
END WHILE;
CLOSE c_subtareas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_Tarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_Tarea`(
    IN p_idTarea INT
)
BEGIN
    -- Verificar si la tarea existe
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tarea inválida';
	-- Si la tarea no está en la papelera, borrarla y sus tareas hijas
    ELSE
		IF EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea and enPapelera = false)
			THEN CALL U_TareaAPapelera(p_idTarea);
		ELSE
			DELETE FROM tareas WHERE idTareaPadre = p_idTarea;
			DELETE FROM tareas WHERE idTarea = p_idTarea;
		END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_TareaCompartida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_TareaCompartida`(
	IN p_idTarea INT,
	IN p_idUsuario INT
)
BEGIN
SET @@SESSION.max_sp_recursion_depth=25;

DELETE FROM tareascompartidas WHERE
	idTarea = p_idTarea
	AND idUsuario = p_idUsuario;

CALL D_SubtareasCompartidas(p_idTarea, p_idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_TareaEtiqueta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_TareaEtiqueta`(
        IN p_idEtiqueta INT,
        IN p_idTarea INT
)
BEGIN 

        DELETE FROM tareasetiquetas WHERE idEtiqueta = p_idEtiqueta
                AND idTarea =  p_idTarea; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_TareasCarpetaCompartida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_TareasCarpetaCompartida`(
	IN p_idCarpeta INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idTarea INT;
DECLARE var_final_tc INT DEFAULT 0;

DECLARE c_tareas CURSOR FOR SELECT idTarea FROM tareas WHERE idCarpeta = p_idCarpeta AND idTareaPadre IS NULL;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_tc = 1;

OPEN c_tareas;

FETCH c_tareas INTO v_idTarea;
WHILE NOT var_final_tc = 1 DO

	CALL D_TareaCompartida(v_idTarea, p_idUsuario);

	FETCH c_tareas INTO v_idTarea;
END WHILE;
CLOSE c_tareas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `D_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `D_Usuario`(
  IN p_idUsuario INT
)
BEGIN

  IF NOT EXISTS (SELECT idUsuario, correo, contrasena, nombre, apellido FROM usuarios WHERE idUsuario = p_idUsuario) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
  ELSE
    
    DELETE FROM tareas WHERE idUsuario = p_idUsuario;
    
    DELETE FROM carpetas WHERE idUsuario = p_idUsuario;
    
	DELETE FROM usuarios WHERE idUsuario = p_idUsuario;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_CarpetaCompartidaConUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_CarpetaCompartidaConUsuarios`(
        IN p_idCarpeta INT
)
BEGIN

SELECT * FROM carpetascompartidas WHERE
        idCarpeta = p_idCarpeta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_Carpetas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_Carpetas`(
    IN p_idUsuario INT
)
BEGIN
    
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas
        WHERE idUsuario = p_idUsuario;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_CarpetasBuscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_CarpetasBuscar`(
    IN p_nombreCarpeta VARCHAR(255),
	IN p_idUsuario INT
)
BEGIN
        SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas
        WHERE nombre LIKE CONCAT('%', p_nombreCarpeta, '%') and idUsuario = p_idUsuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_CarpetasCompartidas` */;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_CarpetasCompartidas`(
    IN p_idUsuario INT
)
BEGIN
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT * FROM carpetas c
        INNER JOIN carpetascompartidas cc ON c.idCarpeta = cc.idCarpeta
        WHERE cc.idUsuario = p_idUsuario;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `G_CarpetasPapelera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_CarpetasPapelera`(
    IN p_idUsuario INT
)
BEGIN
    IF NOT EXISTS (SELECT idUsuario, correo, contrasena, nombre, apellido FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas
        WHERE idUsuario = p_idUsuario AND EnPapelera = 1;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_Etiquetas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_Etiquetas`(
        IN p_idUsuario INT
)
BEGIN 
        SELECT idUsuario,idEtiqueta,nombre FROM etiquetas WHERE idUsuario = p_idUsuario; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_EtiquetasBuscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_EtiquetasBuscar`(
        IN p_idUsuario INT,
        IN p_nombreBuscar VARCHAR(45)
)
BEGIN
        SELECT * FROM etiquetas 
                WHERE 
                        idUsuario = p_idUsuario
                        AND nombre LIKE CONCAT('%',p_nombreBuscar,'%'); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_SubtareasPorTareas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_SubtareasPorTareas`(
	in p_idTareaPadre int
)
BEGIN
    SELECT * FROM tareas where idTareaPadre = p_idTareaPadre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_Tarea` */;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_Tarea`(
		in p_idTarea int
    )
BEGIN
    SELECT * FROM tareas where idTarea=p_idTarea;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareaCarpeta` */;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareaCarpeta`(
		in p_idCarpeta int
    )
BEGIN
    SELECT * FROM tareas where idCarpeta=p_idCarpeta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareaCompartidaConUsuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareaCompartidaConUsuarios`(
        IN p_idTarea INT
)
BEGIN

SELECT * FROM tareascompartidas WHERE
        idTarea = p_idTarea;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareasBuscar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareasBuscar`(
	in p_text varchar(200),
    IN p_idUsuario INT
)
BEGIN
	SELECT * FROM tareas where idUsuario = p_idUsuario AND (descripcion like concat('%',p_text,'%') or titulo like concat('%',p_text,'%'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareasCarpetaCompartidas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareasCarpetaCompartidas`(
	IN p_idCarpeta INT,
	IN p_idUsuario INT
)
BEGIN

SELECT 
	tc.idTarea, 
	c.idCarpeta,
	t.idUsuario AS idUsuario,
	tc.idUsuario AS idUsuarioCompartido,
	tc.fechaCompartida,
	t.idTareaPadre,
	t.titulo,
	t.descripcion,
	t.fechaInicio,
	t.fechaVencimiento,
	t.prioridad,
	t.estado,
	t.enPapelera
FROM tareascompartidas tc
	INNER JOIN tareas t ON t.idTarea = tc.idTarea
	INNER JOIN carpetas c ON c.idCarpeta = t.idCarpeta
	WHERE 
		tc.idUsuario = p_idUsuario AND
		c.idCarpeta = p_idCarpeta;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareasEtiqueta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareasEtiqueta`(

        IN p_idEtiqueta INT
)
BEGIN 
        SELECT * FROM tareasetiquetas WHERE idEtiqueta = p_idEtiqueta; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareasProximas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareasProximas`(
		IN p_idUsuario int
    )
BEGIN
	SELECT *
	FROM tareas where (p_idUsuario = idUsuario and estado = 'No completado' and enPapelera = false)
	ORDER BY fechaVencimiento ASC LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_TareaVencimientoDia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_TareaVencimientoDia`(
	IN p_idUsuario INT
)
BEGIN
	 IF NOT EXISTS (SELECT * FROM tareas WHERE idUsuario = p_idUsuario)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
	ELSE
		SELECT * FROM tareas WHERE 
       ((concat(curdate(), ' 00:00:00') <= fechaVencimiento and fechaVencimiento <= concat(curdate(), ' 23:59:59')) 
       or (now() >= fechaInicio and fechaVencimiento >= now())) and idUsuario = p_idUsuario and enPapelera = false;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_Usuario`(
  IN p_idUsuario INT
)
BEGIN
  IF NOT EXISTS (SELECT idUsuario FROM usuarios WHERE idUsuario = p_idUsuario) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
  ELSE
    SELECT idUsuario, correo, contrasena, nombre, apellido FROM usuarios WHERE idUsuario = p_idUsuario;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `G_UsuarioPorCorreo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `G_UsuarioPorCorreo`(
  IN p_correo VARCHAR(255)
)
BEGIN
  -- Verificar que el correo electrónico exista en la tabla
  IF NOT EXISTS (SELECT idUsuario, correo, nombre, apellido FROM usuarios WHERE correo = p_correo) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico no existe.';
  ELSE
    SELECT idUsuario, correo, contrasena, nombre, apellido FROM usuarios WHERE correo = p_correo;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_Carpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_Carpeta`(
  IN p_idUsuario INT,
  IN p_idCarpetaPadre INT,
  IN p_Nombre VARCHAR(255)
)
BEGIN
  IF EXISTS (SELECT nombre FROM carpetas WHERE p_idUsuario = idUsuario AND nombre = p_nombre) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo nombre y misma posicion';
  ELSEIF (p_nombre IS NULL OR p_nombre='') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de la carpeta no puede estar vacio';
  ELSE
    IF NOT EXISTS (SELECT idUsuario FROM usuarios WHERE idUsuario = p_idUsuario) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
    ELSE
      IF p_idCarpetaPadre IS NOT NULL AND NOT EXISTS (SELECT idCarpeta FROM carpetas WHERE idCarpeta = p_idCarpetaPadre) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta padre no existe.';
      ELSE
        INSERT INTO carpetas VALUES (default, p_idUsuario, p_idCarpetaPadre, p_Nombre, false);
      END IF;
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_CompartirCarpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_CompartirCarpeta`(
        IN p_idCarpeta INT,
        IN p_idUsuario INT
)
BEGIN

SET @@SESSION.max_sp_recursion_depth=25;

INSERT INTO carpetascompartidas(
        idCarpeta,
        idUsuario,
        fechaCompartida
) VALUES (
        p_idCarpeta,
        p_idUsuario,
        CURDATE()
);

CALL I_CompartirSubcarpetas(p_idCarpeta, p_idUsuario);

CALL I_CompartirTareasCarpeta(p_idCarpeta, p_idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_CompartirSubcarpetas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_CompartirSubcarpetas`(
	IN p_idCarpetaPadre INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idSubcarpeta INT;
DECLARE var_final_sc INT DEFAULT 0;

DECLARE c_subcarpetas CURSOR FOR SELECT idCarpeta FROM carpetas WHERE idCarpetaPadre = p_idCarpetaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_sc = 1;

OPEN c_subcarpetas;

FETCH c_subcarpetas INTO v_idSubcarpeta;
WHILE NOT var_final_sc = 1 DO

	CALL I_CompartirCarpeta(v_idSubcarpeta, p_idUsuario);

	FETCH c_subcarpetas INTO v_idSubcarpeta;
END WHILE;
CLOSE c_subcarpetas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_CompartirSubtareas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_CompartirSubtareas`(
	IN p_idTareaPadre INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idSubtarea INT;
DECLARE var_final_st INT DEFAULT 0;

DECLARE c_subtareas CURSOR FOR SELECT idTarea FROM tareas WHERE idTareaPadre = p_idTareaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_st = 1;

OPEN c_subtareas;

FETCH c_subtareas INTO v_idSubtarea;
WHILE NOT var_final_st = 1 DO

	CALL I_CompartirTarea(v_idSubtarea, p_idUsuario);

	FETCH c_subtareas INTO v_idSubtarea;
END WHILE;
CLOSE c_subtareas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_CompartirTarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_CompartirTarea`(
	IN p_idTarea INT,
	IN p_idUsuario INT
)
BEGIN

SET @@SESSION.max_sp_recursion_depth=25;

INSERT INTO tareascompartidas(
	idTarea,
	idUsuario,
	fechaCompartida
)
VALUES (
	p_idTarea,
	p_idUsuario,
	CURDATE()
);

CALL I_CompartirSubtareas(p_idTarea, p_idUsuario);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_CompartirTareasCarpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_CompartirTareasCarpeta`(
	IN p_idCarpeta INT,
	IN p_idUsuario INT
)
BEGIN

DECLARE v_idTarea INT;
DECLARE var_final_tc INT DEFAULT 0;

DECLARE c_tareas CURSOR FOR SELECT idTarea FROM tareas WHERE idCarpeta = p_idCarpeta AND idTareaPadre IS NULL;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_tc = 1;

OPEN c_tareas;

FETCH c_tareas INTO v_idTarea;
WHILE NOT var_final_tc = 1 DO

	CALL I_CompartirTarea(v_idTarea, p_idUsuario);

	FETCH c_tareas INTO v_idTarea;
END WHILE;
CLOSE c_tareas;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_Etiqueta` */;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb3 COLLATE utf8_general_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_Etiqueta`(
        IN p_idUsuario INT, 
        IN p_nombre VARCHAR(45)
)
BEGIN 
        INSERT INTO etiquetas(idUsuario,nombre) VALUES (p_idUsuario,p_nombre); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `bd_tareas` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `I_Subtarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_Subtarea`(
    in p_idUsuario int,
    in p_idTareaPadre int,
    in p_titulo varchar(100),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja')
    )
BEGIN
	IF( p_fechaVencimiento is NULL)
		THEN set p_fechaVencimiento = concat(curdate(),' 23:59:59');
        set p_fechaInicio = now();
	END IF;
	IF EXISTS(select * from tareas where titulo = p_titulo and idTareaPadre = p_idTareaPadre) 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo titulo y misma posicion';
	ELSEIF (p_titulo is null or p_titulo='') 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El titulo de la carpeta nos puede ser nulo o vacio';
    ELSEIF(p_fechaInicio < now())
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio es menor a la fecha en la que se creo la tarea';
    ELSEIF(p_fechaInicio > p_fechaVencimiento)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
    ELSEIF NOT EXISTS(select * from tareas where idTarea = p_idTareaPadre)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la tarea padre';
    ELSE
		select idCarpeta from tareas where idTarea = p_idTareaPadre into @v_carpeta;
		INSERT INTO tareas value
        (
        default,
        p_idUsuario,
        p_idTareaPadre,
		@v_carpeta,
        p_titulo,
        p_descripcion,
        p_fechaInicio,
        p_fechaVencimiento,
        p_prioridad,
        'No completado',
        false
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_Tarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_Tarea`(
    in p_idUsuario int,
    in p_idCarpeta int,
    in p_titulo varchar(100),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja')
    )
BEGIN
	IF( p_idCarpeta is NULL and p_fechaVencimiento is NULL)
		THEN set p_fechaVencimiento = concat(curdate(),' 23:59:59');
        set p_fechaInicio = now();
	END IF;
	IF EXISTS(select *from tareas where titulo = p_titulo and idUsuario = p_idUsuario and idCarpeta = p_idCarpeta) 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una tarea con el mismo titulo y misma posicion';
	ELSEIF (p_titulo is null or p_titulo='') 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El titulo de la tarea nos puede ser nulo o vacio';
    ELSEIF(p_fechaInicio < now())
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio es menor a la fecha en la que se creo la tarea';
    ELSEIF(p_fechaInicio > p_fechaVencimiento)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
    ELSE
		INSERT INTO tareas value
        (
        default,
        p_idUsuario,
        null,
        p_idCarpeta,
        p_titulo,
        p_descripcion,
        p_fechaInicio,
        p_fechaVencimiento,
        p_prioridad,
        'No completado',
        false
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_TareaEtiqueta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_TareaEtiqueta`(
        IN p_idEtiqueta INT,
        IN p_idTarea INT
)
BEGIN 
        INSERT INTO tareasetiquetas (idTarea,idEtiqueta) VALUES (p_idTarea,p_idEtiqueta); 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `I_Usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `I_Usuario`(
  IN p_correo VARCHAR(255),
  IN p_contrasena VARCHAR(255),
  IN p_nombre VARCHAR(255),
  IN p_apellido VARCHAR(255)
)
BEGIN
  IF p_correo IS NULL OR p_contraseña IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo y la contraseña son obligatorios.';
  ELSE
    IF EXISTS (SELECT idUsuario FROM usuarios WHERE correo = p_correo) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    ELSE
      INSERT INTO usuarios (correo, contrasena, nombre, apellido)
      VALUES (p_correo, p_contrasena, p_nombre, p_apellido);
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `U_Carpeta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `U_Carpeta`(
  IN p_idCarpeta INT,
  IN p_Nombre VARCHAR(255)
)
BEGIN
  -- Verificar que el ID de carpeta existe en la tabla de Carpetas
  IF NOT EXISTS (SELECT idCarpeta FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    -- Verificar que el nombre de la carpeta no esté en uso por otra carpeta
    IF EXISTS (SELECT nombre FROM carpetas WHERE nombre = p_Nombre) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de carpeta ya está en uso.';
    ELSE
      -- Actualizar el nombre de la subcarpeta
      UPDATE carpetas SET nombre = p_Nombre WHERE idCarpeta = p_idCarpeta;
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `U_CarpetaAPapelera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `U_CarpetaAPapelera`(
  IN p_idCarpeta INT
)
BEGIN

  IF NOT EXISTS (SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    
    UPDATE tareas SET EnPapelera = 1 WHERE idCarpeta = p_idCarpeta;

    UPDATE carpetas SET EnPapelera = 1 WHERE idCarpetaPadre = p_idCarpeta;

    UPDATE carpetas SET EnPapelera = 1 WHERE idCarpeta = p_idCarpeta;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `U_Subtarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `U_Subtarea`(
	in p_idTarea int,
    in p_idTareaPadre int,
    in p_titulo varchar(100),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja'),
    in p_estado ENUM('Completado','No completado')
)
BEGIN
  -- Verificar que el ID de tarea existe en la tabla de Tareas
  IF NOT EXISTS (SELECT * FROM Tareas WHERE idTarea = p_idTarea)
  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de tarea no existe.';
  ELSEIF NOT EXISTS (SELECT * FROM Tareas WHERE idTareaPadre = p_idTareaPadre)
  THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de la tarea padre no existe.';
  ELSE
    -- Si hay valore nulos
    IF(p_titulo is NULL)
    THEN set p_titulo = (select titulo from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    IF(p_descripcion is NULL)
    THEN set p_descripcion = (select descripcion from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    IF(p_fechaInicio is NULL)
    THEN set p_fechaInicio = (select fechaInicio from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    IF(p_fechaVencimiento is NULL)
    THEN set p_fechaVencimiento = (select fechaVencimiento from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    IF(p_prioridad is NULL)
    THEN set p_prioridad = (select prioridad from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    IF(p_estado is NULL)
    THEN set p_estado = (select estado from tarea where idTarea = p_idTarea and idTareaPadre = p_idTareaPadre);
    END IF;
    -- Si existe con mismo nombre
    IF EXISTS(select *from tareas where titulo = p_titulo) 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo titulo y misma posicion';
    ELSEIF (p_titulo is null or p_titulo='') 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El titulo de la carpeta nos puede ser nulo o vacio';
    ELSEIF(p_fechaInicio < now())
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio es menor a la fecha en la que se creo la tarea';
    ELSEIF(p_fechaInicio > p_fechaVencimiento)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
    ELSE
      -- Actualizar el nombre de la subcarpeta
      UPDATE tareas SET 
        titulo = p_titulo,
        descripcion = p_descripcion,
        fechaInicio = p_fechaInicio,
        fechaVencimiento = p_fechaVencimiento,
        prioridad= p_prioridad,
        estado = p_estado
        WHERE idTarea = p_idTarea and idTareaPadre = p_idTareaPadre;
    END IF;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `U_Tarea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `U_Tarea`(
	in p_idTarea int,
    in p_titulo varchar(100),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja'),
    in p_estado ENUM('Completado','No completado')
)
BEGIN
	SELECT enPapelera FROM tareas WHERE idTarea = p_idTarea INTO @papelera;
    -- Verificar que el ID de tarea existe en la tabla de Tareas
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea)
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de tarea no existe.';
    ELSE
        -- Si hay valore nulos
        IF(p_titulo is NULL)
            THEN set p_titulo = (select titulo from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_descripcion is NULL)
            THEN set p_descripcion = (select descripcion from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_fechaInicio is NULL)
            THEN set p_fechaInicio = (select fechaInicio from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_fechaVencimiento is NULL)
            THEN set p_fechaVencimiento = (select fechaVencimiento from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_prioridad is NULL)
            THEN set p_prioridad = (select prioridad from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_estado is NULL)
            THEN set p_estado = (select estado from tareas where idTarea = p_idTarea );
        END IF;
        -- Si existe con mismo nombre
        IF(p_fechaInicio > p_fechaVencimiento)
            THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
        ELSE
			IF (p_estado = 'Completado' AND (SELECT idCarpeta FROM tareas WHERE idTarea = p_idTarea) IS NULL)
				THEN SET @papelera = TRUE;
            END IF;
            -- Actualizar el nombre de la subcarpeta
            UPDATE tareas SET 
            titulo = p_titulo,
            descripcion = p_descripcion,
            fechaInicio = p_fechaInicio,
            fechaVencimiento = p_fechaVencimiento,
            prioridad= p_prioridad,
            estado = p_estado,
            enPapelera = @papelera
            WHERE idTarea = p_idTarea ;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `U_TareaAPapelera` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `U_TareaAPapelera`(
    IN p_idTarea INT
)
BEGIN
    -- Verificar si la tarea existe
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tarea inválida';
    ELSE
            -- Actualizar el nombre de la subcarpeta
			UPDATE tareas SET 
            enPapelera = true
			WHERE idTareaPadre = p_idTarea;
            
            UPDATE tareas SET 
            enPapelera = true
			WHERE idTarea = p_idTarea;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-08 23:20:58
