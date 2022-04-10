CREATE DATABASE  IF NOT EXISTS `club_libro_schema` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `club_libro_schema`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: club_libro_schema
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `libros`
--

DROP TABLE IF EXISTS `libros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `thoughts` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `usuario_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd32ydqw52st17vxwqkxa8kckk` (`usuario_id`),
  CONSTRAINT `FKd32ydqw52st17vxwqkxa8kckk` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros`
--

LOCK TABLES `libros` WRITE;
/*!40000 ALTER TABLE `libros` DISABLE KEYS */;
INSERT INTO `libros` VALUES (1,'NK Jemisin','2022-04-09 22:28:07.109000','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat accusamus, in incidunt fugiat esse, dolorum expedita placeat qui beatae tempore quo similique obcaecati. Necessitatibus eligendi sed sequi delectus similique quas!','The Fifth Season',NULL,1),(5,'Haruki Murakami','2022-04-09 22:48:51.783000','How I felt reading this book, can be summed up by a quote from the book: \"And once the storm is over, you won\'t remember how you made it through, how you managed to survive. You won\'t even be sure, whether the storm is really over. But one thing is certain. When you come out of the storm, you won\'t be the same person who walked in. That\'s what this storm\'s all about.','Kafka on the Shore',NULL,2),(22,'James SA Corey','2022-04-10 00:23:26.751000','This was a throroughly enojoyable read! I cannpt wait to read the next book in the series.','Leviathan Wakes',NULL,3),(23,'Ta-Nehisi Coates','2022-04-10 00:24:37.731000','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat accusamus, in incidunt fugiat esse, dolorum expedita placeat qui beatae tempore quo similique obcaecati. Necessitatibus eligendi sed sequi delectus similique quas!','Walter Dancer',NULL,1),(28,'Kurt Vonnegut','2022-04-10 00:30:42.363000','Lorem ipsum dolor, sit amet consectetur adipisicing elit. Repellat accusamus, in incidunt fugiat esse, dolorum expedita placeat qui beatae tempore quo similique obcaecati. Necessitatibus eligendi sed sequi delectus similique quas!','Mother Night',NULL,2);
/*!40000 ALTER TABLE `libros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'2022-04-09 22:24:54.976000','marcus@gmail.com','Marcus','$2a$10$O/Eee0eDCL4yv24CgG7XG.xMN3NZASuOoaVpC1WsL9xAQE6GUmkDi',NULL),(2,'2022-04-09 22:31:08.686000','bella@gmail.com','Bella','$2a$10$aFtGsVR3gQtH5.hdlMTTHubT5EicpyyQszNKX288dTdzRawxNX8mW',NULL),(3,'2022-04-09 23:43:27.744000','astrid@gmail.com','Astrid','$2a$10$eM/spI/ozmAoIwr/2Jj9s.y5DZmF4jcta.kKr8LXjl.y6wH40VJuW',NULL);
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

-- Dump completed on 2022-04-10  0:36:18
