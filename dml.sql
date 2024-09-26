INSERT INTO celestialBodies 
(id,name, distance, distanceUnits, diameter, diameterUnits, bodyType) 
VALUES 
-- GALAXIES 1-20
(1,'Milky Way', 0.0, 'lightYears', 105700, 'lightYears', 'galaxy'),
(2,'Andromeda', 2.537, 'millionLightYears', 220000, 'lightYears', 'galaxy'),
(3,'Triangulum', 3.0, 'millionLightYears', 60000, 'lightYears', 'galaxy'),
(4,'Whirlpool Galaxy', 23.16, 'millionLightYears', 76000, 'lightYears', 'galaxy'),
(5,'Sombrero Galaxy', 31.6, 'millionLightYears', 49000, 'lightYears', 'galaxy'),
(7,'Messier 87', 53.5, 'millionLightYears', 120000, 'lightYears', 'galaxy'),
(8,'Pinwheel Galaxy', 20.9, 'millionLightYears', 170000, 'lightYears', 'galaxy'),
(9,'Cartwheel Galaxy', 500, 'millionLightYears', 150000, 'lightYears', 'galaxy'),
(10,'Centaurus A', 12.0, 'millionLightYears', 60000, 'lightYears', 'galaxy'),
(11,'NGC 1300', 61.3, 'millionLightYears', 110000, 'lightYears', 'galaxy'),
(12,'NGC 4993', 144.0, 'millionLightYears', 52000, 'lightYears', 'galaxy'),
(13,'IC 1101', 1040.0, 'millionLightYears', 6000000, 'lightYears', 'galaxy'),
(14,'Large Magellanic Cloud', 0.163, 'millionLightYears', 14000, 'lightYears', 'galaxy'),
(15,'Small Magellanic Cloud', 0.197, 'millionLightYears', 7000, 'lightYears', 'galaxy'),
(16,'Messier 81', 11.74, 'millionLightYears', 90000, 'lightYears', 'galaxy'),
(17,'NGC 253', 11.42, 'millionLightYears', 70000, 'lightYears', 'galaxy'),
(18,'NGC 891', 30.0, 'millionLightYears', 100000, 'lightYears', 'galaxy'),
(19,'NGC 6744', 30.0, 'millionLightYears', 175000, 'lightYears', 'galaxy'),
(20,'NGC 3370', 98.4, 'millionLightYears', 100000, 'lightYears', 'galaxy'),
(21,'ESO 137-001', 220.0, 'millionLightYears', 80000, 'lightYears', 'galaxy'),

-- BLACK HOLES 21-40
(21,"Ton 618", 1 * POWER(10, 10), "lightYears", 5 * POWER(10, 9), "kilometers", "blackHole"),
(22,"Sagittarius A*", 26000, "lightYears", 44000000, "kilometers", "blackHole"),
(23,"M87*", 53000000, "lightYears", 23000000, "kilometers", "blackHole"),
(24,"Cygnus X-1", 60700, "lightYears", 88000000, "kilometers", "blackHole"),
(25,"V404 Cygni", 78000, "lightYears", 76000000, "kilometers", "blackHole"),
(26,"NGC 1277", 220000000, "lightYears", 38000000, "kilometers", "blackHole"),
(27,"GRO J1655-40", 11200, "lightYears", 51000000, "kilometers", "blackHole"),
(28,"GX 339-4", 13500, "lightYears", 48000000, "kilometers", "blackHole"),
(29,"XTE J1118+480", 62000, "lightYears", 30000000, "kilometers", "blackHole"),
(30,"GRS 1915+105", 36000, "lightYears", 150000000, "kilometers", "blackHole"),
(31,"Ophiuchus", 390000000, "lightYears", 100000000, "kilometers", "blackHole"),
(32,"NGC 1365", 56000000, "lightYears", 5700000, "kilometers", "blackHole"),
(33,"NGC 4889", 336000000, "lightYears", 130000000, "kilometers", "blackHole"),
(34,"IC 1101", 1045000000, "lightYears", 400000000, "kilometers", "blackHole"),
(35,"ESO 243-49 HLX-1", 290000000, "lightYears", 30000000, "kilometers", "blackHole"),
(36,"3C 273", 2400000000, "lightYears", 300000000, "kilometers", "blackHole"),
(37,"NGC 4151", 62000000, "lightYears", 5000000, "kilometers", "blackHole"),
(38,"NGC 3115", 32000000, "lightYears", 900000, "kilometers", "blackHole"),
(39,"NGC 1600", 200000000, "lightYears", 170000000, "kilometers", "blackHole"),
(40,"Mrk 501", 456000000, "lightYears", 120000000, "kilometers", "blackHole"),

-- STARS  41-60
(41,"Sun", 0, "lightYears", 1390000, "kilometers", "star"),
(42,"Proxima Centauri", 4.24, "lightYears", 200000, "kilometers", "star"),
(43,"Alpha Centauri A", 4.37, "lightYears", 1230000, "kilometers", "star"),
(44,"Alpha Centauri B", 4.37, "lightYears", 870000, "kilometers", "star"),
(45,"Betelgeuse", 642.5, "lightYears", 1400000000, "kilometers", "star"),
(46,"Sirius A", 8.6, "lightYears", 2396000, "kilometers", "star"),
(47,"Sirius B", 8.6, "lightYears", 11800, "kilometers", "star"),
(48,"Vega", 25.04, "lightYears", 2700000, "kilometers", "star"),
(49,"Rigel", 860, "lightYears", 980000000, "kilometers", "star"),
(50,"Aldebaran", 65.1, "lightYears", 61000000, "kilometers", "star"),
(51,"Arcturus", 36.7, "lightYears", 36000000, "kilometers", "star"),
(52,"Antares", 554, "lightYears", 1180000000, "kilometers", "star"),
(53,"TRAPPIST-1", 33.78, "lightYears", 8800000, "kilometers", "star"),
(54,"WASP-12", 250, "lightYears", 7500000, "kilometers", "star"),
(55,"55 Cancri", 16.73, "lightYears", 1700000, "kilometers", "star"),
(56,"HD 209458", 25.13, "lightYears", 1720000, "kilometers", "star"),
(57,"Gliese 581", 2600, "lightYears", 2030000000, "kilometers", "star"),
(58,"Kepler-452", 310, "lightYears", 99400000, "kilometers", "star"),
(59,"Capella", 42.92, "lightYears", 11000000, "kilometers", "star"),
(60,"Kepler-22", 6000, "lightYears", 1260000000, "kilometers", "star"),

-- PLANETS 61-80
(61,"Mercury", 0, "lightYears", 4879, "kilometers", "planet"),
(62,"Venus", 0, "lightYears", 12104, "kilometers", "planet"),
(63,"Earth"0, "lightYears", 12742, "kilometers", "planet"),
(64,"Mars", 0, "lightYears", 6779, "kilometers", "planet"),
(65,"Jupiter", 0, "lightYears", 139820, "kilometers", "planet"),
(66,"Saturn", 0, "lightYears", 116460, "kilometers", "planet"),
(67,"Uranus", 0, "lightYears", 50724, "kilometers", "planet"),
(68,"Neptune", 0, "lightYears", 49244, "kilometers", "planet"),
(69,"Pluto", 0, "lightYears", 2376, "kilometers", "planet"),
(70,"Haumea", 0, "lightYears", 1960, "kilometers", "planet"),
(71,"Makemake", 0, "lightYears", 1430, "kilometers", "planet"),
(72,"Eris", 0, "lightYears", 2326, "kilometers", "planet"),
(73,"Kepler-22b", 600, "lightYears", 24000, "kilometers", "planet"),
(74,"Proxima Centauri b", 4.24, "lightYears", 12000, "kilometers", "planet"),
(75,"Kepler-452b", 1400, "lightYears", 24000, "kilometers", "planet"),
(76,"Gliese 581g", 20.4, "lightYears", 24000, "kilometers", "planet"),
(77,"HD 209458 b", 153, "lightYears", 140000, "kilometers", "planet"),
(78,"55 Cancri e", 41, "lightYears", 20900, "kilometers", "planet"),
(79,"WASP-12b", 1410, "lightYears", 213000, "kilometers", "planet"),
(80,"TRAPPIST-1d", 39, "lightYears", 12000, "kilometers", "planet"),

-- ASTEROIDS 81-100
(81,"Ceres", 413000000, "kilometers", 946, "kilometers", "asteroid"),
(82,"Vesta", 353000000, "kilometers", 525, "kilometers", "asteroid"),
(83,"Pallas", 413000000, "kilometers", 512, "kilometers", "asteroid"),
(84,"Hygiea", 469000000, "kilometers", 434, "kilometers", "asteroid"),
(85,"Eros", 218000000, "kilometers", 16.8, "kilometers", "asteroid"),
(86,"Itokawa", 197000000, "kilometers", 0.33, "kilometers", "asteroid"),
(87,"Bennu", 169000000, "kilometers", 0.49, "kilometers", "asteroid"),
(88,"Gaspra", 330000000, "kilometers", 0.18, "kilometers", "asteroid"),
(89,"Ida", 427000000, "kilometers", 0.31, "kilometers", "asteroid"),
(90,"Toutatis", 152000000, "kilometers", 2.8, "kilometers", "asteroid"),
(91,"Mathilde", 396000000, "kilometers", 52.8, "kilometers", "asteroid"),
(92,"Eugenia", 407000000, "kilometers", 214, "kilometers", "asteroid"),
(93,"Davida", 472000000, "kilometers", 326, "kilometers", "asteroid"),
(94,"Juno", 399000000, "kilometers", 233, "kilometers", "asteroid"),
(95,"Psyche", 448000000, "kilometers", 226, "kilometers", "asteroid"),
(96,"1994 PC1", 227000000, "kilometers", 1.2, "kilometers", "asteroid"),
(97,"Apophis", 137000000, "kilometers", 0.37, "kilometers", "asteroid"),
(98,"Orpheus", 181000000, "kilometers", 0.3, "kilometers", "asteroid"),
(99,"Florence", 264000000, "kilometers", 4.9, "kilometers", "asteroid"),
(100,"1998 KY26", 182000000, "kilometers", 0.03, "kilometers", "asteroid");

INSERT INTO galaxies (id, galaxyType, galaxyGroup) VALUES 
(1, 'spiral', 'Local Group'),
(2, 'spiral', 'Local Group'),
(3, 'spiral', 'Local Group'),
(4, 'spiral', 'Canes Venatici Group'),
(5, 'spiral', 'Virgo Cluster'),
(6, 'elliptical', 'Virgo Cluster'),
(7, 'spiral', 'Pinwheel Group'),
(8, 'lenticular', 'No Group'),
(9, 'elliptical', 'Centaurus Group'),
(10, 'spiral', 'Eridanus Cluster'),
(11, 'elliptical', 'Hydra Cluster'),
(12, 'elliptical', 'Abell 2029'),
(13, 'irregular', 'Local Group'),
(14, 'irregular', 'Local Group'),
(15, 'spiral', 'M81 Group'),
(16, 'spiral', 'Sculptor Group'),
(17, 'spiral', 'Pisces-Perseus Supercluster'),
(18, 'spiral', 'Pavo-Indus Supercluster'),
(19, 'spiral', 'Leo Cluster'),
(20, 'spiral', 'Norma Cluster');

INSERT INTO blackHoles (
    id,mass,spin,galaxy
) 
VALUES
 (21, 1.32 * POWER(10, 40), 0.8,1),
 (22, 4 * POWER(10, 32), 0.5,1),
 (23, 2 * POWER(10, 30), 0.7,2),
 (24, 1 * POWER(10, 35), 0.3,1),
 (25, 1 * POWER(10, 33), 0.4,1),
 (26, 1 * POWER(10, 32), 0.5,15),
 (27, 6 * POWER(10, 33), 0.5,1),
 (28, 2 * POWER(10, 29), 0.6,1),
 (29, 1 * POWER(10, 37), 0.7,16),
 (30, 1 * POWER(10, 38), 0.8,18),
 (31, 1 * POWER(10, 32), 0.9,2),
 (32, 3 * POWER(10, 32), 0.2,3),
 (33, 3 * POWER(10, 31), 0.3,1),
 (34, 1 * POWER(10, 30), 0.4,4),
 (35, 7 * POWER(10, 36), 0.5,5),
 (36, 1 * POWER(10, 35), 0.6,6),
 (37, 8 * POWER(10, 32), 0.5,8),
 (38, 1 * POWER(10, 33), 0.2,1),
 (39, 9 * POWER(10, 33), 0.4,15),
 (40, 1 * POWER(10, 31), 0.4,1)
 ;

INSERT INTO stars (id, mass, planetsAmount, starType) VALUES
(41, 1.0, 8, 'g-type'),
(42, 0.12, 4, 'm-type'),
(43, 1.1, 1, 'g-type'),
(44, 0.9, 1, 'k-type'),
(45, 18.5, 0, 'm-type'),
(46, 2.0, 1, 'a-type'),
(47, 0.98, 0, 'whiteDwarf'),
(48, 2.1, 0, 'a-type'),
(49, 21.0, 0, 'b-type'),
(50, 1.5, 0, 'k-type'),
(51, 1.1, 0, 'k-type'),
(52, 12.0, 0, 'm-type'),
(53, 0.08, 7, 'm-type'),
(54, 1.4, 1, 'f-type'),
(55, 0.9, 5, 'k-type'),
(56, 1.1, 1, 'g-type'),
(57, 0.31, 6, 'm-type'),
(58, 1.04, 1, 'g-type'),
(59, 1.5, 0, 'g-type'),
(60, 1.0, 1, 'g-type');



-- planet's mass earth
INSERT INTO planets (id,mass,moonsAmount,orbitId,planetType)
VALUES
(61, 0.05 , 0 , 41, "terrestrial")
(62, 0.8 , 0 , 41, "terrestrial")
(63, 1 , 0 , 41, "terrestrial")
(64, 0.1 , 1 , 41, "terrestrial")
(65, 317.8 , 2 , 41, "terrestrial")
(66, 95.2 , 95 , 41, "terrestrial")
(67, 14.5 , 146 , 41, "terrestrial")
(68, 17.1 , 27 , 41, "terrestrial")
(69, 0.0022 , 14 , 41, "terrestrial")
(70, 0.00067 , 5 , 41, "terrestrial")
(71, 0.00052 , 2 , 41, "terrestrial")
(72, 0.0028 , 1 , 41, "terrestrial")
(73, 30 , 1 , 60, "terrestrial")
(74, 1.17 , 0 , 42, "terrestrial")
(75, 5 , 0 , 58, "terrestrial")
(76, 3.1 , 0 , 57, "terrestrial")
(77, 0.69 , 0 , 56, "terrestrial")
(78, 8 , 0 , 55, "terrestrial")
(79, 1.47 , 0 , 54, "terrestrial")
(80, 0.38 , 0 , 53, "terrestrial")
;

INSERT INTO asteroids (id, asteroidType, mass, surface, orbitId) VALUES
(81, 'carbonaceous', 939000000, 'Rocky, with water ice and some hydrated minerals', 41),
(82, 'stony', 259000000, 'Rocky with basaltic areas and impact craters', 41),
(83, 'stony', 211000000, 'Heavily cratered and rocky', 41),
(84, 'carbonaceous', 83200000, 'Dark and possibly water-rich', 41),
(85, 'stony', 6690, 'Rocky with large craters and ridges', 63),
(86, 'stony', 0.0351, 'Rubble pile, with boulders and loose regolith', 41),
(87, 'carbonaceous', 0.0733, 'Loose, rocky, with boulders and gravel', 41),
(88, 'stony', 23000, 'Rocky with visible craters', 41),
(89, 'stony', 42000, 'Rocky with many impact craters', 41),
(90, 'stony', 54, 'Irregular, boulders, ridges', 41),
(91, 'carbonaceous', 103000, 'Dark and heavily cratered', 63),
(92, 'carbonaceous', 5690000, 'Dark with possible dust layers', 41),
(93, 'carbonaceous', 38400000, 'Dark with minor craters', 41),
(94, 'stony', 26700000, 'Rocky, with craters and high albedo', 41),
(95, 'nickelIron', 27200000, 'Metallic with impact craters', 63),
(96, 'stony', 1, 'Rocky with craters', 41),
(97, 'stony', 0.0438, 'Rocky with small craters', 63),
(98, 'stony', 0.021, 'Rocky and irregular', 41),
(99, 'stony', 50100, 'Rocky with visible craters', 41),
(100, 'carbonaceous', 0.000025, 'Dark and smooth', 41)
;

INSERT INTO typeAstronomicalEvents
(id,eventName)
VALUES 
(1,"Solar Eclipse"),
(2,"Lunar Eclipse"),
(3,"Meteor Shower"),
(4,"Planetary Transits"),
(5,"Conjunctions"),
(6,"Supernovae"),
(7,"Auroras"),
(8,"Occultations"),
(9,"Comet Appearances"),
(10,"Quasars"),
(11,"Pulsars"),
(12,"Supermoon"),
(13,"Micromoon")
;

INSERT INTO astronomicalEvents 
(id,eventId,eventDate)
VALUES 
(1,1, "2024-4-8"),
(2,1, "2026-8-12"),
(3,2, "2024-3-25"),
(4,2, "2024-9-17"),
(5,3, "2024-10-8"),
(6,3, "2024-12-14"),
(7,4, "2032-10-13"),
(8,5, "2020-12-21"),
(9,6, "1217-7-15"),
(10,7, "2024-5-12"),
(11,7, "2024-5-28"),
(12,8, "2024-8-14"),
(13,9, "2061-2-24"),
(14,12, "2024-9-17"),
(15,13, "2024-4-8"),
(16,13, "2024-8-19"),
(17,3, "2024-1-3"),
(18,3, "2024-10-21"),
(19,4, "2117-12-15"),
(20,1, "2024-10-2");

INSERT INTO `telescopes` (`id`, `location`, `resolution`) VALUES
(1, 'Mauna Kea, Hawaii', 10000),
(2, 'La Silla Observatory, Chile', 12000),
(3, 'Palomar Observatory, California', 15000),
(4, 'Hubble Space Telescope', 12000),
(5, 'Keck Observatory, Hawaii', 16000),
(6, 'Atacama Desert, Chile', 11000),
(7, 'Very Large Telescope, Chile', 14000),
(8, 'Arecibo Observatory, Puerto Rico', 10000),
(9, 'Kitt Peak National Observatory, Arizona', 9000),
(10, 'Cerro Tololo Inter-American Observatory, Chile', 13000),
(11, 'Mount Wilson Observatory, California', 9500),
(12, 'Green Bank Observatory, West Virginia', 8500),
(13, 'Mt. Graham International Observatory, Arizona', 11000),
(14, 'Gran Telescopio Canarias, Spain', 16000),
(15, 'Subaru Telescope, Hawaii', 14000),
(16, 'South African Astronomical Observatory, South Africa', 9000),
(17, 'Lick Observatory, California', 9500),
(18, 'Chandra X-ray Observatory', 8000),
(19, 'James Webb Space Telescope', 14000),
(20, 'National Radio Astronomy Observatory, Virginia', 10000);


INSERT INTO `users` (`id`, `name`, `email`, `phone`, `birthDate`, `address`) VALUES
(1, 'Alice Johnson', 'alice.johnson@gmail.com', '123-456-7890', '1990-01-15', '123 Elm St, Springfield'),
(2, 'Bob Smith', 'bob.smith@gmail.com', '234-567-8901', '1985-05-22', '456 Oak St, Springfield'),
(3, 'Charlie Brown', 'charlie.brown@gmail.com', '345-678-9012', '1992-08-30', '789 Pine St, Springfield'),
(4, 'Diana Prince', 'diana.prince@gmail.com', '456-789-0123', '1988-12-05', '101 Maple St, Springfield'),
(5, 'Ethan Hunt', 'ethan.hunt@gmail.com', '567-890-1234', '1980-07-10', '202 Birch St, Springfield'),
(6, 'Fiona Gallagher', 'fiona.gallagher@gmail.com', '678-901-2345', '1995-03-18', '303 Cedar St, Springfield'),
(7, 'George Costanza', 'george.costanza@gmail.com', '789-012-3456', '1983-06-25', '404 Walnut St, Springfield'),
(8, 'Hannah Baker', 'hannah.baker@gmail.com', '890-123-4567', '1996-11-12', '505 Ash St, Springfield'),
(9, 'Isaac Newton', 'isaac.newton@gmail.com', '901-234-5678', '1992-01-04', '606 Hickory St, Springfield'),
(10, 'Jessica Jones', 'jessica.jones@gmail.com', '012-345-6789', '1990-09-22', '707 Sycamore St, Springfield'),
(11, 'Kevin Spacey', 'kevin.spacey@gmail.com', '123-456-7891', '1987-04-15', '808 Elm St, Springfield'),
(12, 'Laura Croft', 'laura.croft@gmail.com', '234-567-8902', '1989-10-09', '909 Oak St, Springfield'),
(13, 'Michael Scott', 'michael.scott@gmail.com', '345-678-9013', '1981-12-25', '111 Pine St, Springfield'),
(14, 'Nina Simone', 'nina.simone@gmail.com', '456-789-0124', '1982-02-21', '222 Maple St, Springfield'),
(15, 'Oscar Wilde', 'oscar.wilde@gmail.com', '567-890-1235', '1993-05-30', '333 Cedar St, Springfield'),
(16, 'Peter Parker', 'peter.parker@gmail.com', '678-901-2346', '1991-08-15', '444 Walnut St, Springfield'),
(17, 'Quinn Fabray', 'quinn.fabray@gmail.com', '789-012-3457', '1994-03-11', '555 Ash St, Springfield'),
(18, 'Rachel Green', 'rachel.green@gmail.com', '890-123-4568', '1986-07-30', '666 Hickory St, Springfield'),
(19, 'Sam Winchester', 'sam.winchester@gmail.com', '901-234-5679', '1985-10-04', '777 Sycamore St, Springfield'),
(20, 'Tina Belcher', 'tina.belcher@gmail.com', '012-345-6780', '1997-06-10', '888 Elm St, Springfield');

INSERT INTO `observations` (id,`idUser`, `idTelescope`, `idBody`, `observationDate`, `timeSpent`) VALUES
(1,1, 3, 17, '2024-01-15 20:30:00', '01:30:00'),
(2,2, 1, 45, '2024-01-16 21:00:00', '02:00:00'),
(3,3, 5, 28, '2024-01-17 22:15:00', '01:45:00'),
(4,4, 4, 12, '2024-01-18 19:45:00', '02:30:00'),
(5,5, 6, 36, '2024-01-19 20:00:00', '01:15:00'),
(6,6, 8, 53, '2024-01-20 22:00:00', '02:10:00'),
(7,7, 2, 10, '2024-01-21 23:30:00', '01:20:00'),
(8,8, 7, 77, '2024-01-22 21:45:00', '01:50:00'),
(9,9, 9, 4, '2024-01-23 20:15:00', '02:25:00'),
(10,10, 10, 63, '2024-01-24 19:30:00', '01:40:00'),
(11,11, 1, 99, '2024-01-25 20:45:00', '01:55:00'),
(12,12, 3, 38, '2024-01-26 22:30:00', '02:05:00'),
(13,13, 4, 29, '2024-01-27 21:00:00', '01:25:00'),
(14,14, 5, 14, '2024-01-28 23:00:00', '02:15:00'),
(15,15, 2, 86, '2024-01-29 20:00:00', '01:35:00'),
(16,16, 6, 91, '2024-01-30 19:15:00', '01:50:00'),
(17,17, 7, 58, '2024-01-31 21:45:00', '02:00:00'),
(18,18, 8, 32, '2024-02-01 22:00:00', '01:45:00'),
(19,19, 9, 50, '2024-02-02 23:30:00', '02:10:00'),
(20,20, 10, 73, '2024-02-03 20:30:00', '01:15:00'),
(21,1, 1, 7, '2024-02-04 21:00:00', '02:00:00'),
(22,2, 3, 65, '2024-02-05 22:15:00', '01:30:00'),
(23,3, 5, 92, '2024-02-06 19:45:00', '02:20:00'),
(24,4, 4, 56, '2024-02-07 20:00:00', '01:40:00'),
(25,5, 6, 83, '2024-02-08 21:30:00', '02:05:00'),
(26,6, 8, 19, '2024-02-09 22:00:00', '01:50:00'),
(27,7, 2, 35, '2024-02-10 23:00:00', '02:10:00'),
(28,8, 7, 8, '2024-02-11 21:45:00', '01:15:00'),
(29,9, 9, 41, '2024-02-12 20:15:00', '02:25:00'),
(30,10, 10, 74, '2024-02-13 19:30:00', '01:35:00'),
(31,11, 1, 66, '2024-02-14 20:45:00', '02:30:00'),
(32,12, 3, 11, '2024-02-15 22:30:00', '01:20:00'),
(33,13, 4, 81, '2024-02-16 21:00:00', '01:50:00'),
(34,14, 5, 33, '2024-02-17 23:00:00', '02:15:00'),
(35,15, 2, 96, '2024-02-18 20:00:00', '01:55:00'),
(36,16, 6, 75, '2024-02-19 19:15:00', '01:45:00'),
(37,17, 7, 20, '2024-02-20 21:45:00', '02:00:00'),
(38,18, 8, 49, '2024-02-21 22:00:00', '01:30:00'),
(39,19, 9, 30, '2024-02-22 23:30:00', '01:20:00'),
(40,20, 10, 3, '2024-02-23 20:30:00', '02:05:00');
