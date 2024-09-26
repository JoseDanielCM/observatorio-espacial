-- 1. Cuerpo celeste y telescopio usado en las observaciones de mas de 2 horas
SELECT celestialBodies.name, telescopes.location FROM observations INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id INNER JOIN telescopes ON observations.idTelescope = telescopes.id WHERE timeSpent > '02:00:00';
-- 2. Nombre y direccion de usuarios que nacieron antes de 1990
SELECT name,address FROM users WHERE birthDate < '1990-01-01';
-- 3. Nombre y Id de los 5 asteroides mas cercanos
SELECT name,id FROM celestialBodies WHERE bodyType = 'asteroid' ORDER BY distance ASC LIMIT 5;
-- 4. Nombre y distancia de las 3 galaxias mas pequeñas
SELECT name,distance FROM celestialBodies WHERE bodyType = 'galaxy' ORDER BY diameter ASC LIMIT 3;
-- 5. Toda la informacion de los agujeros negros en la Via Lactea (Milky Way)
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, celestialBodies.diameter, celestialBodies.diameterUnits, mass, spin FROM blackHoles INNER JOIN celestialBodies ON blackHoles.id = celestialBodies.id WHERE galaxy = 1;
-- 6. Todos los planetas que orbitan al Sol
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, celestialBodies.diameter, celestialBodies.diameterUnits, mass, moonsAmount FROM planets INNER JOIN celestialBodies ON planets.id = celestialBodies.id WHERE planets.orbitId = 41;
-- 7. Todos los eclipses, tanto solares como lunares, que van a pasar en el futuro
SELECT typeAstronomicalEvents.eventName, eventDate FROM astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id WHERE eventId < 3;
-- 8. Los 5 telescoipios mas potentes hasta la resolucion 12000
SELECT location, resolution FROM telescopes WHERE resolution <= 12000 ORDER BY resolution DESC LIMIT 5;
-- 9. Las 6 observaciones en febrero de 2024 mas duraderas
SELECT celestialBodies.name, telescopes.location, users.name, observationDate FROM observations INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id INNER JOIN telescopes ON observations.idTelescope = telescopes.id INNER JOIN users ON users.id = observations.idUser WHERE observationDate >= '2024-02-01  00:00:00' AND observationDate < '2024-03-01 00:00:00' ORDER BY timeSpent DESC LIMIT 6;
-- 10. Todos los planetas con 2 o mas lunas
SELECT celestialBodies.name, moonsAmount FROM planets INNER JOIN celestialBodies ON planets.id = celestialBodies.id WHERE moonsAmount > 1;
-- 11. Los 5 eventos astronomicos mas antiguos
SELECT astronomicalEvents.id, typeAstronomicalEvents.eventName, astronomicalEvents.eventDate FROM astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id ORDER BY astronomicalEvents.eventDate ASC LIMIT 5;
-- 12. Todos los asteroides carbonaceos
SELECT celestialBodies.name, asteroids.mass FROM asteroids INNER JOIN celestialBodies ON asteroids.id = celestialBodies.id WHERE asteroidType = 'carbonaceous';
-- 13. Todos los usuarios que usaron el telescopio en Manua Kea, Hawaii
SELECT users.name, celestialBodies.name FROM observations INNER JOIN users ON observations.idUser = users.id INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id WHERE observations.idTelescope = 1;
-- 14. Cuantos planetas tiene cada estrella, segun la base de datos
SELECT celestialBodies.name, COUNT(planets.id) AS planetCount FROM planets INNER JOIN celestialBodies ON planets.orbitId = celestialBodies.id INNER JOIN stars ON stars.id = celestialBodies.id GROUP BY celestialBodies.name;
-- 15. Todos los agujeros negros en la Via Lactea
SELECT name, blackHoles.mass, blackHoles.spin FROM celestialBodies INNER JOIN blackHoles ON celestialBodies.id = blackHoles.id WHERE blackHoles.galaxy = 1;
-- 16. Todos los asteroides que orbitan cerca a la tierra (63)
SELECT name, distance, distanceUnits, asteroids.mass, asteroids.surface, asteroids.asteroidType FROM celestialBodies INNER JOIN asteroids ON asteroids.id = celestialBodies.id WHERE asteroids.orbitId = 63
-- 17. Todos las observaciones que el usuario George Costanza ha hecho
SELECT telescopes.location,telescopes.resolution, celestialBodies.name, celestialBodies.bodyType FROM observations INNER JOIN telescopes ON telescopes.id = observations.idTelescope INNER JOIN celestialBodies ON celestialBodies.id = observations.idBody WHERE idUser = 7
-- 18. Todas las galaxias con al menos 1 agujero negro en la base de datos
SELECT DISTINCT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, galaxyType FROM galaxies INNER JOIN celestialBodies ON galaxies.id = celestialBodies.id INNER JOIN blackHoles ON blackHoles.galaxy = galaxies.id
-- 19. Todos los usuarios que observaron un agujero negro
SELECT DISTINCT users.id, users.name, users.email FROM users INNER JOIN observations ON users.id = observations.idUser INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id WHERE celestialBodies.bodyType = 'blackHole';
-- 20. Los eventos que van a ocurrir en los proximos 30 dias
SELECT astronomicalEvents.id, typeAstronomicalEvents.eventName, astronomicalEvents.eventDate FROM astronomicalEvents astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id WHERE astronomicalEvents.eventDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
-- 21. 5 galaxias mas masivas
SELECT cb.name, bh.mass FROM celestialBodies cb inner join blackHoles bh on cb id = bh.id order by bh.mass desc limit 5;
-- 22. 10 Usuarios màs viejos
SELECT name,birthDate FROM users order by birthDate limit 10;
-- 23. avistamientos por orden de recientes a antiguos
select observations.observationDate, celestialBodies.name from observations join celestialBodies on observations.idBody = celestialBodies.id order by observations.observationDate desc limit 5
-- 24. seleccionar todos los planetas con sus masas y lunas 
select celestialBodies.name, planets.mass, planets.moonsAmount
from celestialBodies
join planets on planets.id = celestialBodies.id
order by planets.moonsAmount desc
-- 25. Diametro de estrellas que estén en kilometros
SELECT celestialBodies.name, celestialBodies.diameter 
FROM stars 
JOIN celestialBodies ON stars.id = celestialBodies.id 
WHERE diameterUnits = 'kilometers';
-- 26. Cuerpos celestes segun distancia a la tierra en años luz
SELECT name, distance, distanceUnits 
FROM celestialBodies 
where distanceUnits = "lightYears"
ORDER BY distance
;
-- 27. avistamientos
SELECT bodyType, COUNT(*) 
FROM celestialBodies 
GROUP BY bodyType;
-- 28. planetas que orbiten lo mismo que la tierra
SELECT celestialBodies.name
from planets
join celestialBodies on planets.id = celestialBodies.id 
WHERE planets.orbitId = (select planets.orbitId from planets join celestialBodies on planets.id = celestialBodies.id where celestialBodies.name ="Earth");
-- 29. Mostrar todos los tipos y nombres de las galaxias
SELECT celestialBodies.name , galaxies.galaxyType
from celestialBodies
join galaxies on celestialBodies.id = galaxies.id;
-- 30. Estrellas con más de 5 planetas
SELECT celestialBodies.name , stars.planetsAmount
from celestialBodies
join stars on celestialBodies.id = stars.id
WHERE stars.planetsAmount >= 5;
-- 31. Todos los cuerpos celestes y su tipo
select name,bodyType
from celestialBodies;

-- 32. Todos los planetas que sean "gigantes helados"
SELECT celestialBodies.name, planets.mass, planets.moonsAmount, planets.planetType
FROM planets 
JOIN celestialBodies ON planets.id = celestialBodies.id 
WHERE planetType = 'iceGiant';
-- 33. Estrellas de tipo G
SELECT celestialBodies.name, stars.mass 
FROM stars 
JOIN celestialBodies ON stars.id = celestialBodies.id 
WHERE stars.starType = 'g-type';
-- 34. Cuerpos celestes a distancia < a 10 años luz
SELECT name,bodyType, distance, distanceUnits
FROM celestialBodies 
WHERE (distance < 10 AND distanceUnits = 'lightYears') or (distanceUnits="kilometers");
-- 35. Planetas con una masa mayor a la tierra
SELECT celestialBodies.name, planets.mass, planets.moonsAmount 
FROM planets 
JOIN celestialBodies ON planets.id = celestialBodies.id 
WHERE mass > (select planets.mass from planets join celestialBodies on planets.id = celestialBodies.id where celestialBodies.name ="Earth" );
-- 36. Mostrar superficie de todos los asteroides
SELECT celestialBodies.name, asteroids.surface 
FROM asteroids 
JOIN celestialBodies ON asteroids.id = celestialBodies.id;
-- 37. nombre 10 personas de las primeras observaciones
select users.name ,observations.observationDate, celestialBodies.name, celestialBodies.bodyType
from observations
join celestialBodies on observations.idBody = celestialBodies.id 
join users on observations.idUser = users.id
order by observationDate limit 5;

-- 38. telescopios con resoluciones mayores al promedio
select *
from telescopes
where resolution >= (select avg(resolution) from telescopes);

-- 39. Mostrar cuerpos celestes que usen "lighyears" como medida 
select name, distance, distanceUnits, bodyType
from celestialBodies
where distanceUnits = "lightYears";
-- 40. Mostrar galaxia mas cercana, ( que no sea via lactea porque estamos en ella)
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, galaxies.galaxyType 
FROM celestialBodies 
JOIN galaxies ON galaxies.id = celestialBodies.id 
WHERE distance > (select MIN(distance) from celestialBodies) limit 1;