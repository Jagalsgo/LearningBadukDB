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
  `boardContent` varchar(2048) NOT NULL,
  `boardDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boardCategory` varchar(45) NOT NULL,
  `boardReport` int NOT NULL DEFAULT '0',
  `userId` varchar(45) NOT NULL,
  `boardHit` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`boardId`),
  KEY `FK_board_userId_user_userId` (`userId`),
  KEY `FK_boardCategory_idx` (`boardCategory`),
  CONSTRAINT `FK_board_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_boardCategory` FOREIGN KEY (`boardCategory`) REFERENCES `category` (`boardCategory`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (30,'sdv','<p><img class=\"image_resized\" style=\"width:27.4%;\" src=\"/img/e0bb2fab-0eb1-41fd-9979-d35b09014cf7\"></p>','2022-06-05 16:03:52','endGameBoard',0,'a',2),(31,'mkaldsvn','<p>lknskva</p>','2022-06-06 18:45:02','endGameBoard',0,'userId4',2),(37,'1','<p>1</p>','2022-06-12 16:26:03','endGameBoard',0,'a',2),(38,'2','<p>2</p>','2022-06-12 16:26:22','endGameBoard',0,'a',1),(39,'3dsf','<p>3</p>','2022-06-12 16:26:33','endGameBoard',0,'a',1),(40,'4','<p>4</p>','2022-06-12 16:26:56','endGameBoard',0,'a',0),(41,'4','<p>4</p>','2022-06-12 16:26:56','endGameBoard',0,'a',1),(42,'5','<p>5</p>','2022-06-12 16:27:05','endGameBoard',0,'a',1),(48,'2222','<p>2222</p>','2022-06-12 16:43:09','endGameBoard',0,'a',1),(49,'2222hkhskd','<p>jkbdsvjkb2222</p>','2022-06-12 16:43:17','endGameBoard',0,'a',2),(50,'test','<p>teests</p>','2022-06-12 19:46:54','endGameBoard',1,'a',2),(51,'test dfsdfklj','<p>teststsetfd</p>','2022-06-22 20:03:28','endGameBoard',0,'idid12',2),(53,'write test','<p>test</p>','2022-06-23 16:19:53','endGameBoard',0,'idid12',1),(54,'just','<p>just</p>','2022-06-25 14:23:39','endGameBoard',0,'idid11',1);
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
 1 AS `userNickname`,
 1 AS `imgPath`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `boardCategory` varchar(45) NOT NULL,
  PRIMARY KEY (`boardCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('endGameBoard'),('freeBoard'),('noticeBoard'),('openingBoard'),('patternBoard'),('quetionBoard'),('ruleBoard'),('scheduleBoard');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `commentContent` varchar(2048) NOT NULL,
  `commentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(45) NOT NULL,
  `boardId` int NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `FK_comment_boardId_board_boardId` (`boardId`),
  KEY `FK_comment_userId_user_userId` (`userId`),
  CONSTRAINT `FK_comment_boardId_board_boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (22,'a','2022-06-06 19:25:23','a',31),(23,'sdvnl','2022-06-11 14:51:43','a',31),(27,'디스','2022-06-12 20:35:25','a',30),(31,'njksv','2022-06-17 13:57:11','idid12',30);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `commentview`
--

DROP TABLE IF EXISTS `commentview`;
/*!50001 DROP VIEW IF EXISTS `commentview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `commentview` AS SELECT 
 1 AS `commentId`,
 1 AS `commentContent`,
 1 AS `commentDate`,
 1 AS `userId`,
 1 AS `boardId`,
 1 AS `imgPath`,
 1 AS `userNickname`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (7,30,'userId4');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT,
  `receiver` varchar(45) NOT NULL,
  `sender` varchar(45) NOT NULL,
  `messageTitle` varchar(45) NOT NULL,
  `messageContent` varchar(2048) NOT NULL,
  `messageSendDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleteBySender` tinyint(1) NOT NULL DEFAULT '0',
  `deleteByReceiver` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageId`),
  KEY `FK_sender_idx` (`sender`),
  KEY `FK_receiver_idx` (`receiver`),
  CONSTRAINT `FK_receiver` FOREIGN KEY (`receiver`) REFERENCES `user` (`userId`),
  CONSTRAINT `FK_sender` FOREIGN KEY (`sender`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (3,'idid12','idid11','test','test','2022-06-25 18:19:10',0,1),(8,'idid12','idid11','test7','test7','2022-06-25 18:19:50',0,0),(9,'idid12','idid11','test8','test8\n','2022-06-25 18:20:00',0,0),(10,'idid12','idid11','test9','test9','2022-06-25 18:20:05',0,0),(11,'idid12','idid11','test10','test10','2022-06-25 18:20:12',0,0),(12,'idid12','idid11','test11','test11','2022-06-25 18:20:18',1,0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `messageview`
--

DROP TABLE IF EXISTS `messageview`;
/*!50001 DROP VIEW IF EXISTS `messageview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `messageview` AS SELECT 
 1 AS `messageId`,
 1 AS `receiver`,
 1 AS `sender`,
 1 AS `messageTitle`,
 1 AS `messageContent`,
 1 AS `messageSendDate`,
 1 AS `deleteBySender`,
 1 AS `deleteByReceiver`,
 1 AS `receiverNickname`,
 1 AS `senderNickname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `myboard`
--

DROP TABLE IF EXISTS `myboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myboard` (
  `myBoardId` int NOT NULL AUTO_INCREMENT,
  `myBoardTitle` varchar(45) NOT NULL,
  `myBoardContent` varchar(2048) NOT NULL,
  `myBoardDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`myBoardId`),
  KEY `FK_myboard_userId_user_userId` (`userId`),
  CONSTRAINT `FK_myboard_userId_user_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myboard`
--

LOCK TABLES `myboard` WRITE;
/*!40000 ALTER TABLE `myboard` DISABLE KEYS */;
INSERT INTO `myboard` VALUES (2,'image !!!','<p>mmm<img class=\"image_resized\" style=\"width:27.43%;\" src=\"/img/6bf14ba8-a265-45f4-817a-552636c54060\"></p>','2022-06-07 19:35:54','a'),(3,'test','<figure class=\"image image_resized\" style=\"width:42.18%;\"><img src=\"/img/0bac49c3-2069-42b1-aa66-428f769d1df1\"></figure><p>testsdsad</p>','2022-06-23 16:04:48','idid12'),(4,'write test','<p>test</p>','2022-06-23 16:20:08','idid12'),(5,'11','<p>11</p><p>&nbsp;</p>','2022-06-23 16:23:25','idid12'),(6,'22','<p>22</p>','2022-06-23 16:23:31','idid12'),(7,'33','<p>33</p><p>&nbsp;</p>','2022-06-23 16:23:38','idid12'),(8,'44','<p>44</p>','2022-06-23 16:23:43','idid12'),(9,'55','<p>55</p>','2022-06-23 16:23:50','idid12'),(10,'66','<p>66</p>','2022-06-23 16:23:56','idid12'),(11,'77','<p>77</p>','2022-06-23 16:24:04','idid12'),(12,'88','<p>88</p>','2022-06-23 16:24:11','idid12'),(13,'99','<p>99</p>','2022-06-23 16:24:17','idid12');
/*!40000 ALTER TABLE `myboard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportlist`
--

DROP TABLE IF EXISTS `reportlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reportlist` (
  `reportId` int NOT NULL AUTO_INCREMENT,
  `reportContent` varchar(2048) NOT NULL,
  `reportedUser` varchar(45) NOT NULL,
  `reporter` varchar(45) NOT NULL,
  `reportType` varchar(45) NOT NULL,
  `reportDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reportId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportlist`
--

LOCK TABLES `reportlist` WRITE;
/*!40000 ALTER TABLE `reportlist` DISABLE KEYS */;
INSERT INTO `reportlist` VALUES (9,'','50','idid12','board','2022-06-23 15:55:58'),(10,'test','a','idid12','user','2022-06-23 16:03:24');
/*!40000 ALTER TABLE `reportlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `userRole` varchar(45) NOT NULL,
  PRIMARY KEY (`userRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ROLE_ADMIN'),('ROLE_MEMBER');
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
  `userPassword` varchar(2048) NOT NULL,
  `userNickname` varchar(45) NOT NULL,
  `userEmail` varchar(45) NOT NULL,
  `userReport` int NOT NULL DEFAULT '0',
  `userRole` varchar(45) NOT NULL DEFAULT 'ROLE_MEMBER',
  `userDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `userProfileImg` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_role_idx` (`userRole`),
  CONSTRAINT `FK_userRole` FOREIGN KEY (`userRole`) REFERENCES `role` (`userRole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('a','a','a','a',1,'ROLE_MEMBER','2022-06-13 13:18:45',NULL),('idid11','$2a$10$4HTRArbrmrQzvqmkJAYh7uX34Da.4TQPg0RLrqjnIlNsZ5xiMTJQG','nindslfn','nls@naver.com',0,'ROLE_MEMBER','2022-06-18 18:42:03',NULL),('idid12','$2a$10$vAGg80UGyTSW3MO83xQ90OTdzz6k0LWgcFLd4LYl497xt3eSmByaq','nini12','dnls@naver.com',0,'ROLE_ADMIN','2022-06-15 19:06:37','/profileImg/df59acd0-5e8c-4b4b-9375-545b873ee92e'),('userId1','userPassword1!','useruser','user@naver.com',0,'ROLE_MEMBER','2022-06-14 13:18:45',NULL),('userId2','password1!','nickname2','user@naver.com',0,'ROLE_MEMBER','2022-06-15 13:18:45',NULL),('userId3','userPassword3','nininini','iewf@naver.com',0,'ROLE_MEMBER','2022-06-16 13:18:45',NULL),('userId4','userPassword4','nlsdnv','jlnwev@naver.com',0,'ROLE_MEMBER','2022-06-17 13:18:45',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprofileimg`
--

DROP TABLE IF EXISTS `userprofileimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userprofileimg` (
  `userProfileImgId` int NOT NULL AUTO_INCREMENT,
  `imgName` varchar(150) DEFAULT NULL,
  `imgPath` varchar(300) DEFAULT NULL,
  `userId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userProfileImgId`),
  KEY `FK_userId_profileImg_idx` (`userId`),
  CONSTRAINT `FK_userId_profileImg` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofileimg`
--

LOCK TABLES `userprofileimg` WRITE;
/*!40000 ALTER TABLE `userprofileimg` DISABLE KEYS */;
INSERT INTO `userprofileimg` VALUES (31,'df59acd0-5e8c-4b4b-9375-545b873ee92e','/profileImg/df59acd0-5e8c-4b4b-9375-545b873ee92e','idid12');
/*!40000 ALTER TABLE `userprofileimg` ENABLE KEYS */;
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
/*!50001 VIEW `boardview` AS select `board`.`boardId` AS `boardId`,`board`.`boardTitle` AS `boardTitle`,`board`.`boardContent` AS `boardContent`,`board`.`boardDate` AS `boardDate`,`board`.`boardCategory` AS `boardCategory`,`board`.`boardReport` AS `boardReport`,`board`.`userId` AS `userId`,`board`.`boardHit` AS `boardHit`,(select count(0) from `comment` where (`comment`.`boardId` = `board`.`boardId`)) AS `commentCount`,(select count(0) from `likes` where (`likes`.`boardId` = `board`.`boardId`)) AS `likeCount`,(select count(0) from `dislikes` where (`dislikes`.`boardId` = `board`.`boardId`)) AS `dislikeCount`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `board`.`userId`)) AS `userNickname`,(select `userprofileimg`.`imgPath` from `userprofileimg` where (`userprofileimg`.`userId` = `board`.`userId`)) AS `imgPath` from `board` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `commentview`
--

/*!50001 DROP VIEW IF EXISTS `commentview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`namix`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `commentview` AS select `comment`.`commentId` AS `commentId`,`comment`.`commentContent` AS `commentContent`,`comment`.`commentDate` AS `commentDate`,`comment`.`userId` AS `userId`,`comment`.`boardId` AS `boardId`,(select `userprofileimg`.`imgPath` from `userprofileimg` where (`userprofileimg`.`userId` = `comment`.`userId`)) AS `imgPath`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `comment`.`userId`)) AS `userNickname` from `comment` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `messageview`
--

/*!50001 DROP VIEW IF EXISTS `messageview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`namix`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `messageview` AS select `m`.`messageId` AS `messageId`,`m`.`receiver` AS `receiver`,`m`.`sender` AS `sender`,`m`.`messageTitle` AS `messageTitle`,`m`.`messageContent` AS `messageContent`,`m`.`messageSendDate` AS `messageSendDate`,`m`.`deleteBySender` AS `deleteBySender`,`m`.`deleteByReceiver` AS `deleteByReceiver`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `m`.`receiver`)) AS `receiverNickname`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `m`.`sender`)) AS `senderNickname` from `message` `m` */;
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

-- Dump completed on 2022-06-25 21:40:06
