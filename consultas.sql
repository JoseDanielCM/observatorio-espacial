-- 1. Cuerpo celeste y telescopio usado en las observaciones de mas de 2 horas
SELECT celestialBodies.name, telescopes.location FROM observations INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id INNER JOIN telescopes ON observations.idTelescope = telescopes.id WHERE timeSpent > '02:00:00';
-- 2. Nombre y direccion de usuarios que nacieron antes de 1990
SELECT name,address FROM users WHERE birthDate < '1990-01-01';
-- 3. Nombre y Id de los 5 Asteroides mas cercanos
SELECT name,id FROM celestialBodies WHERE bodyType = 'asteroid' ORDER BY distance ASC LIMIT 5;
-- 4. Nombre y distancia de las 3 galaxias mas pequeñas
SELECT name,distance FROM celestialBodies WHERE bodyType = 'galaxy' ORDER BY diameter ASC LIMIT 3;
-- 5. Toda la informacion de los agujeros negros en la Via Lactea (Milky Way)
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, celestialBodies.diameter, celestialBodies.diameterUnits, mass, spin FROM blackHoles INNER JOIN celestialBodies ON blackHoles.id = celestialBodies.id WHERE galaxy = 1


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

-- 25. avistamientos

-- 26. avistamientos

-- 27. avistamientos

-- 28. avistamientos

-- 29. avistamientos

-- 30. avistamientos

-- 31. avistamientos

-- 32. avistamientos

-- 33. avistamientos

-- 34. avistamientos

-- 35. avistamientos

-- 36. avistamientos

-- 37. avistamientos

-- 38. avistamientos

-- 39. avistamientos

-- 40. avistamientos
