CREATE TABLE IF NOT EXISTS `celestialBodies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL UNIQUE,
  `distance` double DEFAULT NULL,
  `distanceUnits` enum('lightYears', 'millionLightYears') DEFAULT 'lightYears',
  `diameter` double DEFAULT NULL,
  `diameterUnits` enum('kilometers', 'lightDays', 'lightYears') DEFAULT 'kilometers',
  `bodyType` enum('planet', 'star', 'galaxy', 'asteroid', 'blackHole'),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `planets` (
  `id` int NOT NULL,
  `mass` double DEFAULT NULL,
  `moonsAmount` int DEFAULT NULL,
  `orbitId` int NOT NULL,
  `planetType` enum('dwarf', 'terrestrial', 'gas', 'ice', 'terrestrialGiant', 'gasGiant', 'iceGiant'),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`),
  FOREIGN KEY (`orbitId`) REFERENCES `celestialBodies` (`id`)
); 

CREATE TABLE IF NOT EXISTS `telescopes` (
  `id` int NOT NULL,
  `location` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `resolution` int NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
);

CREATE TABLE IF NOT EXISTS `galaxies` (
  `id` INT PRIMARY KEY,
  `galaxyType` enum("spiral", "elliptical", "lenticular", "quasars"),
  `galaxyGroup` varchar(50),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`)
);

CREATE TABLE IF NOT EXISTS `stars` (
  `id` int NOT NULL,
  `mass` double DEFAULT NULL,
  `planetsAmount` int DEFAULT 0,
  `galaxy` int DEFAULT 1,
  `starType` enum('o-type', 'b-type', 'a-type', 'f-type', 'g-type', 'k-type', 'm-type', 'whiteDwarf'),
  PRIMARY KEY (`id`),
  FOREIGN KEY (`galaxy`) REFERENCES `galaxies` (`id`)
);

CREATE TABLE IF NOT EXISTS `blackHoles` (
  `id` int NOT NULL,
  `mass` double DEFAULT NULL,
  `spin` double DEFAULT NULL,
  `galaxy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`),
  FOREIGN KEY (`galaxy`) REFERENCES `galaxies` (`id`)
);

CREATE TABLE IF NOT EXISTS `asteroids` (
  `id` INT PRIMARY KEY,
  `asteroidType` enum("carbonaceous", "stony", "nickelIron"),
  `mass` int,
  `surface` varchar(50),
  `orbitId` int NOT NULL,
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`),
  FOREIGN KEY (`orbitId`) REFERENCES `celestialBodies` (`id`)
);



CREATE TABLE IF NOT EXISTS `typeAstronomicalEvents` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `eventName` varchar(50)
);

CREATE TABLE IF NOT EXISTS `astronomicalEvents` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `eventId` int NOT NULL,
  `eventDate` date NOT NULL,
  FOREIGN KEY (`eventId`) REFERENCES `typeAstronomicalEvents` (`id`)
);

CREATE TABLE IF NOT EXISTS `observation` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `idUser` INT,
  `idTelescope` INT,
  `idBody` INT,
  `observationDate` DATETIME,
  `timeSpent` TIME,
  FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  FOREIGN KEY (`idTelescope`) REFERENCES `telescopes` (`id`), 
  FOREIGN KEY (`idBody`) REFERENCES `celestialBodies` (`id`)
);