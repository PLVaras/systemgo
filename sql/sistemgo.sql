/*
Navicat MySQL Data Transfer

Source Server         : conexion
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : sistemgo

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2014-11-20 11:02:23
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `asistencia`
-- ----------------------------
DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `idasistencia` int(11) NOT NULL AUTO_INCREMENT,
  `asistencia` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idasistencia`),
  KEY `fk_asistencia_usuario2` (`id_usuario`),
  CONSTRAINT `fk_asistencia_usuario2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of asistencia
-- ----------------------------

-- ----------------------------
-- Table structure for `calificaciones`
-- ----------------------------
DROP TABLE IF EXISTS `calificaciones`;
CREATE TABLE `calificaciones` (
  `id_calificaciones` int(11) NOT NULL AUTO_INCREMENT,
  `id_materias` int(11) DEFAULT NULL,
  `Calificaciones` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_calificaciones`),
  KEY `fk_Calificaciones_Materias1_idx` (`id_materias`),
  CONSTRAINT `fk_Calificaciones_Materias1` FOREIGN KEY (`id_materias`) REFERENCES `materias` (`id_materias`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of calificaciones
-- ----------------------------

-- ----------------------------
-- Table structure for `cursos`
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `idCursos` int(11) NOT NULL AUTO_INCREMENT,
  `id_legajo` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCursos`),
  KEY `fk_Cursos_Legajo1_idx` (`id_legajo`),
  CONSTRAINT `fk_Cursos_Legajo1` FOREIGN KEY (`id_legajo`) REFERENCES `legajo` (`id_legajo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cursos
-- ----------------------------

-- ----------------------------
-- Table structure for `division`
-- ----------------------------
DROP TABLE IF EXISTS `division`;
CREATE TABLE `division` (
  `id_division` int(11) NOT NULL AUTO_INCREMENT,
  `id_curso` int(11) DEFAULT NULL,
  `nombre_division` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_division`),
  KEY `fk_Division_Cursos1_idx` (`id_curso`),
  CONSTRAINT `fk_Division_Cursos1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`idCursos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of division
-- ----------------------------

-- ----------------------------
-- Table structure for `legajo`
-- ----------------------------
DROP TABLE IF EXISTS `legajo`;
CREATE TABLE `legajo` (
  `id_legajo` int(11) NOT NULL AUTO_INCREMENT,
  `Num_Leg` varchar(45) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL,
  `Fecha_Egresol` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_legajo`),
  KEY `fk_Legajo_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_Legajo_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of legajo
-- ----------------------------

-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `idlogin` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`idlogin`),
  KEY `fk_Login_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_Login_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', '123456', '30311963', '1');
INSERT INTO `login` VALUES ('2', '123456789', '30517054', '2');

-- ----------------------------
-- Table structure for `materias`
-- ----------------------------
DROP TABLE IF EXISTS `materias`;
CREATE TABLE `materias` (
  `id_materias` int(11) NOT NULL AUTO_INCREMENT,
  `id_division` int(11) DEFAULT NULL,
  `nombre_materia` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_materias`),
  KEY `fk_Materias_Division1_idx` (`id_division`),
  CONSTRAINT `fk_Materias_Division1` FOREIGN KEY (`id_division`) REFERENCES `division` (`id_division`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of materias
-- ----------------------------

-- ----------------------------
-- Table structure for `tipo_usuario`
-- ----------------------------
DROP TABLE IF EXISTS `tipo_usuario`;
CREATE TABLE `tipo_usuario` (
  `idTipo_Usuario` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_Usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_usuario
-- ----------------------------
INSERT INTO `tipo_usuario` VALUES ('1', 'Administrador');
INSERT INTO `tipo_usuario` VALUES ('2', 'Alumno');
INSERT INTO `tipo_usuario` VALUES ('3', 'Docente');
INSERT INTO `tipo_usuario` VALUES ('4', 'Tutor');

-- ----------------------------
-- Table structure for `tutor`
-- ----------------------------
DROP TABLE IF EXISTS `tutor`;
CREATE TABLE `tutor` (
  `idTutor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idTutor`),
  KEY `fk_Tutor_usuario1_idx` (`idusuario`),
  CONSTRAINT `fk_Tutor_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tutor
-- ----------------------------

-- ----------------------------
-- Table structure for `usuario`
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `idprivilegio` int(11) DEFAULT NULL,
  `domicilio` varchar(60) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_Tipo_Usuario1_idx` (`idprivilegio`),
  CONSTRAINT `fk_usuario_Tipo_Usuario1` FOREIGN KEY (`idprivilegio`) REFERENCES `tipo_usuario` (`idTipo_Usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO `usuario` VALUES ('1', 'Pedro', 'Varas', '1', 'Ortiz de Ocampo 1026', '4463957');
INSERT INTO `usuario` VALUES ('2', 'Andrea', 'Gonzalez', '3', 'Olsacher 790', '4658974');
