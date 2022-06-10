-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado` (
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` VALUES ('En proceso'),('Finalizado'),('Pendiente');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fase`
--

DROP TABLE IF EXISTS `fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fase` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProyecto` char(4) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Pendiente',
  `fecha_inicio` varchar(20) NOT NULL,
  `fecha_final` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProyecto_idx` (`idProyecto`),
  KEY `estado_idx` (`estado`),
  CONSTRAINT `estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`nombre`) ON DELETE CASCADE,
  CONSTRAINT `idProyecto` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fase`
--

LOCK TABLES `fase` WRITE;
/*!40000 ALTER TABLE `fase` DISABLE KEYS */;
INSERT INTO `fase` VALUES (33,'291','Fase 1','descripcion fase','Pendiente','2022-06-14','2022-06-15'),(34,'2012','fase 1','dgf','Pendiente','2022-06-08','2022-06-14'),(36,'284','fqse 3','dfbdfsb','Pendiente','2022-06-15','2022-06-21');
/*!40000 ALTER TABLE `fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_participantes`
--

DROP TABLE IF EXISTS `grupo_participantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_participantes` (
  `idProyecto` char(4) NOT NULL,
  `idUsuario` char(4) NOT NULL,
  KEY `uuaurioFK_idx` (`idUsuario`),
  KEY `osidjfoids_idx` (`idProyecto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_participantes`
--

LOCK TABLES `grupo_participantes` WRITE;
/*!40000 ALTER TABLE `grupo_participantes` DISABLE KEYS */;
INSERT INTO `grupo_participantes` VALUES ('123','9751'),('124','9751'),('5559','1124'),('5559','8674'),('933','5996'),('933','5996'),('291','5130'),('7010','9751'),('2012','4147'),('2012','8259'),('2012','8259'),('284','2479');
/*!40000 ALTER TABLE `grupo_participantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo_participantes_fase`
--

DROP TABLE IF EXISTS `grupo_participantes_fase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo_participantes_fase` (
  `idProyecto` char(4) NOT NULL,
  `idUsuario` char(4) NOT NULL,
  `idFase` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo_participantes_fase`
--

LOCK TABLES `grupo_participantes_fase` WRITE;
/*!40000 ALTER TABLE `grupo_participantes_fase` DISABLE KEYS */;
INSERT INTO `grupo_participantes_fase` VALUES ('5559','1124',6),('5559','8674',6),('291','5130',33),('284','2479',35),('284','2479',36);
/*!40000 ALTER TABLE `grupo_participantes_fase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyecto` (
  `id` char(4) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente',
  `tipo` varchar(15) NOT NULL,
  `idDirector` char(4) NOT NULL,
  `fechaInicio` varchar(20) NOT NULL,
  `fechaFinal` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idDirector_idx` (`idDirector`),
  KEY `estado_idx` (`estado`),
  KEY `TipoProyecto_idx` (`tipo`),
  CONSTRAINT `estadopro` FOREIGN KEY (`estado`) REFERENCES `estado` (`nombre`) ON DELETE CASCADE,
  CONSTRAINT `idDirector` FOREIGN KEY (`idDirector`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  CONSTRAINT `TipoProyecto` FOREIGN KEY (`tipo`) REFERENCES `tipo` (`nombre`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyecto`
--

LOCK TABLES `proyecto` WRITE;
/*!40000 ALTER TABLE `proyecto` DISABLE KEYS */;
INSERT INTO `proyecto` VALUES ('2012','proyecto 1','descripcn','Pendiente','Personal','8259','2022-06-08','2022-06-15'),('284','proyecto 1','dlkf','En proceso','Personal','2479','2022-06-15','2022-06-22'),('291','Proyecto prueba','descripcion del proyecto','En proceso','Estudios','5130','2022-06-10','2022-06-17'),('7010','Proyecto 6','de','Pendiente','Personal','9751','2022-06-14','2022-06-30'),('8082','Proyecto 1','descripcion','Pendiente','Estudios','3510','2022-06-08','2022-06-23'),('933','Proyecto 1','descripcion','Pendiente','Estudios','1686','2022-06-24','2022-07-02'),('9770','proyecto 2','dfhgfdhgf','Pendiente','Personal','9751','2022-05-29','2022-05-28');
/*!40000 ALTER TABLE `proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reclamacion`
--

DROP TABLE IF EXISTS `reclamacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reclamacion` (
  `id` char(4) NOT NULL,
  `idProyecto_re` char(4) DEFAULT NULL,
  `nombre` varchar(15) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `idUsuario_re` char(4) NOT NULL,
  `estado` varchar(45) DEFAULT 'Pendiente',
  PRIMARY KEY (`id`),
  KEY `idUsuario_idx` (`idUsuario_re`),
  KEY `estadoRecl_idx` (`estado`),
  KEY `ProyectoRecla_idx` (`idProyecto_re`),
  CONSTRAINT `estadoRecl` FOREIGN KEY (`estado`) REFERENCES `estado` (`nombre`) ON DELETE CASCADE,
  CONSTRAINT `idUsu` FOREIGN KEY (`idUsuario_re`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reclamacion`
--

LOCK TABLES `reclamacion` WRITE;
/*!40000 ALTER TABLE `reclamacion` DISABLE KEYS */;
INSERT INTO `reclamacion` VALUES ('1456',NULL,'dfhgfh','Introduce el texto aqudgfhdfhÃ­...','9751','Pendiente'),('1647',NULL,'thsrth','Introduce el texto aqushsrthstrthÃ­...','9751','Pendiente'),('2530',NULL,'dsfhfgh','Introduce el texto aquÃ­...gfhshsghsf','9751','Pendiente'),('3465',NULL,'dfhfsgh','Introduce el texto aquÃ­...hsfdhsfd','9751','Pendiente'),('4198',NULL,'','Introduce el texto aquÃ­...','9751','Pendiente'),('5608',NULL,'thsrth','Introduce el texto aqushsrthstrthÃ­...','9751','Pendiente'),('5861',NULL,'rsthst','Introduce el texto aquÃ­..thsrths.','9751','Pendiente'),('5874',NULL,'thsrth','Introduce el texto aqushsrthstrthÃ­...','9751','Pendiente'),('6573',NULL,'reclamaciÃ³n 2','Introduce el texto aquÃ­...sndldsk','9751','Pendiente'),('67',NULL,'fdfbf','Introduce el texto aquÃ­...bfbfds','9751','Pendiente'),('6727',NULL,'dfhgfh','Introduce el texto aqudgfhdfhÃ­...','9751','Pendiente'),('6839',NULL,'Reclamacion','DescripciÃ³n del problema','5130','Pendiente'),('7058',NULL,'xfgfdf','Introduce el texto aqufghgfÃ­...','9751','Pendiente'),('7305',NULL,'thsrth','Introduce el texto aqushsrthstrthÃ­...','9751','Pendiente'),('7769',NULL,'fdfbf','Introduce el texto aquÃ­...bfbfds','9751','Pendiente'),('8281',NULL,'dfhgfh','Introduce el texto aqudgfhdfhÃ­...','9751','Pendiente'),('9050',NULL,'thsrth','Introduce el texto aqushsrthstrthÃ­...','9751','Pendiente'),('9495',NULL,'sojdfdsf','dgdfgdfgd','9202','Pendiente'),('9899',NULL,'','Introduce el texto aquÃ­...','9751','Pendiente');
/*!40000 ALTER TABLE `reclamacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarea` (
  `idTarea` int NOT NULL AUTO_INCREMENT,
  `idFase` int NOT NULL,
  `idProyecto` char(4) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL DEFAULT 'Pendiente',
  `idUsuario` char(4) NOT NULL,
  `fechaEntrega` varchar(20) NOT NULL,
  PRIMARY KEY (`idTarea`),
  KEY `idFase_idx` (`idFase`),
  KEY `idProyecto_idx` (`idProyecto`),
  KEY `estado_idx` (`estado`),
  KEY `idParticipante_idx` (`idUsuario`),
  CONSTRAINT `estad` FOREIGN KEY (`estado`) REFERENCES `estado` (`nombre`) ON DELETE CASCADE,
  CONSTRAINT `idFaseTrea` FOREIGN KEY (`idFase`) REFERENCES `fase` (`id`) ON DELETE CASCADE,
  CONSTRAINT `idProyect` FOREIGN KEY (`idProyecto`) REFERENCES `proyecto` (`id`) ON DELETE CASCADE,
  CONSTRAINT `idUsuari` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (32,33,'291','Tarea 1','ldfjhgj','Finalizado','5130','2022-06-15'),(35,36,'284','trea ','fbsdf','Pendiente','2479','2022-06-21');
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `nombre` varchar(15) NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES ('Estudios'),('Personal'),('Trabajo');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` char(4) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `contraseña` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('1686','Nombre','Apellido1 Apellido2','email@email.com','fbc71ce36cc20790f2eeed2197898e71'),('2479','Mel','Rodriguez','gmail@','fbc71ce36cc20790f2eeed2197898e71'),('3510','nombre','apelli','mail','fbc71ce36cc20790f2eeed2197898e71'),('4147','Antonio','Hernandez','em','c893bad68927b457dbed39460e6afd62'),('5130','Melissa','Rodriguez','prueba@email.com','c893bad68927b457dbed39460e6afd62'),('5996','Maria','Delgado','sis','fb5be496b0b960f3eee21dbdd24f9169'),('8259','Mel','Apellido','mail@','fbc71ce36cc20790f2eeed2197898e71'),('8289','nom','apellido','mail@gmail.com','fbc71ce36cc20790f2eeed2197898e71'),('8701','Melissa','Rodriguez','pruebam@gmail.com','fbc71ce36cc20790f2eeed2197898e71'),('9202','Mel','dfhdfg','mel@g','fbc71ce36cc20790f2eeed2197898e71'),('9751','Melissa','Rodriguez','si','ac5585d98646d255299c359140537783'),('9985','Carlo','Ser','lkm','047ecab4065ce2e1fbcaf7f981f5dcf6');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-09 19:03:00
