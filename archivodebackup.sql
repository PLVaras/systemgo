-- MySQL dump 10.13  Distrib 5.5.32, for Win32 (x86)
--
-- Host: localhost    Database: sartic
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Electrica'),(2,'Electronica'),(3,'Mecanica');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destino` (
  `iddestino` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `idescuela` int(11) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `puesto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddestino`),
  KEY `fk_destino_usuario1_idx` (`idusuario`),
  KEY `fk_destino_escuela1_idx` (`idescuela`),
  CONSTRAINT `fk_destino_escuela1` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_destino_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino`
--

LOCK TABLES `destino` WRITE;
/*!40000 ALTER TABLE `destino` DISABLE KEYS */;
INSERT INTO `destino` VALUES (8,7,6,'2013-03-01','Mañana','Tecnico'),(9,2,3,'2014-09-10','Mañana','tecnico');
/*!40000 ALTER TABLE `destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `escuela`
--

DROP TABLE IF EXISTS `escuela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `escuela` (
  `idescuela` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `director` varchar(45) DEFAULT NULL,
  `vicedirector` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`idescuela`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `escuela`
--

LOCK TABLES `escuela` WRITE;
/*!40000 ALTER TABLE `escuela` DISABLE KEYS */;
INSERT INTO `escuela` VALUES (3,'Esc. N°409','','','(380)4431163',''),(4,'Esc. N°408 \"Faldeo del Velazco Sur\"','','','',''),(5,'Esc. N°398 “Monseños Angelelli”','','','',''),(6,'Esc. N°397 “Merceditas de San Martin”','NEIRA Norma Cristina','','(380)4439212','merceditasdesanmartin@gmail.com'),(7,'Esc. N°408 \"Faldeo del Velazco Sur\"','','','',''),(9,'ESC.N°250 “BARTOLOME MITRE”','','','',''),(10,'ESCUELA DE GESTIÓN COMUNITARIA”','','','',''),(11,'ESC.N°190 “GRAL.SAN MARTIN”','','','',''),(12,'ESC.N°287 “MAESTRO ARMANDO HERRERA ROBLEDO”','','','',''),(13,'ESC.N°039 “TIMOTEO GORDILLO”','','','',''),(14,'ESC.N°175 “GRAL.BELGRANO”','','','',''),(15,'ESC.N°177 “DR.MARIANO MORENO”','','','',''),(16,'ESC.N°251 “CEFERINO NAMUNCURA”','','','',''),(17,'INSTITUTO PRIVADO “MANUEL BELGRANO”','','','',''),(18,'ESC.N°365 “PROVINCIA DE MISIONES”','','','',''),(19,'ESC.N°369 “MAESTRO HUMBERTO PEREYRA”','','','',''),(20,'ESC.N°127 “CAPITAL FEDERAL”','','','',''),(21,'ESC.N°280 “TAMBOR DE TACUARI”','','','',''),(22,'ESC.N°361 “EXPEDICION AUXILIAR ZELADA DAVILA”','','','',''),(23,'ESC.N°252 “BERNARDINO RIVADAVIA”','','','',''),(24,'ESC.N°249 “GENERAL MANUEL BELGRANO”','','','',''),(25,'ESC.N°191 “SARMIENTO”','','','',''),(26,'ESC.N°192 “DR.NICOLAS AVELLANEDA”','','','',''),(27,'Esc. N°248 \"Francisca Geronima Barros\"','NUÑEZ Azucena','MILLICAY Lisandro',NULL,'fgeronimabarros@hotmail.com');
/*!40000 ALTER TABLE `escuela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `idinsumo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `idproveedor` int(11) DEFAULT NULL,
  `idrecurso` int(11) DEFAULT NULL,
  PRIMARY KEY (`idinsumo`),
  KEY `fk_insumo_categoria1_idx` (`idcategoria`),
  KEY `fk_insumo_proveedor1_idx` (`idproveedor`),
  KEY `fk_insumo_recurso1_idx` (`idrecurso`),
  CONSTRAINT `fk_insumo_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_proveedor1` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_insumo_recurso1` FOREIGN KEY (`idrecurso`) REFERENCES `recurso` (`idrecurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES (1,'Motor',1,1,1),(2,'Duinobot',1,1,1),(3,'Pila',1,1,1),(4,'Portapila',1,1,1),(5,'Control Remoto',1,1,1),(6,'Cable Motor',1,1,1),(7,'Cable Sensor',1,1,1),(8,'Cable USB',1,1,1),(9,'Optoacoplador',2,1,1),(10,'S. de Sonido',2,1,1),(11,'Pulsador',2,1,1),(12,'Led',2,1,1),(13,'Fotorresistor',2,1,1),(14,'Destornillador',3,1,1),(15,'Llave Allen',3,1,1),(16,'Ejes',3,1,1),(17,'Caja de Tornillos',3,1,1),(18,'Chasis',3,1,1),(19,'Rueda',3,1,1),(20,'sensor ultrasonico',1,2,1),(21,'led rgb',2,1,2);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `iditem` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `faltantes` int(11) DEFAULT NULL,
  `rotos` int(11) DEFAULT NULL,
  `buenos` int(11) DEFAULT NULL,
  `idinsumo` int(11) DEFAULT NULL,
  `iddestino` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `transaccion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`iditem`),
  KEY `fk_item_insumo1_idx` (`idinsumo`),
  KEY `fk_item_destino1_idx` (`iddestino`),
  KEY `fk_item_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_item_destino1` FOREIGN KEY (`iddestino`) REFERENCES `destino` (`iddestino`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_insumo1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_item_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (146,10,0,0,10,1,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(147,10,0,0,10,2,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(148,10,0,0,10,3,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(149,10,0,0,10,4,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(150,10,0,0,10,5,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(151,10,0,0,10,6,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(152,10,0,0,10,7,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(153,10,0,0,10,8,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(154,10,0,0,10,9,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(155,10,0,0,10,10,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(156,10,0,0,10,11,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(157,10,0,0,10,12,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(158,10,5,0,10,13,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(159,10,0,0,10,14,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(160,10,0,0,10,15,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(161,10,0,0,10,16,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(162,10,0,0,10,17,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(163,10,0,0,10,18,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(164,10,0,0,10,19,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(165,20,2,0,20,1,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(166,20,0,0,20,2,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(167,20,0,15,20,3,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(168,20,0,0,20,4,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(169,20,0,0,20,5,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(170,20,0,0,20,6,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(171,20,0,0,20,7,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(172,20,5,0,20,8,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(173,20,0,0,20,9,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(174,20,0,0,20,10,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(175,20,0,0,20,11,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(176,20,0,0,20,12,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(177,20,0,0,20,13,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(178,20,0,0,20,14,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(179,20,0,0,20,15,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(180,20,0,0,20,16,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(181,20,0,0,20,17,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(182,20,0,0,20,18,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9'),(183,20,0,0,20,19,8,NULL,'85271d1be8f8c697d1151a341f2fa5a9');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `activo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_login_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_login_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,'emmanuel','admin',1,1),(2,'jorge','admin',2,1),(4,'mario','123',7,1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajeria`
--

DROP TABLE IF EXISTS `mensajeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajeria` (
  `idmensajeria` int(11) NOT NULL AUTO_INCREMENT,
  `quien` int(11) DEFAULT NULL,
  `aquien` int(11) DEFAULT NULL,
  `mensaje` text,
  `asunto` varchar(80) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `visto` int(11) DEFAULT NULL,
  `papelera` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmensajeria`),
  KEY `fk_mensajeria_usuario1_idx` (`quien`),
  CONSTRAINT `fk_mensajeria_usuario1` FOREIGN KEY (`quien`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajeria`
--

LOCK TABLES `mensajeria` WRITE;
/*!40000 ALTER TABLE `mensajeria` DISABLE KEYS */;
INSERT INTO `mensajeria` VALUES (32,2,7,'sd','sds','2014-09-14',0,0);
/*!40000 ALTER TABLE `mensajeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `idpedidos` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `idinsumo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`idpedidos`),
  KEY `fk_pedidos_usuario1_idx` (`idusuario`),
  KEY `fk_pedidos_insumo1_idx` (`idinsumo`),
  CONSTRAINT `fk_pedidos_insumo1` FOREIGN KEY (`idinsumo`) REFERENCES `insumo` (`idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (2,1,1,2,'pedido de administrador','2014-09-09'),(3,1,8,5,'pedido de administrador','2014-09-09'),(4,7,13,5,'pedido del Tecnico','2014-09-09');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegio`
--

DROP TABLE IF EXISTS `privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegio` (
  `idprivilegio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprivilegio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio`
--

LOCK TABLES `privilegio` WRITE;
/*!40000 ALTER TABLE `privilegio` DISABLE KEYS */;
INSERT INTO `privilegio` VALUES (1,'Tecnico'),(2,'Administrador');
/*!40000 ALTER TABLE `privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Robot-Group','','info@robotgroup.com'),(2,'Multiplo.org','','client@multiplo.com'),(3,'Makeblock','','info@makeblock.cc'),(4,'Epson Argentina','','clinfo@epson.com');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso` (
  `idrecurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrecurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,'Kit-Starter'),(2,'kit-Advanced'),(3,'Audiovisuales1'),(4,'Audiovisuales2');
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_has_destino`
--

DROP TABLE IF EXISTS `recurso_has_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso_has_destino` (
  `recurso` int(11) DEFAULT NULL,
  `destino` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idrecdes` int(11) NOT NULL AUTO_INCREMENT,
  `asignado` int(11) DEFAULT NULL,
  `transaccion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idrecdes`),
  KEY `fk_recurso_has_destino_destino1_idx` (`destino`),
  KEY `fk_recurso_has_destino_recurso1_idx` (`recurso`),
  CONSTRAINT `fk_recurso_has_destino_destino1` FOREIGN KEY (`destino`) REFERENCES `destino` (`iddestino`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recurso_has_destino_recurso1` FOREIGN KEY (`recurso`) REFERENCES `recurso` (`idrecurso`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_has_destino`
--

LOCK TABLES `recurso_has_destino` WRITE;
/*!40000 ALTER TABLE `recurso_has_destino` DISABLE KEYS */;
INSERT INTO `recurso_has_destino` VALUES (1,8,10,8,1,'85271d1be8f8c697d1151a341f2fa5a9'),(1,8,10,9,0,'b94be19391811d032a419c1dbb167492'),(3,9,20,10,0,'5c8f74410a0f83f82a7b2e6031f1d05b');
/*!40000 ALTER TABLE `recurso_has_destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_has_usuario`
--

DROP TABLE IF EXISTS `recurso_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recurso_has_usuario` (
  `recurso` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `idrecuser` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_entrega` date DEFAULT NULL,
  `fecha_devolucion` date DEFAULT NULL,
  `asignado` int(11) DEFAULT NULL,
  `transaccion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`idrecuser`),
  KEY `fk_recurso_has_usuario_usuario1_idx` (`usuario`),
  KEY `fk_recurso_has_usuario_recurso1_idx` (`recurso`),
  CONSTRAINT `fk_recurso_has_usuario_recurso1` FOREIGN KEY (`recurso`) REFERENCES `recurso` (`idrecurso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recurso_has_usuario_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_has_usuario`
--

LOCK TABLES `recurso_has_usuario` WRITE;
/*!40000 ALTER TABLE `recurso_has_usuario` DISABLE KEYS */;
INSERT INTO `recurso_has_usuario` VALUES (3,7,1,1,'2014-09-08','2014-01-13',1,'a1c2c09a69ee680d12c86898f154947b');
/*!40000 ALTER TABLE `recurso_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `idtarea` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `lugar` varchar(80) DEFAULT NULL,
  `descripcion` text,
  `iddestino` int(11) DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`idtarea`),
  KEY `fk_tarea_destino1_idx` (`iddestino`),
  CONSTRAINT `fk_tarea_destino1` FOREIGN KEY (`iddestino`) REFERENCES `destino` (`iddestino`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (4,'Taller de Kodu','2014-09-11','Paseo Cultural','Taller destinado a Alumnos del 7° Escuela Pio XII',8,'10:00:00','12:00:00'),(5,'taller de php','2014-09-13','lab de escuela','taller...',8,'10:00:00','12:00:00'),(6,'programacion','2014-10-24','centro','solo master',9,'12:00:00','15:00:00');
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellido` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `bloqueo` int(11) DEFAULT NULL,
  `idprivilegio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_privilegio1_idx` (`idprivilegio`),
  CONSTRAINT `fk_usuario_privilegio1` FOREIGN KEY (`idprivilegio`) REFERENCES `privilegio` (`idprivilegio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Emmanuel','Sarquis','26731952','2014-08-29','Av Facundo Quiroga',27,'varon',0,2),(2,'Jorge Antonio','Cabrera','27161335','1979-02-28','San Francisco Km 5',35,'mujer',0,2),(7,'Mario Cesar','Gonzalez','36035029','1990-12-22','Rivadavia Nº 2146',23,'varon',0,1);
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

-- Dump completed on 2014-11-12 17:50:09
