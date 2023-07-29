-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: swp391_group5
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `cv_of_mentor`
--

DROP TABLE IF EXISTS `cv_of_mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_of_mentor` (
  `mentor_id` int NOT NULL,
  `profession` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `profession_introduction` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `service_description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `achievements` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `achievements_des` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `language` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`mentor_id`),
  CONSTRAINT `cv_of_mentor_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_of_mentor`
--

LOCK TABLES `cv_of_mentor` WRITE;
/*!40000 ALTER TABLE `cv_of_mentor` DISABLE KEYS */;
INSERT INTO `cv_of_mentor` VALUES (1,'Giảng viên Đại học FPT','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Tốt nghiệp đại học Bách Khoa','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Java Swing',NULL),(2,'Lập trình viên tại VNG','Có nhiều năm kinh nghiệm lập trình ','Có kĩ năng về các framework Java','Thủ khoa Đại học FPT 2022','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','React',NULL),(4,'Lập trình viên Java','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Tốt nghiệp đại học FPT','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Django',NULL),(5,'Giảng viên HUST','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Giải nhất Hackerthon 2021','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Laravel',NULL),(6,'Chuyên viên phát triển trò chơi','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Tốt nghiệp đại học Bách Khoa','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','ASP.NET',NULL),(7,'Giảng viên PTIT','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Tốt nghiệp đại học FPT','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Spring Boot',NULL),(9,'Quản lý dự án công nghệ thông tin','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Tốt nghiệp đại học Bách Khoa','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Flask',NULL),(10,'Lập trình viên Java','Có nhiều năm kinh nghiệm lập trình ','Có kiến thức chuyên sâu về Java','Tốt nghiệp đại học FPT','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Laravel',NULL),(11,'Giảng viên Đại học FPT','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Giải nhất Hackerthon 2021','Giúp mentee trong việc thiết kế, triển khai và quản lý dự án phần mềm, từ quy trình phát triển đến tạo ra sản phẩm hoàn chỉnh.','Laravel',NULL),(18,'Lập trình viên tại GoLang','Lập trình viên lâu năm','Học tốt','Có nhiều kinh nghiệm','Có nhiều kinh nghiệm','Học tốt',NULL),(19,'Chuyên viên kỹ thuật','Có nhiều năm kinh nghiệm lập trình ','Kết nối, hộ trợ học lập trình','Đạt nhiều giải thưởng về lập trình','Kết nối, hộ trợ học lập trình','Java Swing',NULL),(21,'Chuyên viên an toàn thông tin','Có nhiều năm kinh nghiệm lập trình ','Có kĩ năng về các framework Java','Đóng góp vào dự án mã nguồn mở','Được chấp nhận và tích cực đóng góp vào các dự án mã nguồn mở phổ biến như Linux, Python, Ruby, hoặc các dự án phần mềm tự do khác.','Hibernate: Framework ORM (Object-Relational Mapping) cho phép tương tác dễ dàng giữa các đối tượng Java và cơ sở dữ liệu quan hệ.',NULL),(22,'Chuyên gia trí tuệ nhân tạo','Nghiên cứu và phát triển các hệ thống trí tuệ nhân tạo và máy học.','Kết nối, hộ trợ học lập trình','Chứng chỉ chuyên nghiệp','Đạt được các chứng chỉ uy tín trong lĩnh vực lập trình như Cisco CCNA, CompTIA Security+, AWS Certified Developer, v.v.','React: Thư viện JavaScript phổ biến cho việc xây dựng giao diện người dùng tương tác trong các ứng dụng web.',NULL),(23,'Chuyên viên tư vấn công nghệ','Cung cấp lời khuyên và hướng dẫn về công nghệ cho doanh nghiệp và cá nhân.','Kết nối, hộ trợ học lập trình','Nhận giải thưởng hoặc vinh danh trong ngành','Được công nhận và nhận giải thưởng vì đóng góp và thành tựu xuất sắc trong lĩnh vực lập trình.','Angular: Framework JavaScript phát triển bởi Google cho việc xây dựng các ứng dụng web đơn trang (Single-Page Applications) mạnh mẽ.',NULL),(24,'Quản trị cơ sở dữ liệu','Quản lý và bảo trì cơ sở dữ liệu của các hệ thống công nghệ thông tin.','Kết nối, hộ trợ học lập trình','Thành lập công ty công nghệ MentorLink','Xây dựng và điều hành công ty công nghệ thành công, phát triển sản phẩm và dịch vụ mang lại giá trị cho thị trường.','Entity Framework: Framework ORM cho phép truy cập và thao tác dữ liệu từ cơ sở dữ liệu quan hệ trong ứng dụng .NET.',NULL),(25,'Chuyên viên thiết kế trải nghiệm người dùng','Tạo ra giao diện và trải nghiệm người dùng tốt cho các sản phẩm công nghệ thông tin.','Kết nối, hộ trợ học lập trình','Xây dựng sản phẩm phần mềm độc lập','Đạt thành công trong việc xây dựng sản phẩm phần mềm riêng của mình và đưa nó vào hoạt động.','Spring Framework: Là một trong những framework phổ biến nhất cho Java, cung cấp mô hình ứng dụng phát triển toàn diện và hỗ trợ mạnh mẽ cho việc xây dựng ứng dụng doanh nghiệp.',NULL);
/*!40000 ALTER TABLE `cv_of_mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cv_skill`
--

DROP TABLE IF EXISTS `cv_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cv_skill` (
  `mentor_id` int DEFAULT NULL,
  `skill_id` int DEFAULT NULL,
  KEY `mentor_id` (`mentor_id`),
  KEY `skill_id` (`skill_id`),
  CONSTRAINT `cv_skill_ibfk_1` FOREIGN KEY (`mentor_id`) REFERENCES `cv_of_mentor` (`mentor_id`),
  CONSTRAINT `cv_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cv_skill`
--

LOCK TABLES `cv_skill` WRITE;
/*!40000 ALTER TABLE `cv_skill` DISABLE KEYS */;
INSERT INTO `cv_skill` VALUES (4,4),(4,3),(19,2),(19,3),(2,1),(2,2),(2,3),(5,6),(5,7),(5,8),(1,10),(1,11),(1,12),(6,1),(6,4),(6,7),(7,4),(7,11),(7,12),(9,5),(9,6),(9,8),(10,6),(10,9),(10,10),(11,3),(11,8),(11,12),(18,5),(18,6),(18,12),(21,9),(21,11),(21,12),(22,7),(22,8),(22,10),(23,3),(23,4),(23,10),(24,6),(24,8),(24,12),(25,2),(25,8),(25,10);
/*!40000 ALTER TABLE `cv_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `user_id` int NOT NULL,
  `mentor_id` int NOT NULL,
  `rate_start` int DEFAULT NULL,
  `feedback_comment` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `fb_status` bit(1) DEFAULT NULL,
  KEY `mentor_id` (`mentor_id`),
  KEY `feedback_ibfk_1` (`user_id`),
  CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `cv_of_mentor` (`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (3,2,3,'Bài học rất hay','2023-06-14',_binary ''),(3,4,1,'Bài học rất hay','2023-06-14',_binary ''),(3,5,5,'Bài học rất hay','2023-06-14',_binary ''),(4,2,4,'Bài học rất hay','2023-07-09',_binary ''),(13,2,2,'Bài học rất hay','2023-06-14',_binary ''),(14,2,5,'Bài học rất hay','2023-06-14',_binary ''),(15,2,3,'Bài học rất hay','2023-06-14',_binary ''),(16,2,4,'Bài học rất hay','2023-06-14',_binary ''),(3,2,4,'Bài học rất hay','2023-07-18',_binary ''),(3,4,5,'Ok','2023-07-19',_binary ''),(3,2,3,'ok','2023-07-19',_binary ''),(3,2,4,'Bài học rất hay','2023-07-21',_binary ''),(17,5,3,'Oke Good','2023-07-25',_binary ''),(20,10,5,'Goodd','2023-07-26',_binary ''),(3,5,5,'Good','2023-07-26',_binary ''),(3,10,4,'Oke','2023-07-26',_binary ''),(31,6,3,'ok','2023-07-26',_binary ''),(30,4,3,'Ok 9','2023-07-26',_binary ''),(29,1,4,'OK 10','2023-07-26',_binary ''),(28,10,3,'Oke 12','2023-07-26',_binary ''),(33,5,4,'Ọke','2023-07-26',_binary '');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_skill`
--

DROP TABLE IF EXISTS `feedback_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_skill` (
  `mentee_id` int NOT NULL,
  `mentor_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `rate_skill` int DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  KEY `mentor_id` (`mentor_id`),
  KEY `skill_id` (`skill_id`),
  KEY `feedback_skill_ibfk_1` (`mentee_id`),
  CONSTRAINT `feedback_skill_ibfk_1` FOREIGN KEY (`mentee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `feedback_skill_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `cv_of_mentor` (`mentor_id`),
  CONSTRAINT `feedback_skill_ibfk_3` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_skill`
--

LOCK TABLES `feedback_skill` WRITE;
/*!40000 ALTER TABLE `feedback_skill` DISABLE KEYS */;
INSERT INTO `feedback_skill` VALUES (3,2,2,4,NULL),(3,2,3,3,NULL),(3,2,4,5,NULL),(13,2,2,2,NULL),(13,2,3,4,NULL),(13,2,5,1,NULL),(16,2,2,3,NULL),(16,2,3,4,NULL),(3,2,2,4,NULL),(3,2,4,4,NULL),(3,4,4,3,NULL),(3,2,4,3,NULL),(3,2,5,3,NULL),(17,5,8,2,NULL),(20,10,9,3,NULL),(3,5,7,3,NULL),(3,10,10,3,NULL),(31,6,7,4,NULL),(30,4,4,5,NULL),(29,1,11,4,NULL),(28,10,9,3,NULL),(33,5,7,3,NULL);
/*!40000 ALTER TABLE `feedback_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `mentor_id` int DEFAULT NULL,
  `mentee_id` int DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `request_content` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `time_study` int DEFAULT NULL,
  `time_begin` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `finish_date` datetime DEFAULT NULL,
  `request_status` int DEFAULT NULL,
  PRIMARY KEY (`request_id`),
  KEY `mentee_id` (`mentee_id`),
  KEY `mentor_id` (`mentor_id`),
  KEY `request_status` (`request_status`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`mentee_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`mentor_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `request_ibfk_3` FOREIGN KEY (`request_status`) REFERENCES `request_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (35,2,3,'Học C#','C# OPP',5,'2023-06-25 05:46:07','2023-06-24 19:44:00','2023-06-27 17:47:00',5),(36,2,3,'Hỗ trợ bài tập','Giải bài tập về Python',5,'2023-06-25 05:48:08','2023-06-24 19:44:00','2023-06-27 17:47:00',2),(38,2,13,'Lap Trinh C++','Tôi muốn được review code và feedback',1,'2023-06-14 23:52:01','2023-06-14 23:52:01','2023-06-27 17:47:00',3),(39,2,14,'Học C#','Giúp tôi giải đáp thắc mắc về gird',4,'2023-06-25 05:44:27','2023-06-25 05:44:27','2023-06-27 17:47:00',2),(40,2,15,'Học thử','Giúp tôi giải đáp thắc mắc về gird',3,'2023-06-25 05:57:26','2023-06-24 19:44:00','2023-06-27 17:47:00',4),(41,2,16,'Hỗ trợ bài tập','Tôi có một vài thắc mắc về C#',3,'2023-06-14 23:52:01','2023-06-24 19:44:00','2023-06-27 17:47:00',4),(42,2,3,'SWP391','Tôi muốn hiểu sâu hơn về Java-Core',4,'2023-06-29 01:34:48','2023-07-05 23:52:00','2023-07-16 23:52:00',3),(43,4,3,'Học C#','Tôi muốn học C#',2,'2023-06-29 01:34:48','2023-07-05 23:52:00','2023-07-16 23:52:00',5),(44,2,3,'Đăng kí học tất cả các môn','Học nữa học mãi',1,'2023-07-13 01:36:43','2023-07-12 13:32:00','2023-07-14 13:32:00',3),(45,2,3,'Tôi muốn học kiến thức mới','Tuyệt quá',2,'2023-07-13 01:33:42','2023-07-12 13:32:00','2023-07-14 13:32:00',3),(46,2,3,'Đăng kí học lập trình','Alo alo',2,'2023-07-15 04:43:55','2023-07-14 16:43:00','2023-07-16 16:43:00',3),(48,2,3,'Đăng kí học ','Hello anh em',1,'2023-07-17 09:07:10','2023-07-16 23:05:00','2023-07-27 21:05:00',2),(49,2,3,'dang ky hoc c , html , tat ca cac mon','Em muốn pass môn',4,'2023-07-17 09:17:22','2023-07-16 21:16:00','2023-07-18 21:16:00',3),(50,2,3,'Đăng kí học Java','Tôi muốn học Java',4,'2023-07-19 23:38:06','2023-07-19 11:37:00','2023-07-21 11:37:00',3),(51,2,3,'Đăng kí học ','Đi chơi',3,'2023-07-19 23:56:02','2023-07-20 02:58:00','2023-07-22 11:55:00',3),(52,2,3,'Đăng kí học C#','Học gì cũng được',3,'2023-07-20 00:02:24','2023-07-20 12:01:00','2023-07-22 12:02:00',2),(53,2,3,'Đăng kí học C#','Đã đăng kí',4,'2023-07-20 02:19:33','2023-07-21 14:16:00','2023-07-23 14:16:00',5),(54,4,3,'Lập trình Ruby','Học nào',2,'2023-07-21 13:57:19','2023-07-21 01:57:00','2023-07-23 01:57:00',2),(55,2,3,'Lập trình tuyệt quá','Tôi đi học',4,'2023-07-21 14:39:21','2023-07-21 02:39:00','2023-07-24 02:39:00',3),(56,4,3,'Lap Trinh C#','Học lập trình',2,'2023-07-26 11:02:22','2023-07-25 23:02:00','2023-07-29 23:02:00',2),(57,5,17,'Lap Trinh P','Học tốt',3,'2023-07-26 11:40:58','2023-07-25 23:40:00','2023-07-28 23:40:00',5),(58,11,17,'Lập trình 2','Học kotlin',4,'2023-07-26 11:55:10','2023-07-25 23:54:00','2023-07-28 23:54:00',1),(59,9,17,'Lap Trinh 5','Học',4,'2023-07-26 12:01:49','2023-07-25 23:59:00','2023-07-29 23:59:00',1),(60,9,17,'Lap Trinh 3','Học',3,'2023-07-26 12:01:06','2023-07-25 23:59:00','2023-07-29 23:59:00',1),(61,10,20,'Lap Trinh Rubyy','Họcc',4,'2023-07-26 12:55:37','2023-07-26 00:50:00','2023-07-29 00:50:00',5),(62,5,3,'Lập Trình 6','Up',3,'2023-07-26 15:21:46','2023-07-26 03:21:00','2023-07-29 03:21:00',5),(63,10,3,'Lập trình 7','Good',4,'2023-07-26 15:23:11','2023-07-27 03:22:00','2023-07-30 03:22:00',5),(64,6,31,'Lập trình 8','Cùng học 8',3,'2023-07-26 17:30:48','2023-07-26 05:30:00','2023-07-30 05:30:00',5),(65,4,30,'Lập trình 9','Lập trình 9',5,'2023-07-26 17:34:01','2023-07-27 05:33:00','2023-07-29 05:33:00',5),(66,1,29,'Lập trình 10','Cùng học 10',4,'2023-07-26 17:38:13','2023-07-26 05:37:00','2023-07-30 05:38:00',5),(67,10,28,'Lập trình 11','Cùng học 11',3,'2023-07-26 17:40:43','2023-07-27 05:40:00','2023-07-29 05:40:00',5),(68,5,33,'Lập trình 14','Cùng học',4,'2023-07-26 18:09:20','2023-07-26 06:09:00','2023-07-29 06:09:00',5),(69,2,20,'Lập trình 15','Học 15',3,'2023-07-26 18:18:19','2023-07-26 06:18:00','2023-07-30 06:18:00',2),(70,2,26,'Lập trình 16','Học lập trình',2,'2023-07-26 18:20:30','2023-07-26 06:20:00','2023-07-28 06:20:00',3),(71,2,3,'Lập trình 17','Học nhé',5,'2023-07-26 18:22:11','2023-07-26 06:21:00','2023-07-29 06:21:00',1),(72,5,30,'a','aaaa',1,'2023-07-26 19:40:54','2023-07-27 07:40:00','2023-08-05 07:40:00',1),(73,5,30,'a','aaaa',1,'2023-07-26 19:40:54','2023-07-27 07:40:00','2023-08-05 07:40:00',1),(74,5,30,'a','aaaa',1,'2023-07-26 19:40:54','2023-07-27 07:40:00','2023-08-05 07:40:00',1),(75,4,3,'Lập trình 18','Oke',4,'2023-07-26 20:07:45','2023-07-26 08:07:00','2023-07-30 08:07:00',2),(76,1,3,'Lập trình 2','Lập trình 2',2,'2023-07-26 20:25:21','2023-07-26 08:25:00','2023-07-28 08:25:00',1),(77,2,3,'Tôi cần mentor java cấp tốc','Tôi cần học để lấy chứng chỉ',5,'2023-07-27 00:30:34','2023-07-26 12:26:00','2023-08-26 12:26:00',1);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_skill`
--

DROP TABLE IF EXISTS `request_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_skill` (
  `skill_id` int DEFAULT NULL,
  `request_id` int DEFAULT NULL,
  KEY `skill_id` (`skill_id`),
  KEY `request_id` (`request_id`),
  CONSTRAINT `request_skill_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`),
  CONSTRAINT `request_skill_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_skill`
--

LOCK TABLES `request_skill` WRITE;
/*!40000 ALTER TABLE `request_skill` DISABLE KEYS */;
INSERT INTO `request_skill` VALUES (5,35),(2,42),(4,42),(2,38),(2,45),(2,44),(2,46),(2,48),(2,49),(4,49),(2,36),(4,43),(4,50),(4,51),(4,52),(4,53),(3,54),(4,55),(4,56),(8,57),(8,58),(5,60),(6,59),(9,61),(7,62),(10,63),(7,64),(4,65),(11,66),(9,67),(3,40),(3,39),(3,41),(7,68),(2,69),(1,70),(3,71),(8,72),(8,73),(8,74),(3,75),(10,76),(3,77);
/*!40000 ALTER TABLE `request_skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_status`
--

DROP TABLE IF EXISTS `request_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_status`
--

LOCK TABLES `request_status` WRITE;
/*!40000 ALTER TABLE `request_status` DISABLE KEYS */;
INSERT INTO `request_status` VALUES (1,'Open'),(2,'Processing'),(3,'Cancel'),(4,'Closed'),(5,'Finished');
/*!40000 ALTER TABLE `request_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'mentee'),(2,'mentor'),(3,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill`
--

DROP TABLE IF EXISTS `skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill` (
  `skill_id` int NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `skill_img` varchar(500) DEFAULT NULL,
  `skill_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`skill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill`
--

LOCK TABLES `skill` WRITE;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` VALUES (1,'Python','https://200lab-blog.imgix.net/2023/04/Python-la-gi.png',_binary ''),(2,'Html','https://www.xodusweb.com/blog/cm/showfiles.php/mod-article-dett-img/saved/23/42/top/html-tag-base.jpg',_binary ''),(3,'Java','https://i.ytimg.com/vi/A74TOX803D0/maxresdefault.jpg',_binary ''),(4,'C#','https://citl.siu.edu.vn/wp-content/uploads/2020/11/ngon-ngu-lap-trinh-csharp-2.png',_binary ''),(5,'C','https://contentstatic.techgig.com/photo/90325682.cms',_binary ''),(6,'C++','https://sparc.org.in/wp-content/uploads/2018/12/best-C-programming-course-in-gtb-nagar-sparc-academy.png',_binary ''),(7,'Javascript','https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/480px-Unofficial_JavaScript_logo_2.svg.png',_binary ''),(8,'Kotlin','https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Kotlin_Icon.svg/1200px-Kotlin_Icon.svg.png',_binary ''),(9,'Ruby','https://images.ctfassets.net/23aumh6u8s0i/1X32BMCDrSXJDavN5PTHiM/d2b8244ffbd6e3c6627246dda268836f/Ruby_red_hero.png',_binary ''),(10,'TypeScript','https://res.cloudinary.com/practicaldev/image/fetch/s--cKHeGzUo--/c_imagga_scale,f_auto,fl_progressive,h_900,q_auto,w_1600/https://dev-to-uploads.s3.amazonaws.com/uploads/articles/uf3a8y7xh8aroo95qocz.jpg',_binary ''),(11,'MySQL','https://huynhthaihung.com/wp-content/uploads/2019/07/MySQL-Crack.jpg',_binary ''),(12,'Golang','https://www.bkns.vn/wp-content/uploads/2022/11/golang-Programing.jpg',_binary ''),(14,'SWP391','https://www.bkns.vn/wp-content/uploads/2022/11/golang-Programing.jpg',_binary '');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `avatar` varchar(500) DEFAULT NULL,
  `full_name` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(155) DEFAULT NULL,
  `address` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `user_status` bit(1) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `cv_status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `role` (`role`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'thaoph185','123@!1231',0,'evp1646145818.jpg','Phan Hoàng Thảo','2002-05-18','thaoph185@gmail.com','Vĩnh Phúc','0987654321',2,_binary '',NULL,_binary ''),(2,'daidt175','123',1,'1690294784936.jpg','Đàm Tuấn Đại','2002-05-16','linhvn2@gmail.com','Thạch Thất','0912345689',2,_binary '',NULL,_binary ''),(3,'linhvn','123',0,'1690298748783.jpg','Vũ Ngân Hoàn','2000-01-06','vinhtuan9668@gmail.com','Thạch Thất','0912345678',1,_binary '',NULL,_binary '\0'),(4,'danghq8','123@!1231',1,'1690298222231.jpg','Hoàng Quân Đặng','2002-05-15','danghq8@gmail.com','Thanh Hóa','0869999999',2,_binary '',NULL,_binary ''),(5,'khanhmb88','123@!1231',1,'bgo1656329931.jpg','Ma Bảo Khánh','2002-05-14','khanhmb88@gmail.com','Lào Cai','0978888888',2,_binary '',NULL,_binary ''),(6,'khanglt789','123@!1231',1,'xsb1675068015.jpg','Lại Tuấn Khang','2002-05-13','khanglt789@gmail.com','Hà Nội','0966666666',2,_binary '',NULL,_binary ''),(7,'lelv2002','123@!1231',0,'hpi1671775167.jpg','Linh Vũ Lê','2002-05-12','lelv2002@gmail.com','Yên Bái','0945555555',2,_binary '',NULL,_binary ''),(8,'admin1','123',NULL,'avatar.jpg',NULL,'2002-05-11',NULL,NULL,NULL,3,_binary '',NULL,NULL),(9,'lamnb24','123@!1231',0,'gxn1610077596.jpg','Nguyễn Bảo Lâm','2002-05-10','lamnb24@gmail.com','Phú Thọ','0907777777',2,_binary '',NULL,_binary ''),(10,'tuandv88','123@!1231',0,'kif1650446464.jpg','Đường Vinh Tuấn','2002-05-09','tuandv88@gmail.com','Hải Dương','0933333333',2,_binary '',NULL,_binary ''),(11,'khoahv39','123@!1231',1,'mqu1657168830.jpg','Hoàng Văn Khoa','2002-05-08','khoahv39@gmail.com','Bắc Giang','0954444444',2,_binary '',NULL,_binary ''),(13,'mentee1','123@!1231',1,'avatar.jpg','Nguyễn Thị Linh','2002-05-08','mentee1@gmail.com',NULL,NULL,1,_binary '',NULL,_binary '\0'),(14,'mentee2','123@!1231',0,'avatar.jpg','Nguyễn Văn Tú','2002-05-08','mentee2@gmail.com',NULL,NULL,1,_binary '',NULL,NULL),(15,'mentee3','123@!1231',1,'avatar.jpg','Hoa Văn Thị ','2002-05-08','mentee3@gmail.com',NULL,NULL,1,_binary '',NULL,NULL),(16,'mentee4','123@!1231',0,'avatar.jpg','Nguyễn Văn Mạnh','2002-05-08','mentee4@gmail.com',NULL,NULL,1,_binary '',NULL,NULL),(17,'mentee5','123@!1231',1,'avatar.jpg','Dương  Thị Hoa','2002-05-08','mentee5@gmail.com',NULL,NULL,1,_binary '',NULL,NULL),(18,'tuanvq','123',1,'1690313130744.jpg','Lê Huy Tuấn','2002-05-16','tuanvq1@gmail.com','Thạch Thất','0982134421',2,_binary '',NULL,_binary ''),(19,'hangnt','123',0,'1690313257658.png','Nguyễn Thị Hằng','2002-05-16','hangnt@gmail.com','Thạch Thất','0982134421',2,_binary '',NULL,_binary ''),(20,'hamanhh','123',1,'1690306758766.jpg','Hà Văn Mạnh','2023-07-23','vinhtuan3001@gmail.com','Ha Nam','0987654322',1,_binary '',NULL,NULL),(21,'duydq','Tuanvp123!',1,'1690312385787.jpg','Đào Quang Duy','2023-07-23','duydq@gmail.com','Bac Giang','0987654322',2,_binary '',NULL,_binary ''),(22,'dungdt','123@!1231',0,'1690312846782.jpg','Đặng Thị Dung','2023-07-23','dungdt@gmail.com','Lam Dong','0982134421',2,_binary '',NULL,_binary ''),(23,'tamnt','123',0,'1690313517674.jpg','Nguyễn Thị Tâm','2023-07-23','tamnt@gmail.com','Hà Nội','0982134421',2,_binary '\0',NULL,_binary ''),(24,'chinhbt','123',0,'1690313786615.jpg','Bùi Thị Chinh','2023-07-23','chinhbt@gmail.com','Điện Biên','0982134421',2,_binary '',NULL,_binary ''),(25,'quanglh','123',1,'1690314011897.jpg','Lưu Huy Quang','2023-07-23','quanglh@gmail.com','Thái Nguyên','0982134421',2,_binary '',NULL,_binary ''),(26,'mentee6','123',1,'avatar.jpg','Lê Duy Hoàng','2023-07-23','tuandvhe163181@fpt.edu.vn','Lào Cai','0982134421',1,_binary '',NULL,NULL),(27,'mentee7','123',1,'avatar.jpg','Nguyễn Thị Mai','2000-05-15','mentee7@gmail.com','Hà Nội','0987654321',1,_binary '',NULL,NULL),(28,'mentee8','123',0,'avatar.jpg','Trần Văn An','1998-12-10','mentee8@gmail.com','Hồ Chí Minh','0909090909',1,_binary '',NULL,NULL),(29,'mentee9','123',1,'avatar.jpg','Phạm Thị Hương','1995-09-20','mentee9@gmail.com','Đà Nẵng','0912345678',1,_binary '',NULL,NULL),(30,'mentee10','123',0,'avatar.jpg','Vũ Đức Minh','1997-07-05','mentee10@gmail.com','Hải Phòng','0987654321',1,_binary '',NULL,NULL),(31,'mentee11','123',1,'avatar.jpg','Lê Thị Hà','1999-03-25','mentee11@gmail.com','Nghệ An','0909090909',1,_binary '',NULL,NULL),(32,'mentee12','123',0,'avatar.jpg','Nguyễn Văn Bình','1996-11-15','mentee12@gmail.com','Bình Dương','0912345678',1,_binary '',NULL,NULL),(33,'hieuthu2','Vinhtuan2002!',0,'avatar.jpg','Lê Hữu Đức','2023-07-25','vinhtuan3001@gmail.com','Thái Bình','0987654321',1,_binary '',NULL,NULL),(34,'mentorhai','123',1,'avatar.jpg','Hoàng Duy Quân','2023-07-25','mentor34@gmail.com','Hà Nam','0987654321',2,_binary '',NULL,_binary '\0');
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

-- Dump completed on 2023-07-29 19:56:33
