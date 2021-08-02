-- MySQL dump 10.13  Distrib 8.0.25, for macos11.3 (x86_64)
--
-- Host: localhost    Database: blog_db
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_body` varchar(255) NOT NULL,
  `comment_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  `post_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'This is a comment. Isn\'t this neat.','2021-06-28 21:35:37',2,3),(2,'This is a comment. Isn\'t this neat.','2021-06-28 21:35:37',1,1),(3,'This is a very important topic. Thank you for sharing!','2021-06-28 21:37:17',4,2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) NOT NULL,
  `post_body` varchar(500) NOT NULL,
  `post_date` datetime NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Why is MVC so Important','MVC allows developers to maintain a true separation of concerns, devising their code between the Model layer for data, the View layer for design, and the Controller layer for application logic.','2021-06-28 21:35:37',1),(2,'Authentication vs Authorization','There is a difference between authentication and authorization. Authorization means confirming your own identity, whereas authorization means being allowed access to the system','2021-06-28 21:35:37',3),(3,'Obejct Relational Mapping (ORM)','I have really loved learning about ORMs. It\'s really simplified the way I create queries in SQL!','2021-06-28 21:35:37',3),(4,'My First Post','Since starting to learn to code in March of 2021, I have had many ups and downs. There are times when it all makes sense, it is challenging, it is cool, it is fun. There are also a lot of times when I feel lost, confused , and want to give up. Ultimately, this is one of the best decisions I\'ve made. Learning to code will open many doors for my career and will make me happier in the long run.','2021-06-28 21:36:53',4);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Session`
--

DROP TABLE IF EXISTS `Session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Session` (
  `sid` varchar(36) NOT NULL,
  `expires` datetime DEFAULT NULL,
  `data` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Session`
--

LOCK TABLES `Session` WRITE;
/*!40000 ALTER TABLE `Session` DISABLE KEYS */;
INSERT INTO `Session` VALUES ('_w9MZWjlDzPZvlHhFRnXiY-nr3B31Nuf','2021-06-28 21:56:38','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:38.921Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:38','2021-06-28 21:56:38'),('2piZW04q4qnrrfxuDhCCrYEXFik36SS4','2021-06-28 21:56:38','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:38.924Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:38','2021-06-28 21:56:38'),('5JPjpEetMfrZmcBzzTwhKO3p5mmjB0X5','2021-06-28 22:00:31','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T21:59:26.245Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":4,\"logged_in\":true,\"loggedIn\":true}','2021-06-28 21:57:47','2021-06-28 21:59:05'),('5LAOZWNG8XrFAiyMJDpvy3siBHQ4nkuH','2021-06-28 22:10:58','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:09:41.711Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true,\"user_id\":5,\"logged_in\":true}','2021-06-28 22:07:49','2021-06-28 22:09:32'),('6HiIW2ccqBoMVftnV9o0ZlOYnRIDT2S_','2021-06-28 22:09:06','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:07:40.030Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 22:06:13','2021-06-28 22:07:40'),('8uuXZ-AFXJ_WTBefNfGOOObZU8TMFB6X','2021-06-28 21:57:19','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:19.354Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('91DximHy4u4n5DCsuY-flGbE9CHvqes7','2021-06-28 22:03:50','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:02:39.127Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 22:01:12','2021-06-28 22:02:24'),('9j4UWNdp5pxoWySgwclA_ZK6X55rGMHW','2021-06-28 21:52:01','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T21:52:01.247Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 21:50:34','2021-06-28 21:50:34'),('a7GZf2o5FCnDWsl34n41ZVyrlH86tAke','2021-06-28 21:49:48','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T21:49:40.708Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 21:48:14','2021-06-28 21:48:21'),('b9KA7JTRG43pVEzVIq1EYqrFYpEjXukv','2021-06-28 21:56:10','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:10.966Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":4,\"logged_in\":true}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('BpQLbyT8nP26FjrSYDRHWFeIDDpoVVGX','2021-06-28 21:56:10','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:10.978Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('C3E6ouZ3MyFrMFOivvtf7W4sG8zv5xUR','2021-06-28 21:56:11','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:11.002Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('cBpt-ezVRfMEeWLEineegH73q0dcu3UV','2021-06-28 22:02:31','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:01:06.017Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:59:39','2021-06-28 22:01:05'),('dCofZTMfVPOurx-Y_JrB4_DPXxfmbyzC','2021-06-28 22:32:39','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:32:01.249Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true,\"user_id\":4,\"logged_in\":true}','2021-06-28 22:29:13','2021-06-28 22:31:12'),('DEJXe8K00rYw1VSOXRg_O4CpAl7sIElO','2021-06-28 21:56:35','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:35.960Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:35','2021-06-28 21:56:35'),('DSGyVMpFlVOSVYfS6TTgHOnbyEmfPdP7','2021-06-28 22:06:51','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:05:31.325Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 22:03:23','2021-06-28 22:05:25'),('eJGtHVUQjrHmt617dCk3sLioxxvp46hl','2021-06-28 21:56:35','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:35.923Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 21:56:35','2021-06-28 21:56:35'),('EuSx1PAK9dMpasPqskSRBVnEONSc0r-f','2021-06-28 21:57:28','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:28.724Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:28','2021-06-28 21:57:28'),('eWW9EMnfIo77F4Bjq7HDhlbeS5R3QZ6i','2021-06-28 21:56:35','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:35.956Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:35','2021-06-28 21:56:35'),('Feh4EYP4EYzN-ryAd2iGSMDUNZu0M4OV','2021-06-28 21:57:14','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:14.434Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:14','2021-06-28 21:57:14'),('g-qczjel5dsKcnFLgLVkZ6WhwOACaFOS','2021-06-28 21:57:20','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:20.038Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('G3gUBs-Xbqhzjp2SHBYKufBJZSDwNEtG','2021-06-28 21:57:28','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:28.723Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:28','2021-06-28 21:57:28'),('GYrWN31RM0LDqLb0tWXRE9eXdwJp0xyz','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.385Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('HNknCPOI9bKsL7IQOh-Ym7raC2VSNpDH','2021-06-28 21:57:14','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:14.391Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:14','2021-06-28 21:57:14'),('HvnaBP4Ca-aiOwFBEeZPLIf7pWYrMV5B','2021-06-28 21:57:19','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:19.307Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('Hw3rJfm7DDMxk8ELtReK-71F3Hjwxkcc','2021-06-28 21:56:11','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:11.001Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('HZA_5N9i40LppOS2-7FcAddE-AI8VKPw','2021-06-28 21:57:28','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:28.731Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:28','2021-06-28 21:57:28'),('iJDGJTgC20E-cNG8UckRXS_zMlpAhyqY','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.351Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('iqyQAo0RRR6ekTpkzaX91OCmOo8NMryD','2021-06-28 21:56:11','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:11.003Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('Jstze3ou-1wSMZJorLR5QVHLQdwaXBhV','2021-06-28 21:56:34','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:34.997Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:34','2021-06-28 21:56:34'),('kDOgpeCAugzAdmaT4kJlmCcmNw7i2L4m','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.416Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('kuYbIcXkBeK8Q8BaqRDg0fUaP55WpvO2','2021-06-28 21:56:38','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:38.923Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:38','2021-06-28 21:56:38'),('L4K7voyO-1iQ7zyHTQ_0ouiBao1skUeT','2021-06-28 21:56:10','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:10.983Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:10','2021-06-28 21:56:10'),('lFSvlQ-C3MbdnpYYhFQxuDTPpdK_4uw5','2021-06-28 21:57:19','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:19.995Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('MCLBW_Wy_E2_udk0sxxmS5etd7hyqbYp','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.350Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('mnprmTbOI0yZFATNmd06JuSlWeZ7iI1u','2021-06-28 22:12:02','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:12:02.285Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 22:10:35','2021-06-28 22:10:35'),('MV6ni1p3xzhYglId9t3sYiYC0TiZ-NJ3','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.390Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('N_ye-oipn-xLoEwl3eNx9_2y80PHWEwk','2021-06-28 21:56:35','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:35.956Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:35','2021-06-28 21:56:35'),('nCi7AlkI9XMsgxfowGlOjtZbFCiaV-Dr','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.321Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('OQNp4QeP_P-Ptc-YxPZBL3xx49db8iBi','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.326Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('q5uCHsCUPM8ZeZf23ajEJi4GxcpVhK7e','2021-06-28 21:57:19','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:19.356Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('QHO-zY5diuIDZhIz1lpbeyBckeVvpbLv','2021-06-28 21:55:59','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T21:55:49.050Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true,\"user_id\":4,\"logged_in\":true}','2021-06-28 21:53:18','2021-06-28 21:54:33'),('reYnpPsjZLE89D2lbZ7KNj6rs1r8uECN','2021-06-28 21:57:28','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:28.681Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:28','2021-06-28 21:57:28'),('ri0DKxjPxmJ1RJHXJ3hqPl5GBCRyeqNo','2021-06-30 05:01:52','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-30T05:01:47.625Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-30 05:00:18','2021-06-30 05:00:25'),('rSrRk9waQ9FgMgQsh98__r7tVekmSv5K','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.307Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":4,\"logged_in\":true}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('RyEJkogmBNJidIEXgBy7zUE25srAXsNN','2021-06-28 21:46:44','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T21:46:40.438Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true,\"user_id\":4,\"logged_in\":true}','2021-06-28 21:43:03','2021-06-28 21:45:17'),('s0CiB2FDc1clfjfr3LYom-g2CZZCuWrW','2021-06-28 21:55:57','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:55:57.982Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:55:57','2021-06-28 21:55:57'),('sA3dQLAdzXay4d47Op55Um5rO2oTRXbg','2021-06-28 22:28:44','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-28T22:28:43.076Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 22:27:16','2021-06-28 22:27:18'),('SJkTKshfHG6rm8i0zTEYgi8iUa3u7a_U','2021-06-28 21:56:34','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:34.998Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:34','2021-06-28 21:56:34'),('skLt9_Jj38EZNpBVoJcyiLcGU5gsZ-98','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.374Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":4,\"logged_in\":true}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('SpoC99VtTvD_u78WPwMXVjqX24bNveY_','2021-06-28 21:57:16','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:16.058Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-28 21:57:15','2021-06-28 21:57:15'),('tTPJvr6N-xz3sjxqA4FrouOnCCX_sbVQ','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.418Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('tUU-hiPXnot0FXd72ywsTJzQ9zpL2WyD','2021-06-28 21:55:58','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:55:58.017Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:55:57','2021-06-28 21:55:57'),('UcDUU186ZWBTXXdaeM7Gc_L5g_Vq70y6','2021-06-28 21:56:47','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:47.352Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:47','2021-06-28 21:56:47'),('VdFRZBXRFE_hpbzFmrydGxNbc5F0xFyL','2021-06-28 21:57:20','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:20.039Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:19'),('WVBwCYR0CC8A9lYVtZgxewyfKJ5eqYah','2021-06-28 21:57:14','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:14.435Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:14','2021-06-28 21:57:14'),('WZVIqAfgk1psMUD_PRL4tLESIoDNad93','2021-06-28 21:57:28','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:28.690Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:28','2021-06-28 21:57:28'),('xoZmu7x7X657BZ_mw96nuI7ilBFYhUBY','2021-06-28 21:57:12','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:12.144Z\",\"httpOnly\":true,\"path\":\"/\"},\"user_id\":4,\"logged_in\":true}','2021-06-28 21:57:11','2021-06-28 21:57:12'),('xR0bN8MggyzbuAbwcBDDybzu7fJv1B9H','2021-06-28 21:57:20','{\"cookie\":{\"originalMaxAge\":300,\"expires\":\"2021-06-28T21:57:20.040Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:57:19','2021-06-28 21:57:20'),('XyMFdmgakS-DaxH5NsihmTW6NkZ_Db3U','2021-06-28 21:56:34','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:34.957Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:34','2021-06-28 21:56:34'),('yFZazNt-fLOToOA0uekxHtyp_db4vOid','2021-06-28 21:56:24','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:24.416Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:24','2021-06-28 21:56:24'),('ZMuXh4joUSOzKinr7puij2eJgi8i_NZf','2021-06-30 04:49:35','{\"cookie\":{\"originalMaxAge\":86400,\"expires\":\"2021-06-30T04:49:35.538Z\",\"httpOnly\":true,\"path\":\"/\"},\"loggedIn\":true}','2021-06-30 04:48:07','2021-06-30 04:48:09'),('ZXkJQwXto_gcfILe46Q7-MnFhCRuy6Ae','2021-06-28 21:56:38','{\"cookie\":{\"originalMaxAge\":120,\"expires\":\"2021-06-28T21:56:38.884Z\",\"httpOnly\":true,\"path\":\"/\"}}','2021-06-28 21:56:38','2021-06-28 21:56:38');
/*!40000 ALTER TABLE `Session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Lernantino','lernantino@gmail.com','$2b$10$80NbuN.I9g71SK5/tR.bpOfA4IfbLlqbFF2nShtPk5mC/HHIc7Faq'),(2,'Amiko','amiko2k20@aol.com','$2b$10$QgkUb7PW4RqjycY5pE3QbOMnlinfcyme4a.R2pI0TGrkDCSAOUzPy'),(3,'Sal','sal@hotmail.com','$2b$10$mWMJ5m6bnH8rtV2M/RT3suYJWsnHEYSJKICYfOX7.rb2DfgcHBbA.'),(4,'sandy','sandy@sandy.com','$2b$10$2ir/psQE4lxc16VE3q5YLevQJFsDg8sJ6HngQADzjFBDuLc2e0j8a'),(5,'chris','chris@chris.com','$2b$10$Ki.qJ2yBonyMCqYbtodMde2oFbkw5ltWndM.CYWsHY8LgSa51AJRS');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29 22:31:32
