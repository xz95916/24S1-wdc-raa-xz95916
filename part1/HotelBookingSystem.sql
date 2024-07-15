-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: HotelBookingSystem
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `booking_start_date` date NOT NULL,
  `booking_end_date` date NOT NULL,
  `number_of_people` int NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `user_id` (`user_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Bookings_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,1,1,'2024-07-24','2024-07-28',2);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facilities`
--

DROP TABLE IF EXISTS `Facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facilities` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(100) NOT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facilities`
--

LOCK TABLES `Facilities` WRITE;
/*!40000 ALTER TABLE `Facilities` DISABLE KEYS */;
INSERT INTO `Facilities` VALUES (1,'Gym'),(2,'Pool'),(3,'Laundry');
/*!40000 ALTER TABLE `Facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotels`
--

DROP TABLE IF EXISTS `Hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
INSERT INTO `Hotels` VALUES (1,'Grand Hotel','Sydney','A luxurious hotel in the heart of the city.');
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `hotel_id` int DEFAULT NULL,
  `room_id` int DEFAULT NULL,
  `booking_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `hotel_id` (`hotel_id`),
  KEY `room_id` (`room_id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `Reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`hotel_id`),
  CONSTRAINT `Reviews_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`),
  CONSTRAINT `Reviews_ibfk_4` FOREIGN KEY (`booking_id`) REFERENCES `Bookings` (`booking_id`),
  CONSTRAINT `Reviews_chk_1` CHECK (((`rating` >= 1) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,1,1,1,1,5,'Amazing stay with excellent service.');
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoomFacilities`
--

DROP TABLE IF EXISTS `RoomFacilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoomFacilities` (
  `room_id` int NOT NULL,
  `facility_id` int NOT NULL,
  PRIMARY KEY (`room_id`,`facility_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `RoomFacilities_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `Rooms` (`room_id`),
  CONSTRAINT `RoomFacilities_ibfk_2` FOREIGN KEY (`facility_id`) REFERENCES `Facilities` (`facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoomFacilities`
--

LOCK TABLES `RoomFacilities` WRITE;
/*!40000 ALTER TABLE `RoomFacilities` DISABLE KEYS */;
INSERT INTO `RoomFacilities` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `RoomFacilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rooms`
--

DROP TABLE IF EXISTS `Rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Rooms` (
  `room_id` int NOT NULL AUTO_INCREMENT,
  `hotel_id` int DEFAULT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `number_of_beds` int NOT NULL,
  `description` text,
  PRIMARY KEY (`room_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `Rooms_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotels` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rooms`
--

LOCK TABLES `Rooms` WRITE;
/*!40000 ALTER TABLE `Rooms` DISABLE KEYS */;
INSERT INTO `Rooms` VALUES (1,1,200.00,2,'A spacious room with a great view.');
/*!40000 ALTER TABLE `Rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `registration_date` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'john_doe','securepassword','john@example.com','2024-01-15','Sydney');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-15  5:37:02
