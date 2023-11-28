-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ptitshop
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `picture` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (11,'/image/QD09/Meo_no.jpg',58,34,'Mèo Nổ [Exploding Kittens]','Với artwork độc đáo, siêu bựa, cách chơi đơn giản, hấp dẫn, những tràng cười sảng khoái cùng bạn bè là những gì bạn nhận được từ Exploding Kittens.'),(12,'/image/QD09/ma_soi.jpg',90,78,'Ma sói [Werewolf]','Một trò chơi đã quá phổ biến và chắc chắn có thể coi đây là một trong những board game nhập môn đáng để chơi. Hãy nhanh tay sở hữu để có những phút giây giải trí cùng bạn bè sau những giờ học căng thẳng'),(13,'/image/QD09/Bang.jpg',45,54,'Bang!','[MIỀN VIỄN TÂY-TIỀN & MÁU- TÌNH YÊU & THÙ HẬN] Trò chơi về miễn viễn tây của nước Mỹ vào những năm 1960 sau thế chiến thứ 2. Một nước Mỹ mới đang được hình thành và xây dựng lại từ đầu với tự do và niềm khao khát.'),(14,'/image/QD09/bong_da_1.jpg',298,35,'Bóng đá Paledas','- Môn thể thao vua ngày càng phát triển cùng với đó là việc các trận đấu diễn ra ngày càng chuyên nghiệp,căng thẳng, quyết liệt hơn và hấp dẫn hơn.  - Đóng góp cùng với trận thi đấu tuyệt vời đó chính là quả bóng tiêu chuẩn thi đấu  - Quả bóng đá Paledas tiêu chuẩn chất lượng, chính hãng'),(15,'/image/QD09/bong_da_2.jpg',955,5,'Bóng đá Động Lực','Bóng đá Động Lực UHV 2.05 tiêu chuẩn FIFA QUALITY size Số 5  - Thương hiệu: Động Lực  - Xuất xứ thương hiệu: Việt Nam  - Bộ sản phẩm bao gồm: 1 Quả Bóng Đá Động Lực UHV 2.05 Số 5, 1 Kim bơm bóng, 1 lưới đựng bóng. UHV 2.05 Số 5 là bóng thi đấu chính thức tại các giải thi đấu vô địch quốc gia từ những năm 2000'),(16,'/image/QD09/bong_chuyen.jpg',250,30,'Bóng chuyền Động Lực','Bóng chuyền da Động Lực DL 200, bóng chuyền hơi Jatan - Thương hiệu: Động Lực - Xuất xứ thương hiệu: Việt Nam - Bóng chuyền DL 200 được thiết kế và sản xuất theo tiêu chuẩn đảm bảo chất lượng thi đấu về độ bền và độ chịu lực thể hiện đẳng cấp sản phẩm của Động Lực. - Bóng chuyền DL 200 sản xuất theo tiêu chuẩn thi đấu: Chất lượng của sản phẩm đáp ứng mọi nhu cầu thi đấu trong nước và quốc tế, có độ nảy và độ bám tốt, giúp người chơi dễ nắm bắt bóng và thực hiện kỹ thuật chuẩn xác hơn.'),(17,'/image/QD09/cau_long.jpg',179,77,'Vợt cầu lông Boshika','Vợt cầu lông chính hãng (02 chiếc) chất lượng cao full mẫu, bộ cầu lông tặng kèm 3 quả cầu   - Bộ vợt cầu lông gồm 2 chiếc vợt với nhiều ưu điểm nổi bật  - Tay cầm vợt được làm bằng gỗ bọc, giúp bạn cầm nắm vợt được chắc chắn hơn.  - Vợt được thiết kế theo tiêu chuẩn thi đấu.  - Vợt có khung và cán được làm bằng chất liệu siêu bền, có khả năng chịu lưc tốt.  - Bộ vợt cầu lông là sự lựa chọn phù hợp với các lứa tuổi từ học sinh đến sinh viên  - Rèn luyện thể thao nâng cao sức khỏe  - Mua vợt các bạn được tặng 3 quả cầu lông'),(18,'/image/QD09/tthcm.png',15,1000,'Giáo trình Tư tưởng Hồ Chí Minh','Bài giảng được biên soạn thành 6 chương: chương 1 xác định đối tượng, phương pháp nghiên cứu, ý nghĩa học tập môn Tư tưởng Hồ Chí Minh, chương 2 trình bày  cơ sở, quá trình hình thành và phát triển Tư tưởng Hồ Chí Minh, từ chương 3 đến chương 6 đi sâu tập trung trình bày những nội dung cơ bản trong Tư tưởng Hồ Chí Minh.'),(19,'/image/QD09/lthdt.png',15,1777,'Giáo trình Lập trình hướng đối tượng','Bài giảng Lập trình hướng đối tượng'),(20,'/image/QD09/cnxhkh.png',15,2345,'Giáo trình Chủ nghĩa xã hội khoa học','Bài giảng Chủ nghĩa xã hội khoa học'),(21,'/image/QD09/lsd.png',15,563,'Giáo trình Lịch sử Đảng','Bài giảng Lịch Sử Đảng'),(22,'/image/QD09/nnltcpp.png',15,1324,'Giáo trình Ngôn ngữ lập trình C++','Bài giảng Ngôn ngữ lập trình C++'),(23,'/image/QD09/trr1.png',15,1236,'Giáo trình Toán rời rạc 1','Bài giảng Toán rời rạc 1'),(24,'/image/QD09/trr2.png',15,312,'Giáo trình Toán rời rạc 2','Bài giảng Toán rời rạc 2'),(25,'/image/QD09/ltvp.png',15,567,'Giáo trình Lập trình với Python','Bài giảng Lập trình với Python');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `qty` int NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4mnqtf4139vf6gkwq025xc6sw` (`article_id`),
  KEY `FKen9v41ihsnhcr0i7ivsd7i84c` (`order_id`),
  KEY `FKjnaj4sjyqjkr4ivemf9gb25w` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,1,'43',422,398,3,NULL),(2,1,'43',416,398,3,NULL);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6q8bge2ta5as4srmi31dmhd4q` (`article_id`),
  CONSTRAINT `FK6q8bge2ta5as4srmi31dmhd4q` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (11,'Giải trí',11),(12,'Giải trí',12),(13,'Giải trí',13),(14,'Thể thao',14),(15,'Thể thao',15),(16,'Thể thao',16),(18,'Thể thao',17),(19,'Học tập',18),(20,'Học tập',19),(21,'Học tập',20),(22,'Học tập',21),(23,'Học tập',22),(24,'Học tập',23),(25,'Học tập',24),(26,'Học tập',25);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color`
--

DROP TABLE IF EXISTS `color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkubp2whk688bnndqjfuf5t90` (`article_id`),
  CONSTRAINT `FK6rnnr3tg7j7netalup2k715i2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color`
--

LOCK TABLES `color` WRITE;
/*!40000 ALTER TABLE `color` DISABLE KEYS */;
INSERT INTO `color` VALUES (5,'Đỏ',11),(6,'Đen',12),(7,'Vàng',13),(8,'Đỏ',14),(9,'Trắng',14),(10,'Đen',14),(11,'Trắng',15),(12,'Đỏ',15),(13,'Đen',15),(14,'Vàng',16),(15,'Xanh dương',16),(19,'Xanh dương',17),(20,'Cam',17),(21,'Hồng',17),(22,'Trắng',18),(23,'Trắng',19),(24,'Trắng',20),(25,'Trắng',21),(26,'Trắng',22),(27,'Trắng',23),(28,'Trắng',24),(29,'Trắng',25);
/*!40000 ALTER TABLE `color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (404);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver` varchar(255) DEFAULT NULL,
  `address_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj6ayrlwisv2n1yalmjxjlu62p` (`address_id`),
  KEY `FKlh4uncaukk0s3poj5pmv9cm9u` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'Testy Testa',3,398);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `article_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKriswouj487lavsl7otim4ky9v` (`article_id`),
  CONSTRAINT `FKay7w2i4m8f9bxwss6w7c4eo52` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (11,'Board game',11),(12,'Board game',12),(13,'Board game',13),(14,'Dụng cụ thể thao',14),(15,'Dụng cụ thể thao',15),(16,'Dụng cụ thể thao',16),(18,'Dụng cụ thể thao',17),(19,'Giáo trình',18),(20,'Giáo trình',19),(21,'Giáo trình',20),(22,'Giáo trình',21),(23,'Giáo trình',22),(24,'Giáo trình',23),(25,'Giáo trình',24),(26,'Giáo trình',25);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `address_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKddefmvbrws3hvl5t0hnnsv8ox` (`address_id`),
  CONSTRAINT `FKddefmvbrws3hvl5t0hnnsv8ox` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin@admin.com',NULL,NULL,'$2a$12$0gPEsF.welo8h4R/s8fkxuPYLTpHeps1S3gRn4OhlQ234SeZ.IoDa','admin',NULL),(2,'hoanhq@ptit.edu.vn',NULL,NULL,'$2a$12$3nDpwjwLq7FIrqGkvpk4werKMYohgynGhLrcpv6DLg8DVnOCfGq66','hoanhq',NULL),(3,'manhnd@ptit.edu.vn',NULL,NULL,'$2a$12$il1IYsWMFX5z4ZiZO18O9uedfdvyRIQwkbEr.76gcHaEkTyL1arAi','manhnd',NULL),(4,'dattq@ptit.edu.vn',NULL,NULL,'$2a$12$0dn6nMxKJWCweyk3Femw3uDeciuWZVuwgp6VMvX0mgc/KeuMUTNfG','dattq',NULL),(5,'hoangbh@ptit.edu.vn',NULL,NULL,'$2a$12$i8AYxMDqvclGau4oNoFFIOCkTf4COMCzcZu2TyHvCx9pG1At/W8X2','hoangbh',NULL),(6,'hangptt@ptit.edu.vn',NULL,NULL,'$2a$12$2VFwUf23SFUVf3vTz0ug2.i/f7ZiyCdsHcJ98Xa2Ou/yQ5iZf.s3a','hangptt',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_order`
--

DROP TABLE IF EXISTS `user_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_order` (
  `id` bigint NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `order_total` decimal(19,2) DEFAULT NULL,
  `shipping_date` datetime DEFAULT NULL,
  `shipping_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1hx9xau7q5xwgxjtq63lr7eeg` (`shipping_id`),
  KEY `FKj86u1x7csa8yd68ql2y1ibrou` (`user_id`),
  CONSTRAINT `FK1hx9xau7q5xwgxjtq63lr7eeg` FOREIGN KEY (`shipping_id`) REFERENCES `shipping` (`id`),
  CONSTRAINT `FKj86u1x7csa8yd68ql2y1ibrou` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_order`
--

LOCK TABLES `user_order` WRITE;
/*!40000 ALTER TABLE `user_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` bigint NOT NULL,
  `role_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (392,1,1),(393,2,1),(395,1,2),(397,1,3),(399,1,2),(400,1,3),(401,1,4),(402,1,5),(403,1,6);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-28 15:26:50
