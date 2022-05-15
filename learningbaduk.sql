-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: learningbadukdb
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardId` int NOT NULL AUTO_INCREMENT,
  `boardTitle` varchar(45) NOT NULL,
  `boardContent` varchar(45) NOT NULL,
  `boardDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boardCategory` varchar(45) NOT NULL,
  `boardReport` int NOT NULL DEFAULT '0',
  `userId` varchar(45) NOT NULL,
  `boardHit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`boardId`),
  KEY `FK_board_userId_user_userId` (`userId`),
  CONSTRAINT `FK_board_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'endGame1','endGame1','2022-05-10 19:17:30','endGame',0,'userId1',0);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `boardview`
--

DROP TABLE IF EXISTS `boardview`;
/*!50001 DROP VIEW IF EXISTS `boardview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `boardview` AS SELECT 
 1 AS `boardId`,
 1 AS `boardTitle`,
 1 AS `boardContent`,
 1 AS `boardDate`,
 1 AS `boardCategory`,
 1 AS `boardReport`,
 1 AS `userId`,
 1 AS `boardHit`,
 1 AS `commentCount`,
 1 AS `likeCount`,
 1 AS `dislikeCount`,
 1 AS `userNickname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `commentContent` varchar(45) NOT NULL,
  `commentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(45) NOT NULL,
  `boardId` int NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_comment_boardId_board_boardId` (`boardId`),
  KEY `FK_comment_userId_user_userId` (`userId`),
  CONSTRAINT `FK_comment_boardId_board_boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'endGameComment1','2022-05-10 19:18:01','userId1',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dislikes` (
  `dislikeId` int NOT NULL AUTO_INCREMENT,
  `boardId` int NOT NULL,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`dislikeId`),
  KEY `dislikes_ibfk_1` (`userId`),
  KEY `dislikes_ibfk_2` (`boardId`),
  CONSTRAINT `dislikes_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dislikes_ibfk_2` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `likeId` int NOT NULL AUTO_INCREMENT,
  `boardId` int NOT NULL,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`likeId`),
  KEY `FK_like_boardId_board_boardId` (`boardId`),
  KEY `FK_like_userId_user_userId` (`userId`),
  CONSTRAINT `FK_like_boardId_board_boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_like_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myboard`
--

DROP TABLE IF EXISTS `myboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myboard` (
  `myboardId` int NOT NULL AUTO_INCREMENT,
  `myboardTitle` varchar(45) NOT NULL,
  `myboardContent` varchar(45) NOT NULL,
  `myboardDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`myboardId`),
  KEY `FK_myboard_userId_user_userId` (`userId`),
  CONSTRAINT `FK_myboard_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myboard`
--

LOCK TABLES `myboard` WRITE;
/*!40000 ALTER TABLE `myboard` DISABLE KEYS */;
/*!40000 ALTER TABLE `myboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `userId` varchar(45) NOT NULL,
  `userRole` varchar(45) NOT NULL DEFAULT 'member',
  PRIMARY KEY (`userId`),
  CONSTRAINT `FK_user-role` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('userId1','admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` varchar(45) NOT NULL,
  `userPassword` varchar(45) NOT NULL,
  `userNickname` varchar(45) NOT NULL,
  `userEmail` varchar(45) NOT NULL,
  `userProfileImg` varchar(80) DEFAULT NULL,
  `userReport` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('userId1','userPassword1','userNickname1','userEmail1',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `boardview`
--

/*!50001 DROP VIEW IF EXISTS `boardview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`namix`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `boardview` AS select `board`.`boardId` AS `boardId`,`board`.`boardTitle` AS `boardTitle`,`board`.`boardContent` AS `boardContent`,`board`.`boardDate` AS `boardDate`,`board`.`boardCategory` AS `boardCategory`,`board`.`boardReport` AS `boardReport`,`board`.`userId` AS `userId`,`board`.`boardHit` AS `boardHit`,(select count(0) from `comment` where (`comment`.`boardId` = `board`.`boardId`)) AS `commentCount`,(select count(0) from `likes` where (`likes`.`boardId` = `board`.`boardId`)) AS `likeCount`,(select count(0) from `dislikes` where (`dislikes`.`boardId` = `board`.`boardId`)) AS `dislikeCount`,(select `user`.`userNickname` from `user` where (`user`.`userId` = 'userId1')) AS `userNickname` from `board` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-15 22:54:40
