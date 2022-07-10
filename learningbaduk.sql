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
-- Table structure for table `alarm`
--

DROP TABLE IF EXISTS `alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarm` (
  `alarmId` int NOT NULL AUTO_INCREMENT,
  `alarmType` varchar(45) NOT NULL,
  `receiver` varchar(45) NOT NULL,
  `sender` varchar(45) NOT NULL,
  `alarmDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `boardId` int DEFAULT NULL,
  `commentId` int DEFAULT NULL,
  `messageId` int DEFAULT NULL,
  PRIMARY KEY (`alarmId`),
  KEY `FK_messageId_idx` (`messageId`),
  KEY `FK_commentId_idx` (`commentId`),
  KEY `FK_boardId_idx` (`boardId`),
  CONSTRAINT `FK_boardId` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`),
  CONSTRAINT `FK_commentId` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`),
  CONSTRAINT `FK_messageId` FOREIGN KEY (`messageId`) REFERENCES `message` (`messageId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarm`
--

LOCK TABLES `alarm` WRITE;
/*!40000 ALTER TABLE `alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `alarmview`
--

DROP TABLE IF EXISTS `alarmview`;
/*!50001 DROP VIEW IF EXISTS `alarmview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `alarmview` AS SELECT 
 1 AS `alarmId`,
 1 AS `alarmType`,
 1 AS `receiver`,
 1 AS `sender`,
 1 AS `alarmDate`,
 1 AS `boardId`,
 1 AS `commentId`,
 1 AS `messageId`,
 1 AS `receiverNickname`,
 1 AS `senderNickname`*/;
SET character_set_client = @saved_cs_client;

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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (30,'sdv','<p><img class=\"image_resized\" style=\"width:27.4%;\" src=\"/img/e0bb2fab-0eb1-41fd-9979-d35b09014cf7\"></p>','2022-06-05 16:03:52','endGameBoard',0,'a',2),(31,'mkaldsvn','<p>lknskva</p>','2022-06-06 18:45:02','endGameBoard',0,'userId4',2),(37,'1','<p>1</p>','2022-06-12 16:26:03','endGameBoard',0,'a',2),(38,'2','<p>2</p>','2022-06-12 16:26:22','endGameBoard',0,'a',1),(39,'3dsf','<p>3</p>','2022-06-12 16:26:33','endGameBoard',0,'a',1),(40,'4','<p>4</p>','2022-06-12 16:26:56','endGameBoard',0,'a',0),(41,'4','<p>4</p>','2022-06-12 16:26:56','endGameBoard',0,'a',1),(42,'5','<p>5</p>','2022-06-12 16:27:05','endGameBoard',0,'a',1),(48,'2222','<p>2222</p>','2022-06-12 16:43:09','endGameBoard',0,'a',1),(49,'2222hkhskd','<p>jkbdsvjkb2222</p>','2022-06-12 16:43:17','endGameBoard',0,'a',2),(50,'test','<p>teests</p>','2022-06-12 19:46:54','endGameBoard',1,'a',2),(51,'test dfsdfklj','<p>teststsetfd</p>','2022-06-22 20:03:28','endGameBoard',0,'idid12',2),(53,'write test','<p>test</p>','2022-06-23 16:19:53','endGameBoard',0,'idid12',6),(54,'just','<p>just</p>','2022-06-25 14:23:39','endGameBoard',0,'idid11',1),(55,'alarm test','<p>test test</p>','2022-07-04 14:54:46','endGameBoard',0,'idid12',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (22,'a','2022-06-06 19:25:23','a',31),(23,'sdvnl','2022-06-11 14:51:43','a',31),(27,'디스','2022-06-12 20:35:25','a',30),(31,'njksv','2022-06-17 13:57:11','idid12',30),(32,'websocket comment test','2022-06-27 14:10:00','idid11',53),(33,'반가워요','2022-06-27 14:18:57','idid11',53),(34,'하지마','2022-06-27 14:29:06','idid11',53),(35,'dlksnv','2022-06-27 14:31:11','idid11',53),(36,'tt','2022-06-27 14:42:36','idid11',53),(37,'얀녕하세요','2022-06-27 15:18:14','idid11',53),(38,'adsf','2022-06-27 15:36:36','idid11',53),(39,'ii','2022-06-27 16:00:22','idid11',53),(40,'a','2022-06-27 16:08:14','idid11',53),(41,'nsldv','2022-06-27 16:09:39','idid11',53),(42,'sdv','2022-06-27 16:15:59','idid11',53),(43,'nlsdvns','2022-06-27 16:16:10','idid11',53),(44,'sdvln','2022-06-27 16:17:45','idid11',53),(45,'sdv','2022-06-27 16:17:49','idid11',53),(46,'aa','2022-06-27 16:17:58','idid11',53),(47,'df','2022-06-27 16:18:01','idid11',53),(48,'jkvds','2022-06-27 16:28:28','idid11',53),(49,'nkjvs','2022-06-27 16:30:39','idid11',53),(50,'sdvsd','2022-06-27 16:32:16','idid11',53),(51,'tired','2022-06-27 18:51:49','idid11',53),(52,'sdvbjk','2022-06-27 19:01:05','idid11',53),(53,'thanks','2022-06-27 19:04:36','idid11',53),(54,'p-type','2022-06-27 20:52:26','idid11',53),(55,'늦어싿는','2022-06-27 20:55:37','idid11',53),(56,'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ','2022-06-27 21:03:25','idid11',53),(57,'ㄴ파','2022-06-27 21:06:37','idid11',53),(58,'hello','2022-06-27 21:08:36','idid11',53),(59,'please','2022-06-28 15:20:12','idid12',53),(60,'pub','2022-06-28 15:21:30','idid12',53),(61,'lskdjlnvd','2022-06-28 15:22:16','idid12',53),(62,'is','2022-06-28 15:24:37','idid12',53),(63,'ahffk','2022-06-28 15:26:01','idid12',53),(64,'들통','2022-06-28 15:27:14','idid11',53),(65,'끝나던 말던','2022-06-28 15:44:58','idid11',53),(66,'사라라라ㅏ라','2022-06-28 15:48:31','idid11',53),(67,'리리리','2022-06-28 15:49:36','idid11',53),(68,'소켓이라고','2022-06-28 15:49:52','idid11',53),(69,'나 그대 아주','2022-06-28 16:56:29','idid11',53),(70,'rmfo','2022-06-28 16:56:38','idid12',53),(71,'echo','2022-06-29 15:03:04','idid11',53),(72,'test','2022-06-29 15:56:25','idid11',53),(73,'store','2022-06-29 19:56:04','idid11',53),(74,'happy','2022-06-29 20:07:13','idid11',53),(75,'지금처럼만','2022-06-29 20:11:17','idid11',53),(76,'sdv','2022-06-29 20:14:13','idid11',53),(77,'go','2022-06-29 20:26:07','idid11',53),(78,'sdvbk','2022-06-29 20:32:25','idid11',53),(79,'aaa','2022-06-29 20:38:04','idid11',53),(80,'ssisissssisissssi','2022-06-29 20:51:08','idid11',53),(81,'fuck','2022-06-30 10:53:09','idid12',53),(82,'aa','2022-06-30 10:56:14','idid12',53),(83,'aadfs','2022-06-30 10:59:43','idid12',53),(84,'gogo','2022-06-30 14:20:44','idid12',53),(85,'hey','2022-06-30 14:23:02','idid12',53),(86,'good','2022-06-30 14:25:31','idid12',53),(87,'heyhey','2022-06-30 14:27:25','idid11',53),(88,'okok mino','2022-06-30 18:45:56','idid11',53),(89,'a momo','2022-06-30 18:46:52','idid11',53),(90,'you','2022-06-30 18:58:02','idid11',53),(91,'feel','2022-07-02 19:20:44','idid11',53),(92,'hey man','2022-07-04 14:55:31','idid11',55),(93,'hey hey','2022-07-04 14:55:40','idid11',55),(94,'처음이야 내가','2022-07-04 16:01:55','idid11',55),(95,'드디어 내가','2022-07-04 16:02:01','idid11',55),(96,'빠져버렸어어어','2022-07-04 16:02:14','idid11',55),(97,'sdvlks','2022-07-04 16:36:30','idid11',55);
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
-- Table structure for table `emailtoken`
--

DROP TABLE IF EXISTS `emailtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emailtoken` (
  `emailTokenId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `expiredDate` datetime DEFAULT NULL,
  `authToken` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`emailTokenId`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtoken`
--

LOCK TABLES `emailtoken` WRITE;
/*!40000 ALTER TABLE `emailtoken` DISABLE KEYS */;
INSERT INTO `emailtoken` VALUES (18,'ehdwns6781@naver.com',0,NULL,'d38367d0-2553-4877-889d-70f286cea7ff'),(19,'ehdwns6781@naver.com',0,NULL,'555b5905-db2c-4326-b9d6-0411d15b36e4'),(20,'ehdwns6781@naver.com',1,NULL,'15e9798f-02c7-4e00-b309-bcee2517b591'),(21,'ehdwns6781@naver.com',1,NULL,'c370288d-c680-481d-b465-29308ed1ab9e'),(22,'ehdwns6781@naver.com',1,NULL,'dfc548ec-f0b6-446a-88bc-340b8d4d5574'),(23,'ehdwns6781@naver.com',1,'2022-07-09 15:50:10','0ed3f600-8cdb-408e-9481-1222e0b18784'),(24,'dongjun6767@gmail.com',1,'2022-07-10 13:57:02','1b017c55-de76-447a-ac18-d7518943d16f');
/*!40000 ALTER TABLE `emailtoken` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (3,'idid12','idid11','test','test','2022-06-25 18:19:10',0,1),(8,'idid12','idid11','test7','test7','2022-06-25 18:19:50',0,0),(9,'idid12','idid11','test8','test8\n','2022-06-25 18:20:00',0,0),(10,'idid12','idid11','test9','test9','2022-06-25 18:20:05',0,0),(11,'idid12','idid11','test10','test10','2022-06-25 18:20:12',0,0),(12,'idid12','idid11','test11','test11','2022-06-25 18:20:18',1,0),(15,'idid12','idid11','websocket test','test','2022-06-28 16:50:00',0,0),(16,'idid12','idid11','test','test','2022-06-28 16:55:33',0,0),(17,'idid12','idid11','test','test','2022-06-28 16:57:21',0,0),(18,'idid12','idid11','testtste','tesetest','2022-06-28 17:01:31',0,0),(19,'idid12','idid11','dsjlkf','njksdnv','2022-06-28 17:04:15',0,0),(20,'idid12','idid11','dsfnl','lknvlkjds','2022-06-28 17:12:02',0,0),(21,'idid12','idid11','점중','짐중','2022-06-28 17:18:50',0,0),(22,'idid12','idid11','close','close','2022-06-28 17:19:51',0,0),(23,'idid12','idid11','ndsjkvb','jkdsbvkj','2022-06-28 17:22:31',0,0),(24,'idid12','idid11','a','atest','2022-06-30 18:47:15',0,0),(25,'idid12','idid11','hey me ','hey meme','2022-06-30 18:57:40',0,0),(26,'idid12','idid11','i am double','am','2022-06-30 19:23:13',0,0),(27,'idid12','idid11','hey','litsen','2022-07-02 19:20:15',0,0),(28,'idid12','idid11','매직','매직','2022-07-02 19:20:57',0,0),(29,'idid12','idid11','하하라','하하라','2022-07-02 19:21:11',0,0),(30,'idid12','idid11','hihi','hihi','2022-07-04 14:55:55',0,0),(31,'idid12','idid11','ㅗ돋','ㅝ눙ㅍ','2022-07-04 16:02:27',0,0),(32,'idid12','idid11','ㅁㅁ','ㅁㅁ','2022-07-04 16:04:37',0,0),(33,'idid12','idid11','ㄴ이ㅏ러ㅣㅏ','ㅣㅏㅜ닢ㅇ','2022-07-04 16:05:10',0,0),(34,'idid12','idid11','ㅓㅣㅏㅜ','ㅏㅓ ㅜㅏㄴㅇㅍ','2022-07-04 16:06:06',0,0),(35,'idid12','idid11','ㄴ우ㅏㅓㅍ','ㅜㅏㅓㄴㅍㅇ','2022-07-04 16:06:11',0,0),(36,'idid12','idid11','ㄴㅇㅍ','ㅏㅓㅜㅍㅇㄴ','2022-07-04 16:09:51',0,0),(37,'idid12','idid11','sdvnjk','kjnvkdjs','2022-07-04 16:26:22',0,0),(38,'idid12','idid11','sdfk','dksjbv','2022-07-04 16:33:14',0,0),(39,'idid12','idid11','jksdbv','sdjvndsk','2022-07-04 16:35:09',0,0);
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
  `emailAuth` tinyint(1) NOT NULL DEFAULT '0',
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
INSERT INTO `user` VALUES ('a','a','a','a',1,'ROLE_MEMBER','2022-06-13 13:18:45',NULL,0),('idid11','$2a$10$4HTRArbrmrQzvqmkJAYh7uX34Da.4TQPg0RLrqjnIlNsZ5xiMTJQG','nindslfn','nls@naver.com',0,'ROLE_MEMBER','2022-06-18 18:42:03',NULL,0),('idid12','aDYunbl9I0','nini12','dnls@naver.com',0,'ROLE_ADMIN','2022-06-15 19:06:37','/profileImg/df59acd0-5e8c-4b4b-9375-545b873ee92e',1),('idman1','$2a$10$ucLgRtpfefxwbkaaovemKuRrkW4bOR5NT2szoibHQ5knEWEoaPnv.','manman1','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 14:03:13',NULL,0),('idman2','$2a$10$6eJBZcmk.ZmK4c0M9.MYTuoU9qr1.vhg/BppcnsknqcCPcCnFncna','manman2','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 14:14:47',NULL,0),('idman3','$2a$10$FgAty.Q1njLRho4Ih.1wJOnBLlNbaCORohcmipOwdSnYlBt.UOzZO','manman3','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 14:53:46',NULL,1),('idman4','$2a$10$YBzX8TzxBGxkJEPQzLKp6uFblOGotB5OJZkHNYSzQdQGwCGt/L8M6','manman4','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 14:59:05',NULL,1),('idman5','$2a$10$FyROpAmlXljejZ19WWqnguKizeptnTyeR1TrvB8K2B.tjgm2ybZZa','manman5','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 15:14:15',NULL,1),('idman6','$2a$10$xYgJstccfoAp7dMbscK2PeXwrZEFxi95CN1yX9lP.j/Odrd9oLkMy','manman6','ehdwns6781@naver.com',0,'ROLE_MEMBER','2022-07-09 15:49:54',NULL,1),('skull1','$2a$10$wS3FYKmt6k6FFrTj9PIOsukGNRGfGdKyr95KnFhe0qaEGr/vsXYMq','skull','dongjun6767@gmail.com',0,'ROLE_MEMBER','2022-07-09 21:07:19',NULL,1),('userId1','userPassword1!','useruser','user@naver.com',0,'ROLE_MEMBER','2022-06-14 13:18:45',NULL,0),('userId2','password1!','nickname2','user@naver.com',0,'ROLE_MEMBER','2022-06-15 13:18:45',NULL,0),('userId3','userPassword3','nininini','iewf@naver.com',0,'ROLE_MEMBER','2022-06-16 13:18:45',NULL,0),('userId4','userPassword4','nlsdnv','jlnwev@naver.com',0,'ROLE_MEMBER','2022-06-17 13:18:45',NULL,0);
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
-- Final view structure for view `alarmview`
--

/*!50001 DROP VIEW IF EXISTS `alarmview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`namix`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `alarmview` AS select `a`.`alarmId` AS `alarmId`,`a`.`alarmType` AS `alarmType`,`a`.`receiver` AS `receiver`,`a`.`sender` AS `sender`,`a`.`alarmDate` AS `alarmDate`,`a`.`boardId` AS `boardId`,`a`.`commentId` AS `commentId`,`a`.`messageId` AS `messageId`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `a`.`receiver`)) AS `receiverNickname`,(select `user`.`userNickname` from `user` where (`user`.`userId` = `a`.`sender`)) AS `senderNickname` from `alarm` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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

-- Dump completed on 2022-07-10 16:22:52
