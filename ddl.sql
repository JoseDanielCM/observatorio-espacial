DROP TABLE IF EXISTS `celestialBodies`;
CREATE TABLE `celestialBodies` (
  `id` int NOT NULL,
  `distance` double DEFAULT NULL,
  `distanceUnits` enum('lightYears','millionLightYears') DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `volumeUnits` enum('kilometers','lightDays','lightYears') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `celestialBodies` WRITE;
/*!40000 ALTER TABLE `celestialBodies` DISABLE KEYS */;
/*!40000 ALTER TABLE `celestialBodies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planets`
--

DROP TABLE IF EXISTS `planets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planets` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `diameter` double DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `moonsAmmount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `planets_ibfk_1` FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planets`
--

LOCK TABLES `planets` WRITE;
/*!40000 ALTER TABLE `planets` DISABLE KEYS */;
/*!40000 ALTER TABLE `planets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescopes`
--

DROP TABLE IF EXISTS `telescopes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescopes` (
  `idTelescopes` int NOT NULL,
  `location` varchar(45) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `resolution` int NOT NULL,
  PRIMARY KEY (`idTelescopes`),
  UNIQUE KEY `idTelescopes_UNIQUE` (`idTelescopes`),
  UNIQUE KEY `location_UNIQUE` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescopes`
--

LOCK TABLES `telescopes` WRITE;
/*!40000 ALTER TABLE `telescopes` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescopes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `idUser` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `phone` int NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `id` (`idUser`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-24 16:05:13
