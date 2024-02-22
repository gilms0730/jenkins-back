-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: campingontopdb.ce1uochkjb2w.ap-northeast-2.rds.amazonaws.com    Database: campingontopDB
-- ------------------------------------------------------
-- Server version	8.0.32

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `check_in` date DEFAULT NULL,
                        `check_out` date DEFAULT NULL,
                        `created_at` datetime(6) NOT NULL,
                        `price` int DEFAULT NULL,
                        `status` bit(1) DEFAULT NULL,
                        `updated_at` datetime(6) DEFAULT NULL,
                        `house_id` bigint DEFAULT NULL,
                        `user_id` bigint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `FKk0pm4nne87bouv1sewrdgrh5j` (`house_id`),
                        KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
                        CONSTRAINT `FKk0pm4nne87bouv1sewrdgrh5j` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                        CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (5,'2024-02-08','2024-02-10','2024-02-05 07:00:01.525633',2400000,_binary '','2024-02-05 07:00:01.525636',16,89),(7,'2024-02-16','2024-02-23','2024-02-06 00:32:10.988756',8400000,_binary '','2024-02-06 00:32:10.988765',16,199),(8,'2024-02-06','2024-02-08','2024-02-06 03:19:49.540644',328000,_binary '','2024-02-06 03:19:49.540653',41,1),(10,'2024-02-14','2024-02-15','2024-02-06 07:09:20.372112',100000,_binary '','2024-02-06 07:09:20.372121',5,1),(11,'2024-02-14','2024-02-16','2024-02-06 07:09:32.298843',200000,_binary '','2024-02-06 07:09:32.298846',5,1);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `email_verify`
--

DROP TABLE IF EXISTS `email_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_verify` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `email` varchar(255) DEFAULT NULL,
                                `token` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_verify`
--

LOCK TABLES `email_verify` WRITE;
/*!40000 ALTER TABLE `email_verify` DISABLE KEYS */;
INSERT INTO `email_verify` VALUES (1,'dlaxodn9999@gmail.com','06749009-f0a3-4a48-80ff-090930f1cbf2'),(2,'zofnapf@naver.com','e7c773d8-8e7a-4f57-b4e4-56071546614f'),(3,'ell950404@gmail.com','489c9faa-c6bf-4ba6-ae98-2c040b750da6'),(9,'poil42@naver.com','94e557a9-17ed-4861-95d1-40ac947f4992'),(16,'ewoo97@naver.com','6502f6b9-06c9-43dd-b2aa-0865460c1b85'),(17,'test01@test.com','40cdb400-3083-4883-91a4-8545a3afa050'),(18,'poil422023@gmail.com','880e79f3-3777-4f92-93d4-6eb0df751953');
/*!40000 ALTER TABLE `email_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house`
--

DROP TABLE IF EXISTS `house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `address` varchar(255) DEFAULT NULL,
                         `content` varchar(255) DEFAULT NULL,
                         `created_at` datetime(6) NOT NULL,
                         `has_air_conditioner` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_bed` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_heater` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_washing_machine` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `latitude` double DEFAULT NULL,
                         `like_cnt` int DEFAULT NULL,
                         `longitude` double DEFAULT NULL,
                         `max_user` int DEFAULT NULL,
                         `name` varchar(255) DEFAULT NULL,
                         `price` int DEFAULT NULL,
                         `status` bit(1) DEFAULT NULL COMMENT '0: 비활성화 | 1: 활성화',
                         `updated_at` datetime(6) DEFAULT NULL,
                         `user_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK5pth02tinuneavlhgv8g4b1wa` (`user_id`),
                         CONSTRAINT `FK5pth02tinuneavlhgv8g4b1wa` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house`
--

LOCK TABLES `house` WRITE;
/*!40000 ALTER TABLE `house` DISABLE KEYS */;
INSERT INTO `house` VALUES (4,'서울시 동작구 보라매','실내에서 홍대 밤하늘을 볼 수 있는 낭만적 모임공간','2024-02-05 02:38:55.088314',_binary '',_binary '',_binary '',_binary '',37.4555,1,126.5355,4,'루탑 어필 파티',1000000,_binary '','2024-02-06 02:04:37.521302',2),(5,'경기도 성남시 수정구 산성대로','도심 속 아늑한 쉼터 꽃탑입니다.','2024-02-05 02:49:09.143490',_binary '',_binary '',_binary '',_binary '',30.5454,2,126.5656,16,'루프탑 & 바베큐&편안한 분위기',100000,_binary '','2024-02-05 16:11:17.447260',3),(6,'경기도 가평군','자연 속에서의 평화로운 모임을 위한 공간','2024-02-05 02:51:29.271182',_binary '',_binary '',_binary '',_binary '',37.8319,2,127.5095,4,'숲속 은신처 루프탑 파티',130000,_binary '','2024-02-06 05:58:10.446056',2),(7,'서울시 마포구','고층 건물의 최상층에서 멋진 도시 전망을 즐길 수 있는 고급 모임공간. 도심의 야경을 배경으로 특별한 모임이나 파티를 계획해보세요.','2024-02-05 02:52:20.092977',_binary '',_binary '',_binary '',_binary '',37.5665,0,126.978,4,'도시 전망대',1000000,_binary '','2024-02-05 02:52:20.092981',2),(9,'서울시 동작구 보라매','도심의 빌딩 숲 속에 위치한 옥상에서 별빛 아래 캠핑을 즐길 수 있는 이색적인 공간. 서울의 밤하늘과 함께하는 낭만적인 캠핑 경험을 제공합니다. 모던한 도시 생활과 자연의 휴식이 어우러진 곳에서 친구들 또는 가족과 함께 잊지 못할 추억을 만들어보세요. 옥상에 설치된 텐트와 바베큐 시설을 이용해 도심 속에서도 완벽한 캠핑의 즐거움을 누릴 수 있습니다.','2024-02-05 02:54:42.852424',_binary '\0',_binary '\0',_binary '',_binary '\0',37.4555,1,126.5355,4,'옥상 캠핑 오아시스',1000000,_binary '','2024-02-05 06:59:38.936573',2),(10,'서울시 중구','바쁜 도시 생활에서 벗어나 옥상 위에서 별을 바라보며 휴식을 취할 수 있는 공간. 도심에서의 캠핑을 통해 자연과 가까워질 수 있는 기회를 제공합니다.','2024-02-05 02:55:24.596273',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5643,1,126.9977,4,'도심 속 별빛 캠핑',1000000,_binary '','2024-02-05 12:37:12.853726',2),(11,'서울시 동작구 신대방삼거리','삼거리 핫플레이스','2024-02-05 02:57:01.026780',_binary '',_binary '',_binary '',_binary '',37,2,25,8,'신대방삼거리 옥탑방',200000,_binary '','2024-02-06 00:31:27.897132',4),(12,'서울시 강남구','옥상을 개조하여 만든 캠핑 공간에서는 도시의 소음에서 벗어나 평온을 찾을 수 있습니다. 모닥불 주변에서 친구들과 이야기를 나누며 즐거운 시간을 보내세요.','2024-02-05 02:57:10.507138',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5172,1,127.0473,4,'옥상 휴식처',1000000,_binary '','2024-02-06 03:47:47.299605',2),(13,'서울시 성동구','도시에서는 드물게 새벽의 조용함과 함께 할 수 있는 공간입니다. 옥상에서 맞이하는 새벽의 첫 빛과 함께 평화로운 시간을 보내세요.','2024-02-05 02:58:53.167644',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5636,0,127.0371,4,'옥상에서 볼 수 있는 새벽',1000000,_binary '','2024-02-05 02:58:53.167648',2),(14,'서울시 종로구','천체 관측을 즐길 수 있는 특별한 옥상 공간. 도시의 빛 속에서도 별을 관측할 수 있는 기회를 제공합니다. 천체 망원경을 이용해 밤하늘의 아름다움을 탐험하세요.','2024-02-05 03:00:11.025041',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5726,0,126.9794,4,'도심 옥상의 별 관측',1000000,_binary '','2024-02-05 03:00:11.025046',2),(15,'서울특별시 성북구 안암로','고려대 인근 지하철 6호선 안암역 근처','2024-02-05 03:02:38.565419',_binary '',_binary '',_binary '',_binary '',27.5954,1,127.5126,2,'도심속 테라스 감성 글램핑',160000,_binary '','2024-02-05 12:36:58.102190',3),(16,'서울시 서초구','도심의 빛 속에서도 별자리를 찾을 수 있는 이색적인 경험을 제공합니다. 전문가가 진행하는 별자리 탐험 워크숍을 통해 밤하늘의 이야기를 듣고, 천체 망원경으로 신비로운 우주를 탐험하세요. 옥상에서 즐기는 이 독특한 활동은 가족 단위 방문객들에게 교육적이면서도 재미있는 경험을 선사합니다. 별빛 아래 준비된 따뜻한 캠프파이어와 함께하는 시간은 모두에게 잊지 못할 추억을 만들어 줄 것입니다.','2024-02-05 03:11:27.591954',_binary '\0',_binary '\0',_binary '',_binary '\0',37.4837,1,127.0324,6,'도심 속 별자리 탐험',1200000,_binary '','2024-02-05 06:01:06.172666',2),(17,'전라북도 전주시','전통과 현대의 조화를 느껴보세요.','2024-02-05 03:12:08.223299',_binary '',_binary '',_binary '',_binary '',37,0,127.1086,3,'전주 옥탑',150000,_binary '','2024-02-05 03:12:08.223303',4),(19,'서울시 강서구 화곡동 114-11','도심의 번화함 속에서도 평화를 찾을 수 있는 별빛 아래 옥상 캠핑은 청량한 밤공기와 함께 도시의 야경을 감상할 수 있는 이상적인 공간입니다. 여기서는 도심에서의 캠핑을 새로운 레벨로 끌어올리며, 친구들과 함께 특별한 밤을 보낼 수 있습니다.','2024-02-05 03:13:20.968761',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5412,1,126.8372,4,'별빛 아래 옥상 캠핑',1350000,_binary '','2024-02-06 07:10:05.720116',2),(20,'대구광역시 중구','대구 도심에서 현대적인 휴식을 경험하세요.','2024-02-05 03:14:21.581111',_binary '',_binary '',_binary '',_binary '',35.8669,0,128.5939,4,'대구 도심 속 옥탑방',95000,_binary '','2024-02-05 03:14:21.581116',4),(21,'서울시 성동구 성수동 2가 333-22','옥상 위에 조성된 녹색 공간에서 자연의 소리를 들으며 편안한 밤을 보낼 수 있는 캠핑 공간입니다. 이곳은 바쁜 일상에서 벗어나 자연과 하나가 되고 싶은 이들을 위한 완벽한 휴식처입니다.','2024-02-05 03:14:55.342227',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5374,0,127.0498,4,'도심 속 자연 캠핑',1450000,_binary '','2024-02-05 03:14:55.342231',2),(22,'서울시 용산구 이태원동 56-13','도심의 밤하늘 아래, 옥상에서 즐기는 영화 상영회입니다. 이곳에서는 최신 영화나 고전 명작을 친구들과 함께 별빛 아래에서 감상할 수 있습니다. 영화 상영 전 바베큐 파티로 배를 채우고, 영화가 시작되면 도심의 밤과 함께하는 특별한 경험을 즐길 수 있습니다.','2024-02-05 03:16:11.259821',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5342,0,126.9935,4,'옥상 별빛 영화관',1500000,_binary '','2024-02-05 03:16:11.259826',2),(24,'서울시 종로구 인사동 12-4','환상적인 별빛 조명과 함께하는 옥상 파티 공간입니다. 도심의 밤하늘 아래, 음악과 댄스, 맛있는 음식으로 가득한 이곳에서 친구들과 잊지 못할 밤을 보낼 수 있습니다. 도시의 야경을 배경으로 특별한 이벤트나 모임을 개최하기에 완벽한 장소입니다.','2024-02-05 03:29:14.406696',_binary '\0',_binary '\0',_binary '',_binary '\0',37.573,0,126.9838,4,'별빛 조명 아래 옥상 파티',1700000,_binary '','2024-02-05 03:29:14.406701',2),(25,'서울시 강남구 청담동 88-7','옥상에 마련된 텃밭에서 직접 재배한 채소로 식사를 준비할 수 있는 이색 캠핑 경험입니다. 자연과 더욱 가까워질 수 있는 이 공간에서는 도심 속에서도 지속 가능한 생활을 실천하며 캠핑을 즐길 수 있습니다.','2024-02-05 03:31:13.419845',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5248,1,127.0493,4,'옥상 텃밭과 함께하는 캠핑',1550000,_binary '','2024-02-06 07:12:04.227113',2),(26,'서울시 강남구 신사동 511','옥상 텃밭에서 직접 재배한 신선한 채소와 허브를 사용하여 요리하는 법을 배울 수 있는 워크숍입니다. 이곳에서는 지속 가능한 먹거리에 대한 인식을 높이고, 맛있고 건강한 요리를 직접 만들어 볼 수 있는 기회를 제공합니다.','2024-02-05 03:33:13.313194',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5178,0,127.0203,5,'송파 퀸즈 파',1500000,_binary '','2024-02-05 03:33:13.313198',2),(27,'서울시 영등포구 여의도동 23-5','도심 속 조용한 옥상 정원에서 명상과 휴식을 취할 수 있는 공간입니다. 이곳은 바쁜 일상에서 벗어나 마음의 평화를 찾고, 자연과 함께하는 명상을 통해 정신적, 육체적 재충전을 할 수 있는 이상적인 장소입니다.','2024-02-05 03:33:41.538122',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5215,0,126.9264,4,'옥상 정원 명상 및 휴식 공간',1300000,_binary '','2024-02-05 03:33:41.538126',2),(28,'서울시 중구 명동 32-2','별빛 아래에서의 음악회는 도심 속에서도 문화와 예술을 즐길 수 있는 특별한 경험을 제공합니다. 이곳에서는 다양한 장르의 음악가들이 방문하여 감성적인 밤을 선사합니다. 음악, 자연, 그리고 도시의 조화로운 만남을 경험해 보세요.','2024-02-05 03:35:18.142383',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5639,1,126.9857,5,'도심 옥상 별빛 음악회',1750000,_binary '','2024-02-05 16:03:12.511491',2),(29,'서울시 강동구 암사동 467-1','도심의 야경을 배경으로 친구들과 함께하는 옥상 바베큐 파티. 모던한 바베큐 시설과 편안한 야외 좌석이 준비되어 있어, 맛있는 식사와 함께 잊지 못할 밤을 보낼 수 있습니다.','2024-02-05 03:42:12.050495',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5507,1,127.1274,6,'옥상 바베큐 및 파티 공간',1850000,_binary '','2024-02-05 05:23:29.777603',2),(30,'서울시 서초구 방배동 455-10','도심 속 녹색 정원으로 변신한 옥상에서 자연과 함께하는 휴식을 취할 수 있습니다. 이 공간은 도시 생활에서 잠시 벗어나, 식물과 함께 평화로운 시간을 보낼 수 있는 완벽한 장소입니다.','2024-02-05 03:42:57.394278',_binary '\0',_binary '\0',_binary '',_binary '\0',37.4963,0,126.983,5,'옥상 녹색 정원 및 휴식 공간',1250000,_binary '','2024-02-05 03:42:57.394283',2),(31,'서울시 용산구 한남동 72-1','천체 망원경을 이용하여 도심 속에서도 별을 관찰할 수 있는 스타가저의 밤. 전문가의 안내로 우주의 신비를 탐험하고, 별자리 이야기를 들으며 낭만적인 밤을 보낼 수 있습니다.','2024-02-05 03:43:45.043924',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5374,0,127.0005,4,'옥상 스타가저의 밤',1950000,_binary '','2024-02-05 03:43:45.043928',2),(32,'서울시 중랑구 면목동 157-33','전문 사진가의 안내로 도심의 야경을 멋지게 담을 수 있는 사진 촬영 워크숍. 이 공간은 사진 촬영 기술을 향상시키고, 도시의 아름다움을 새로운 시각으로 발검할 수 있는 기회를 제공합니다.','2024-02-05 03:44:27.098741',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5849,0,127.0883,6,'옥상 야경 사진 촬영 워크숍',1750000,_binary '','2024-02-05 03:44:27.098745',2),(33,'서울시 동작구 상도동 169-22','예술가의 지도 하에 도심 속 옥상에서 진행되는 미술 및 그래피티 워크숍. 이곳에서 참가자들은 자신의 창의력을 발휘하여 옥상 벽에 멋진 작품을 만들어낼 수 있습니다. 예술 작품을 통해 도시 공간을 아름답게 변화시키는 경험을 할 수 있습니다.','2024-02-05 03:44:56.120685',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5022,0,126.9478,5,'옥상 미술 및 그래피티 워크숍',1650000,_binary '','2024-02-05 03:44:56.120689',2),(34,'서울시 노원구 공릉동 389-5','도심 속 옥상에서 시작하는 아침 요가 세션으로 하루를 상쾌하게 시작하세요. 전문 요가 강사의 지도 하에 진행되는 이 세션은 몸과 마음을 깨우고, 하루 종일 지속될 에너지를 충전하는 데 도움을 줍니다.','2024-02-05 03:46:38.457603',_binary '\0',_binary '\0',_binary '',_binary '\0',37.6259,0,127.0728,5,'옥상에서의 아침 요가 세션',1200000,_binary '','2024-02-05 03:46:38.457607',2),(35,'서울시 성북구 동선동 1가 89-10','자연에서 영감을 받은 미술 수업을 옥상에서 진행합니다. 참가자들은 자연 소재를 활용하여 예술 작품을 만들고, 도심 속에서 자연의 아름다움을 재발견하는 시간을 가질 수 있습니다.','2024-02-05 03:47:23.146777',_binary '\0',_binary '\0',_binary '',_binary '\0',37.5924,0,127.0169,6,'옥상에서의 자연 친화적 미술 수업',1300000,_binary '','2024-02-05 03:47:23.146780',2),(36,'서울시 영등포구 신풍로 77','아주 아주 멋이 있는 빛이 나는 숙소','2024-02-06 01:38:56.755167',_binary '\0',_binary '',_binary '\0',_binary '',37.7777,0,126.6666,5,'상당히 대단한 숙소',140000,_binary '','2024-02-06 01:38:56.755199',1),(37,'서울시 동작구 신대방45동','아름다운 캠핑 숙소 동작구 최고','2024-02-06 02:06:25.717124',_binary '',_binary '',_binary '\0',_binary '',37.7777,0,126.66666,4,'아름다운 캠핑 숙소',40000,_binary '','2024-02-06 02:06:25.717128',1),(38,'신대방 삼거리 역앞 5분거리','신대방 삼거리 숙소입니다 와서 재밌게 놀다가세요','2024-02-06 02:13:44.343969',_binary '\0',_binary '',_binary '\0',_binary '',12.25,0,25.6,6,'신대방 삼거리 숙소',20000,_binary '','2024-02-06 02:13:44.343973',1),(39,'서울 중구 쌍림동 ','도심 속 루프탑 캠핑. 단독으로 옥상 사용 가능합니다.','2024-02-06 02:18:13.076196',_binary '\0',_binary '',_binary '',_binary '\0',36.66666,0,127.8888,4,'서울 루프탑 시티캠핑 캠핑온탑',300000,_binary '','2024-02-06 02:18:13.076201',1),(40,'서울 강서구 마곡동 800-3','깔끔한 실내와 프라이빗한 테라스 바베큐 파티','2024-02-06 02:20:35.041689',_binary '',_binary '',_binary '',_binary '',37.7777,0,126.66677,5,'마곡파티룸 블랑 블랑 바베큐, 노래방',70000,_binary '','2024-02-06 02:20:35.041693',1),(41,'서울시 종로구 인사동 12-4','킵아워홀리데이는 여러분들의 소중한 휴일 만족스러운 하루를 위해 고민하여 디자인된 숙소입니다. 집은 엘리베이터가 있는 4층에 위치하고 있어 아늑하고 커플이나 가족과 함께 편안하게 지낼 수 있습니다 :) 홍대입구역 1번출구에서 8분거리로 조용하고 시끄럽지 않은 곳입니다.','2024-02-06 03:15:13.812288',_binary '',_binary '',_binary '',_binary '',37.573,1,126.9838,4,'Keep.our.Holiday A<테라스가있는집',164000,_binary '','2024-02-06 03:19:23.813980',1),(42,'서울 강남구 테헤란로4길','다목적 활용 가능한 강남 루프탑 복합공간','2024-02-06 03:49:56.364196',_binary '',_binary '',_binary '',_binary '',36.66655,0,127.555555,10,'Nick 파티룸',700000,_binary '','2024-02-06 03:49:56.364201',1),(43,'서울시 영등포구 신풍로 7744','최고의 숙소 조선','2024-02-06 06:20:03.263958',_binary '',_binary '\0',_binary '\0',_binary '',36.6663366,0,126.45454,4,'아주 멋있는 최고의 숙소 조선',440000,_binary '','2024-02-06 06:20:03.263997',1),(44,'서울 동작구 신대방2동','야경이 아름다운 옥탑에서 힐링하고 가세요','2024-02-06 06:20:12.069444',_binary '\0',_binary '\0',_binary '\0',_binary '\0',27.4434,0,127.9523,4,'야경맛집 옥탑방',250000,_binary '','2024-02-06 06:20:12.069448',3),(45,'신대방 삼거리 역앞 10분거리','신대방 삼거리 숙소입니다 와서 재밌게 놀다가시오','2024-02-06 06:22:37.280332',_binary '',_binary '\0',_binary '\0',_binary '',12.25,0,25.55,5,'신대방 삼거리 새로운 숙소',50000,_binary '','2024-02-06 06:22:37.280336',1);
/*!40000 ALTER TABLE `house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_image`
--

DROP TABLE IF EXISTS `house_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_image` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `filename` varchar(255) DEFAULT NULL,
                               `house_id` bigint DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FK104wpfee48k83abm6v1k3jcq6` (`house_id`),
                               CONSTRAINT `FK104wpfee48k83abm6v1k3jcq6` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_image`
--

LOCK TABLES `house_image` WRITE;
/*!40000 ALTER TABLE `house_image` DISABLE KEYS */;
INSERT INTO `house_image` VALUES (9,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/818eb6fc-2698-4072-8446-f1b7f7f49fea_169794731_dc083d76e548b4d867a8f8f653d8c5b3.jpg',4),(10,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/327a6c89-7bf8-4aee-a117-46107fcdf4d6_170005225_78770f74711ac5110cf222416d2b1d40.jpg',4),(11,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/92b1cd0e-8dbc-41ef-a12c-ced5a830c307_170005236_454cee04bbe9d9de819166997bc495fb.jpg',4),(12,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/20f09d28-585b-4634-aeba-c5c7ac42a6ea_169743831_c27528df94380baebd03d2145b9c5390.jpg',4),(13,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/301a5737-4946-40fd-9b17-8fc3a5735a52_170306764_8798b0ebb2128baae62995a3bfb5f12a.jpg',5),(14,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/27330794-948d-4070-99ef-0e0623f2ea6a_168629366_d8dc80ec3700e272a176b9418343617e.jpg',5),(15,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/61b04979-c84e-4539-8243-776854219453_168629529_2bd9b9dbfe9a8065c27489f1b7d001a1.jpg',5),(16,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/36916411-f311-455f-9038-4f15d8935b10_170306762_e0bcc1847b405c044035addb0bfa5e86.jpg',5),(17,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/99ea157f-7d9d-4162-8327-ce8e9bbbe625_170306761_8e0de9a23099b0b6230df0cd433aff77.jpg',5),(18,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/45a566d2-109c-4103-83f7-503775b400d5_169018515_31a8622ae30f9d6e80d6e7c5c1e6f5ec.jpg',6),(19,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/e3239d36-2101-4a7f-95d4-9e87da5ca290_169018522_b437e98ad0b88ef0d6419796efb69895.jpg',6),(20,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/bc11472c-0c78-4354-b102-e0ea8c4b0a61_169042686_28f5129b38ad6497a391ce9646eb20fe.jpg',6),(21,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f72b6d29-8186-4220-8e2d-fabe94fcf1fb_169042688_0c6904245271fed92f2f17ef98423666.png',6),(22,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/163e831d-cadf-495b-83be-a22084b8d4d4_169867483_799bad5a3b514f096e69bbc4a7896cd9.jpg',7),(23,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/c96100f0-835a-4cae-89da-4ce7c6ce0b0e_169867483_156005c5baf40ff51a327f1c34f2975b.jpg',7),(24,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/58605e60-b5a4-41cf-a3ab-b4b63548762c_169919553_7d30c229376af5fb021d53c30f22259a%20%281%29.jpeg',7),(25,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d0f6686c-0e67-4540-bc22-d750137b50fa_169919553_7d30c229376af5fb021d53c30f22259a.jpeg',7),(30,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/b6be2950-f505-41ca-acd9-889c2ce291f1_166425865_a18bebdf948fe0242011e4b8b2b21a05.jpg',9),(31,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/5ac90f4f-9f46-4687-bbd0-865ee18f2b7d_166425865_f0ee844a9270dd69db07f0039016922c.jpg',9),(32,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/8b87ee0a-e254-40f7-8731-e839d90e0cbc_166425867_a2731c84977e4aee8821af9075f7511a.jpg',9),(33,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/608c7eda-eecc-4217-a941-1399af35ad16_166425867_da6353d0fe417edb5aedeb90aed16c08.jpg',9),(34,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f43bf264-18b8-41f4-ae7d-309203248e0a_166425867_e681b2eeda452411f8877cedba5bbe98.jpg',9),(35,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/0edb5397-560f-44c4-872d-d9d7fcd88484_166381422_ad4f07c418f5072f86e10debf9bdeaf1.jpg',10),(36,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/018536fd-e1e2-433b-845f-880d6fa9c8f9_166381424_f441df2611db6aed19340a0075f97fba.jpg',10),(37,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/0193e35b-b815-4161-9ca7-05dba41fd001_166381425_216d2f663e1f411f1ae244e86df1222b.jpg',10),(38,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/5adca5eb-1f03-43fa-be07-7c7f9dfb9d93_166381425_790660aa3d7d3f891b6e7f37c435e805.jpg',10),(39,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/847cd283-18c0-4ed5-8fb3-5469d2add31a_166381426_674a7231f72b6d5ba9f39ddca5cd4445.jpg',10),(40,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/a2ee8cf7-eecf-4e97-8eef-36a32920bff3_20161108150147x3O6EGmBmS.jpg',11),(41,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3484619c-f56d-43e7-94fa-e0e505880b94_%EC%98%A5%ED%83%80%EB%B0%A94.jpg',11),(42,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3bc11df2-d942-4fc9-a340-a85fb0619b1d_170315334_61e6469c44c81e3b12de8a9fe8b40ffc.jpg',12),(43,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/4a3fb5fc-5f93-4f67-8c6f-8628159caf1f_170315334_a03853bb0aeb65db1bfabaabc99a187e.jpg',12),(44,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/11bacd42-7ff3-4835-b624-43f563b17f59_170315340_3719e54665308a761f166127a9ff880e.jpg',12),(45,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f623bf45-9499-471e-9aa1-66b56666dd43_170315340_a4ffda0ce4de2bb314d095ce81644197.jpg',12),(46,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/026b777d-c731-437c-ab74-b8514ed6b2fc_170315341_35bfaafd4a015b1fa479f3c6c6f8fefc.jpg',12),(47,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/396f02a7-b94e-45d8-90b0-9e001eff6e07_170315511_57af7b29c20f85d8173f2e2ba25cb12e.jpg',12),(48,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/b64c31f7-5a42-43e3-8d82-3248cff7fcb3_170300485_b89ccd51e2c5348a40769e9a41515c85.jpg',13),(49,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/59d8662f-d722-4067-869f-0717d145fe71_170300486_f86045d0315b7f500c2213d8f8d10403.jpg',13),(50,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3a5d6a7a-f3e7-4653-a426-420319674094_170300492_64b51a2ebdb1a1bc7f548275db1630b9.jpg',13),(51,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/c18bc753-be8b-4480-8f5b-92ac234c2910_170300493_786eefc2163d716d7fc344c0a2735c6e.jpg',13),(52,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/2aa36e8e-d861-4dab-85f5-adeb7caf608e_170193601_079e60cef406e8ee37a21fe6e0d84dbb.jpg',14),(53,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/615a0c9f-0261-4e6b-8a82-b7b2a3a445c3_170107911_c2180ac9121bb85829899db6af99a7bb.jpg',14),(54,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3e79c306-d754-4a4a-a2c4-24ff80132b27_170107916_60247301100be8dbc326d72b139ab1d8.jpg',14),(55,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/a06044c0-85ef-4967-8492-b7ecf8d55908_170314863_69c929f1d3b520adbd412651d3d70bef.png',15),(56,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/db742bec-43f8-4096-83b0-7304580ec400_170314860_2a6995b8be407ab8daa9200a183de148.png',15),(57,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/ea4ab4a1-4575-4a0c-9f7b-af44528f080b_170314858_2bfc35992ee9297c8b301eb851c69817.png',15),(58,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/966a4ec1-2947-4cb9-8043-2720d7b8a51a_170314848_cf8df4a4cdeb576baa6da97d28d1a5fa.png',15),(59,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/2e46d880-b9a4-4603-9fe4-2402e509134a_170159221_c887836bad3f6580a622c068e4d418d4.jpg',16),(60,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/60bead36-0c89-4784-a118-fdc7ce9ad6be_170159231_65e44fde1772a44d786e7024f029797a.jpg',16),(61,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/48be2289-f38e-48e2-8a64-9a1c00f11306_170159240_b4a41c321c1e9b3c19e090b01e082398.jpg',16),(62,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/0ea56e8a-4f73-4aa6-a326-718b2ac62e77_mosaPk1ZBR.jpeg',17),(63,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3de67729-5f7d-49dd-a819-40ff398707c6_%EC%98%A5%EC%83%81%EC%A0%95%EC%9B%903.jpg',17),(68,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/ac274b39-8f35-44b1-b04d-6f16d21473ba_169828733_cdc679bebbe282e170ab6fe0dca8445e.jpg',19),(69,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/4d771810-1495-4007-b107-6d3be59fb96f_169828736_156005c5baf40ff51a327f1c34f2975b.jpg',19),(70,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/c35eae03-4ae6-4133-9cc4-e98b626afbb7_169828736_f3ccdd27d2000e3f9255a7e3e2c48800.jpg',19),(71,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/81d0aefd-2659-4293-9895-8c18dd24d8ad_4c0ff5ff-2648-484a-815c-ee0e82662b00.jpeg',20),(72,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/a3fda6d5-790e-4676-91e9-010b39646043_%EC%98%A5%ED%83%91%EB%B0%A9_001.png',20),(73,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/5ab6291b-eea9-44c9-a02f-f8023344d6c9_168629366_d8dc80ec3700e272a176b9418343617e.jpg',21),(74,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d0d711be-c623-475d-997d-56b82907a877_168629369_3fe494e734bce6e2435be64ac157e8d0.jpg',21),(75,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/67aea04d-d91a-455a-88eb-c5dc648f318a_168629529_2bd9b9dbfe9a8065c27489f1b7d001a1.jpg',21),(76,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/64f4af92-057d-478e-ad1b-4f9aeae9a3a1_170306762_e0bcc1847b405c044035addb0bfa5e86.jpg',21),(77,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/982424ad-3b9f-4050-b563-7d2ef9959078_169828736_156005c5baf40ff51a327f1c34f2975b.jpg',22),(78,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/42efab9a-c589-4ec8-a553-f3539702425f_169828736_156005c5baf40ff51a327f1c34f2975b.jpg',22),(79,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/e36dfc60-18aa-422b-8758-f6e48f8df612_169828736_f3ccdd27d2000e3f9255a7e3e2c48800.jpg',22),(84,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/5d1bdb59-baa8-44c1-b36e-d4998e104cdf_168210294_b227c7cc9e095d441da7a99e64faafbf.jpg',24),(85,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d0858176-2a63-4eb8-96f6-9fdba0ac27b2_168210298_a127f5bedd18f119e3e404c557ad64d0.jpg',24),(86,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/827ed725-c2f7-44a1-86ab-979341493001_170470143_45421e4864e8b2381f8aa053d4d35fa0.jpg',24),(87,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/05ce4bc6-afa9-4c71-9b3a-15b0a0f7b84f_169862854_fdc7e52c3bc77a069ddd57f81624c775.jpg',25),(88,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/3faf2da7-f430-4eb5-b126-ef6935b39418_169862858_72521b3a5dd08487a29d17cfb2659441.jpg',25),(89,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/37473d8b-92b0-4e20-b09a-f6b5518eef12_169862863_b7b1ede226567f309f00bd0298010c40.jpg',25),(90,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/80cf6fc8-f59c-4106-ac56-d34fcc5e3c50_169501455_5cfd0b478c4debd377000b958932ac6a.jpg',26),(91,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/68d09e81-c147-45b4-a925-bdb566ce0d9f_169501461_454efdabda6ad6eb198ed5df5e3ea845.jpg',26),(92,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/54afc41e-8d2a-436f-9141-12ae9970092a_169528403_454efdabda6ad6eb198ed5df5e3ea845.jpg',26),(93,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/301775de-e813-495c-a6fc-b5fa7a79020f_169528404_342424ace4e985026d2853ce43d137b4.jpg',26),(94,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/1d7d60ae-8d36-4592-8bb1-6f2d93adfe53_170442005_a1bacba7183df2ced6e200e24cee1f4d.jpg',27),(95,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d8708d2a-3234-4052-bcd6-44e4c334b98a_170442008_7eb04a9bb418e2130d73dbd5a09e2d0d.jpg',27),(96,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/741f08c8-9f60-45e6-84fb-dd6f8326d56d_170444476_0055961ac31b90256b64baaf5607911a.jpg',27),(97,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/56a767a2-9747-446b-b5d9-f99b68f503ca_170444483_8ab0d2f4a701f348b0cb3afd647ece6c.jpg',27),(98,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/b7ecb3a9-0005-4ff7-ada5-212ce0b833d3_170659905_b8f34982da7fcd6f4ae4c6f7c048475e.jpg',28),(99,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/0260139b-aced-48fb-b0ee-a939d79933ef_170659909_dcbdcc760cf54b6e950728bcb51bc65c.jpg',28),(100,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/bec37f58-cb71-45e9-8384-a4bfa9f29f8a_170659909_f3ccdd27d2000e3f9255a7e3e2c48800.jpg',28),(101,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/794d882b-efe5-4c7f-90fb-5ef85fc83cd2_170659911_c51c3084bcc541552abc1f9616b989ca.jpg',28),(102,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/9bc94421-4f9a-4cc1-a7f1-b29ced65374c_169643503_9c68145e1ea34f38359c0cf898cb1f5f.jpg',29),(103,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/5c367b78-e0bf-47da-9f4c-54c13612710f_170446039_df9c46b52904fdc17698be2948c311a5.jpg',29),(104,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d17dd7d8-ade1-4a38-a2b3-425788da249c_170446041_eed9a161b1931e1c733c12a56e56bef4.jpg',29),(105,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/e3214b87-9275-4cf2-8056-a98f31b6e2bd_170446100_6c9a5b2a2b7154f5f4ee340d10e2c651.jpg',29),(106,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/622dbc1a-c930-4000-875b-df7e223a6d0d_166851032_c59a2b7617be33a7161ae002f0103d46.jpg',30),(107,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/b0bfb376-d6a0-4459-bbb9-151b383cbe37_167058984_b6b5184abff0d64ae2dfa9f49df79ef8.jpeg',30),(108,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/40a2d26e-87bd-4483-bbad-743650eb0d97_169036086_7c275499f8c7a61e4e6bad210ba2ffb8.jpg',30),(109,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f209bf13-73e1-440f-862d-afe3c6679113_169674360_39c4f801a6ffe7a60bfc44eeaf75fbca.jpeg',30),(110,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/20076b13-8d7d-4011-9e02-5b95dd5b6f28_168507543_99fd4c70d4e95a26b0bb53a4e5f7d0f2.jpg',31),(111,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/973d0b3f-92d7-49b8-8543-c9c3ad8dcb7b_168507544_f3ccdd27d2000e3f9255a7e3e2c48800.jpg',31),(112,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/df62abd5-7baf-4b3a-bf93-3ff49ab1d588_168507545_156005c5baf40ff51a327f1c34f2975b.jpg',31),(113,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/eb8f57c9-e3e5-4134-8b27-640d03c0e6f7_168507545_d0096ec6c83575373e3a21d129ff8fef.jpg',31),(114,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/ec4de389-b74a-4c43-a6c9-1982019bfdbc_170066309_b9583919831ca338bec371a6073bee05.jpg',32),(115,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/0df2fcd8-d0ad-4b58-bd52-90c1a3fc1da7_168802884_664ae8c982121da3fca221a419faff92.jpg',32),(116,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/e75fde81-d59a-43a1-9136-fec8252dbb25_168802884_c05049e7cad7c646280ae12cfc7b6682.jpg',32),(117,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/64739d2f-b681-411a-ab09-8918bdc6894f_170003698_5c72062a02510377d70766d7d9e38207.jpg',33),(118,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/c91a9742-8be6-4a7c-938d-bcfcc6f6eb20_170003698_ff3d3876373be4920c3e78a15eca7aec.jpg',33),(119,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/b6d87849-febc-4935-a5c9-580ae6213f01_170078944_226555a6b07e15f065f2df1eb3d4a227.jpg',33),(120,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/9e774f9c-cc5a-42ff-8d9a-198aa57f5cfe_169862858_72521b3a5dd08487a29d17cfb2659441.jpg',34),(121,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/57627c9e-b4e7-4190-a27d-b644bbe0f820_169862854_fdc7e52c3bc77a069ddd57f81624c775.jpg',34),(122,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f4f5b589-d212-4fb2-bfff-388c49627806_169862863_b7b1ede226567f309f00bd0298010c40.jpg',34),(123,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/7353dad3-251e-4e15-8ec5-dfcd38f8a896_170659909_f3ccdd27d2000e3f9255a7e3e2c48800.jpg',35),(124,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/6c883ff3-49d9-4f20-81bf-2064fe075776_170659905_b8f34982da7fcd6f4ae4c6f7c048475e.jpg',35),(125,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/73f973ff-7055-4e1c-8151-cc5feffc1421_170659909_dcbdcc760cf54b6e950728bcb51bc65c.jpg',35),(126,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/91a460a1-3fb4-4d2f-a3ad-5b4d19110140_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%286%29.jpg',36),(127,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/1aee7db9-01eb-4bcb-80fe-96a2641a9f97_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%285%29.jpg',36),(128,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/f4c560b7-0c2b-4c52-be34-5db102ab68af_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%284%29.jpg',36),(129,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/9b2957bc-3648-43f9-a43e-261d7a72c92c_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%283%29.jpg',36),(130,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/0bf410a0-68ec-4409-b566-d6521ec3f251_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%282%29.jpeg',37),(131,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/89020d58-568e-4099-8036-a7b24997d33b_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C%20%281%29.jpeg',37),(132,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/c3c3f6fa-d006-4e3d-9214-c3c834dcf2a0_%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpeg',37),(133,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/f9416c61-7881-4a9c-b0d0-7d8b31ff697a_20161108150215SQW0MsffUi.jpg.crdownload',38),(134,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/ef08658f-8cda-4225-9fed-af6803c1354c_20161108150148R7WVmPwWFq.jpg.crdownload',38),(135,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/5f01818d-0809-443f-8fcf-45138a3ab9e5_20161108150147x3O6EGmBmS.jpg.crdownload',38),(136,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/b35b5eaf-353b-4b9c-929d-cb0e5f967a3a_169794731_dc083d76e548b4d867a8f8f653d8c5b3.jpg',39),(137,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/f7ffde8b-d283-4a23-9d91-17623330b998_170005225_78770f74711ac5110cf222416d2b1d40.jpg',39),(138,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/95ce42fb-a0f0-43c4-b58c-09cc816468b1_169828733_cdc679bebbe282e170ab6fe0dca8445e.jpg',39),(139,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/8c763507-d620-424d-a49b-abcc5bf9d11a_166425870_c0a312effb69868c49e0fc22b08529cc.jpg',40),(140,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/0a6d8b27-1ff6-4ee5-a37f-43f455a5a2ca_166425867_da6353d0fe417edb5aedeb90aed16c08.jpg',40),(141,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/264d583e-1014-4d1f-b786-3ef5c09894e7_166425865_f0ee844a9270dd69db07f0039016922c.jpg',40),(142,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/5d506e9d-07c3-4d93-bcb0-0229dda31569_169263159_2f1d4fe9f710318c48026a1a9867e2d4.jpeg',41),(143,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/59fa0edf-0a8f-4cf2-821e-e67cdff9764f_169263162_d07a1b421f0c9cf46c72715e282a3178.jpeg',41),(144,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/aa5045d3-c2d3-43e0-abb8-be5345e7d578_169263163_8979b6d0192112335711846cf92da930.jpeg',41),(145,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/6921b758-b681-4d3d-ac36-727be8d32012_169263164_53f3adf0e17eef047160857380bbf098.jpeg',41),(146,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/4dfb8b77-8f7e-4c9c-84b8-8b8d85d7b9d1_170003698_5c72062a02510377d70766d7d9e38207.jpg',42),(147,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/6a21a132-ab78-4c7b-a5a3-3224dd06fe9b_170003693_181dea9fcd9f9b60efe43c8d47143e3e.jpg',42),(148,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/43e6a2e1-13eb-423c-acc9-3ed935bb9a67_170078944_226555a6b07e15f065f2df1eb3d4a227.jpg',42),(149,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/217a3410-a089-4472-9080-c81450d1f5a8_170003698_5c72062a02510377d70766d7d9e38207.jpg',43),(150,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/78c5a656-4108-49e0-8202-01b7161ac9bd_170003693_181dea9fcd9f9b60efe43c8d47143e3e.jpg',43),(151,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/c73d5b0d-083f-4f2c-a770-a82da79774a3_169234613_ecfe938e0516f9efe550f58ef693a6b6.png',44),(152,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/ba9e1d0a-37fc-4372-89a1-c44325036a17_169234613_5e3341f4afc1687e027c7f7079f2de8e.jpg',44),(153,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/1f981c0c-558b-4c2a-a1bd-a85631b08475_169234612_0675b8ab5f8896a6bc1f7a9fea4a48c7.jpg',44),(154,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/da83996c-4b88-4430-bfc4-329d2a19b73a_169234612_eaa6a04a6f14ba2bbd94ec85dad84086.jpg',44),(155,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/16883398-b243-4b3f-ba8e-634e92836130_%EC%98%A5%ED%83%91%EB%B0%A9%20%EC%9D%B4%EB%AF%B8%EC%A7%802.jpg',45),(156,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/bd61b660-0ff5-4679-91f4-6b61cc3d1a45_%EC%98%A5%ED%83%91%EB%B0%A9%20%EC%9D%B4%EB%AF%B8%EC%A7%801.jpg',45),(157,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/06/1fc7858c-b022-462e-919f-d2968d9723c0_%EC%98%A5%ED%83%91%EB%B0%A9%20%EC%9D%B4%EB%AF%B8%EC%A7%80.jpg',45);
/*!40000 ALTER TABLE `house_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `status` bit(1) DEFAULT NULL,
                         `house_id` bigint DEFAULT NULL,
                         `user_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK17ecv4nei568t7dqfblyrm9in` (`house_id`),
                         KEY `FKi2wo4dyk4rok7v4kak8sgkwx0` (`user_id`),
                         CONSTRAINT `FK17ecv4nei568t7dqfblyrm9in` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                         CONSTRAINT `FKi2wo4dyk4rok7v4kak8sgkwx0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (3,_binary '',29,3),(7,_binary '',9,89),(11,_binary '',5,2),(13,_binary '',11,2),(14,_binary '',15,2),(15,_binary '',10,2),(16,_binary '',28,122),(17,_binary '',5,122),(20,_binary '',11,199),(21,_binary '',4,3),(22,_binary '',41,1),(23,_binary '',12,1),(25,_binary '',6,1),(26,_binary '',19,1),(27,_binary '',25,1);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordered_house`
--

DROP TABLE IF EXISTS `ordered_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordered_house` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `house_id` bigint DEFAULT NULL,
                                 `orders_id` bigint DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `FK295lx9l685lj5osiiwctigsd6` (`house_id`),
                                 KEY `FK9egbry4gtyayj6i9aqw1afm1j` (`orders_id`),
                                 CONSTRAINT `FK295lx9l685lj5osiiwctigsd6` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                                 CONSTRAINT `FK9egbry4gtyayj6i9aqw1afm1j` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordered_house`
--

LOCK TABLES `ordered_house` WRITE;
/*!40000 ALTER TABLE `ordered_house` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordered_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `imp_uid` varchar(255) DEFAULT NULL,
                          `merchant_uid` varchar(255) DEFAULT NULL,
                          `payment_status` varchar(255) DEFAULT NULL,
                          `price` int DEFAULT NULL,
                          `cart_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKtpihbdn6ws0hu56camb0bg2to` (`cart_id`),
                          CONSTRAINT `FKtpihbdn6ws0hu56camb0bg2to` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `content` varchar(255) DEFAULT NULL,
                          `created_at` datetime(6) NOT NULL,
                          `rating` int NOT NULL,
                          `status` bit(1) DEFAULT NULL COMMENT '0: 비활성화 | 1: 활성화',
                          `title` varchar(255) DEFAULT NULL,
                          `updated_at` datetime(6) DEFAULT NULL,
                          `orders_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FK39qu1l8wwvyet1jywdp6hnh6c` (`orders_id`),
                          CONSTRAINT `FK39qu1l8wwvyet1jywdp6hnh6c` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_image`
--

DROP TABLE IF EXISTS `review_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_image` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `filename` varchar(255) DEFAULT NULL,
                                `review_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FK16wp089tx9nm0obc217gvdd6l` (`review_id`),
                                CONSTRAINT `FK16wp089tx9nm0obc217gvdd6l` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_image`
--

LOCK TABLES `review_image` WRITE;
/*!40000 ALTER TABLE `review_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `review_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `authority` varchar(255) NOT NULL,
                        `birth_day` varchar(30) DEFAULT NULL,
                        `created_at` datetime(6) NOT NULL,
                        `email` varchar(50) NOT NULL,
                        `gender` varchar(50) DEFAULT NULL,
                        `name` varchar(30) NOT NULL,
                        `nick_name` varchar(30) NOT NULL,
                        `password` varchar(100) NOT NULL,
                        `phone_num` varchar(50) NOT NULL,
                        `status` bit(1) DEFAULT b'1' COMMENT '0: 비활성화 | 1: 활성화',
                        `updated_at` datetime(6) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
                        UNIQUE KEY `UK_gj2fy3dcix7ph7k8684gka40c` (`name`),
                        UNIQUE KEY `UK_d2ia11oqhsynodbsi46m80vfc` (`nick_name`),
                        UNIQUE KEY `UK_gh4o0b6dwn4yexk0f96wjga26` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ROLE_SELLER','1999-11-11','2024-02-05 01:50:34.913446','dlaxodn9999@gmail.com','M','dlaxodn9999','dlaxodn9999','{bcrypt}$2a$10$UWK8JY.eozEbCPiXHtMIe.p8042VUBPwuuidd23qCh1W/euihlsUm','010-1111-1111',_binary '','2024-02-05 01:54:15.929377'),(2,'ROLE_SELLER',NULL,'2024-02-05 02:14:34.791767','zofnapf@naver.com','M','한경훈','한경경','{bcrypt}$2a$10$YwRtqjzMWtrnoyhgNZwRZOKS0F5MPUDZekrYNnYTZL8BX.730ERT6','010-2936-0247',_binary '','2024-02-05 02:14:58.554166'),(3,'ROLE_USER','1995-04-04','2024-02-05 02:20:33.982783','ell950404@gmail.com','M','leejunguk','jgg44','{bcrypt}$2a$10$YwSidPGcscwGi5a02zMYV.0UtoNNGF/t29EBjn.y3yJiTMeEkkDUa','010-1234-5678',_binary '','2024-02-05 02:20:53.540980'),(4,'ROLE_SELLER',NULL,'2024-02-05 02:32:00.978727','poil4291@gmail.com','M','Jang','nickname','{bcrypt}$2a$10$zqeznt/e80prMepBYa391OoKJKL.2eWzY7VkYQSvxK.EJv6XiZdEW','010-1234-5786',_binary '\0','2024-02-05 02:32:00.978731'),(89,'ROLE_USER',NULL,'2024-02-05 06:56:46.972358','poil42@naver.com','M','JangDae','nicknameap','{bcrypt}$2a$10$i33Uwz1a3bF2BnraK5X3S.L8eubTtUrkTTC0IhHdvgm.yI1li87sK','010-2545-6789',_binary '','2024-02-05 06:57:22.497409'),(122,'ROLE_USER',NULL,'2024-02-05 10:37:46.172531','ewoo97@naver.com','M','오렌지카라멜','오렌지카라멜','{bcrypt}$2a$10$iylRe.8.vyxKrG9CtUlyh.i8KkNZYts8YF2SMp4y./YhWrt.rGkem','010-2222-4444',_binary '','2024-02-05 10:37:55.800921'),(198,'ROLE_USER',NULL,'2024-02-06 00:20:05.491358','test01@test.com','M','poll','닉네임11','{bcrypt}$2a$10$V9eBuCw82hGJGBViJW/Nb.5uSxT5fsuRNHxCWf6HOKd5Jj6dRnBwq','010-1223-2225',_binary '\0','2024-02-06 00:20:05.491361'),(199,'ROLE_USER',NULL,'2024-02-06 00:22:56.409676','poil422023@gmail.com','M','JangDaeHyeon','닉네임','{bcrypt}$2a$10$vmjL1UHUf.NsReZrmAPH1.9DSpK7aGeEV42w5PmSWgXMIK1Dwtr0.','010-9977-5566',_binary '','2024-02-06 00:23:45.237198');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-08 14:34:47
