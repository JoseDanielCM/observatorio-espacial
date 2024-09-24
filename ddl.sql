CREATE TABLE IF NOT EXISTS `celestialBodies` (
  `id` int NOT NULL,
  `distance` double DEFAULT NULL,
  `distanceUnits` enum('lightYears','millionLightYears') DEFAULT 'lightYears',
  `diameter` double DEFAULT NULL,
  `diameterUnits` enum('kilometers','lightDays','lightYears') DEFAULT 'Kilometers',
  'bodyType' enum('planet','star','galaxy','asteroid','blackHole')
  PRIMARY KEY (`id`)
)

CREATE TABLE IF NOT EXISTS `planets` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `moonsAmount` int DEFAULT NULL,
  'orbitId' int NOT NULL,
  'planetType' enum('dwarf','terrestrial','gas','ice','terrestrialGiant','gasGiant','iceGiant'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`),
  FOREIGN KEY (`orbitId`) REFERENCES `celestialBodies` (`id`)
) 

CREATE TABLE IF NOT EXISTS `telescopes` (
  `id` int NOT NULL,
  `location` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `resolution` int NOT NULL,
  PRIMARY KEY (`idTelescopes`),
  UNIQUE KEY `idTelescopes_UNIQUE` (`idTelescopes`),
  UNIQUE KEY `location_UNIQUE` (`location`)
)

CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci NOT NULL,
  `phone` int NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf32 COLLATE utf32_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `id` (`idUser`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`)
)

CREATE TABLE IF NOT EXISTS `stars` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `planets` int DEFAULT 0,
  'orbitId' int DEFAULT NULL,
  'starType' enum('o-type','b-type','a-type','f-type','g-type','k-type','m-type','whiteDwarf'),
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`)
  FOREIGN KEY (`orbitId`) REFERENCES `celestialBodies ` (`id`)
)

CREATE TABLE IF NOT EXISTS `blackHole` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `spin` double DEFAULT NULL,
  'charge' double DEFAULT NULL
  'galaxy' int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  FOREIGN KEY (`id`) REFERENCES `celestialBodies` (`id`)
  FOREIGN KEY (`galaxy`) REFERENCES `galaxy ` (`id`)
) 

CREATE TABLE if not exists asteroid (
	idAsteroid INT primary key auto_increment,
    type_asteroid enum("chondrite","stony","nickel-iron"),
    mass int,
    surface varchar(50),
    'orbitId' int NOT NULL,
    FOREIGN KEY (`orbitId`) REFERENCES `celestialBodies` (`id`)

);

CREATE TABLE if not exists galaxy (
	id INT primary key auto_increment,
    typeGalaxy enum("spiral","elliptical","lenticular","quasars"),
    galaxyGroup varchar(50),
);

CREATE TABLE if not exists typeAstronomicalEvents (
	id INT primary key auto_increment,
    NameEvent varchar(50)
);

CREATE TABLE if not exists astronomicalEvents (
	id INT primary key auto_increment,
    eventId int NOT NULL,
    eventDate date not null,
    FOREIGN KEY (eventId) REFERENCES typeAstronomicalEvents (eventId)
);