# Proyecto de Base de Datos de un Centro Astronómico

## Introducción

Este proyecto consiste en el diseño y desarrollo de una base de datos para un centro astronómico. El objetivo es gestionar la información relacionada con observaciones astronómicas, clientes, telescopios, eventos, y otros datos relevantes. La base de datos está diseñada en SQL y permite realizar consultas avanzadas para obtener información clave sobre las actividades del observatorio.

El sistema de base de datos ayudará a gestionar eficientemente la información de telescopios, el seguimiento de eventos astronómicos, el registro de observaciones, la información de los clientes y de cuerpos celestes como agujeros negros, estrellas galaxias, y demás.

## Estructura de las Tablas y Relaciones

### Tablas

1. **CelestialBodies**: Almacena información general sobre diferentes tipos de cuerpos celestes.
   - `id` (PK): Identificador único del cuerpo celeste.
   - `name`: Nombre del cuerpo celeste.
   - `distance`: Distancia desde la Tierra.
   - `distanceUnits`: Unidades de medida para la distancia (kilómetros, años luz ... ).
   - `diameter`: Diámetro del cuerpo celeste.
   - `diameterUnits`: Unidades de medida para el diámetro.
   - `bodyType`: Tipo de cuerpo celeste (planeta, estrella, galaxia, asteroide, agujero negro).

2. **Planets**: Almacena información específica sobre los planetas.
   - `id` (PK, FK): Relacionado con la tabla `CelestialBodies`.
   - `mass`: Masa del planeta (en relacion a la tierra).
   - `moonsAmount`: Número de lunas del planeta.
   - `orbitId` (FK): Relación con otro cuerpo celeste en torno al cual orbita (El sol).

2. **Telescopes**: Contiene los datos de los telescopios disponibles en el observatorio.
   - `id` (PK): Identificador único del telescopio.
   - `location`: Localicacion o ubicación en la que se encuentra cada telescopio.
   - `resolution`: Resolucion de cada telescopio.

4. **Users**: Almacena información sobre las personas que podrían usar los servicios del centro astronomico
   - `id` (PK): Identificador único del cliente.
   - `name`: Nombre del cliente.
   - `email`: Correo electrónico de contacto.
   - `phone`: Institución a la que pertenece (si aplica).
   - `birthDate`: Fecha en la que nació el cliente.
   - `address`: Dirección del usuario

5. **Galaxies**: Almacena información específica sobre galaxias.
   - `id` (PK, FK): Relacionado con la tabla `CelestialBodies`.
   - `galaxyType`: Tipo de galaxia (espiral, elíptica, lenticular, cuásar).
   - `galaxyGroup`: Grupo o cúmulo de galaxias al que pertenece.

6. **Stars**: Contiene información sobre las estrellas.
   - `id` (PK, FK): Relacionado con la tabla `CelestialBodies`.
   - `mass`: Masa de la estrella.
   - `planetsAmount`: Cantidad de planetas que orbitan alrededor de la estrella.
   - `galaxy` (FK): Relación con la tabla `Galaxies`.

7. **BlackHoles**: Almacena información sobre los agujeros negros.
   - `id` (PK, FK): Relacionado con la tabla `CelestialBodies`.
   - `mass`: Masa del agujero negro.
   - `spin`: Velocidad de rotación del agujero negro (0 a 1).
   - `galaxy` (FK): Relación con la tabla `Galaxies`.

8. **Asteroids**: Almacena información específica sobre los asteroides.
   - `id` (PK, FK): Relacionado con la tabla `CelestialBodies`.
   - `asteroidType`: Tipo de asteroide (carbonáceo, pedregoso, de hierro y níquel).
   - `mass`: Masa del asteroide.
   - `surface`: Composición de la superficie del asteroide.
   - `orbitId` (FK): Relación con el cuerpo celeste alrededor del cual orbita.

9. **TypeAstronomicalEvents**: Contiene los diferentes tipos de eventos astronómicos.
   - `id` (PK): Identificador único del tipo de evento.
   - `eventName`: Nombre del tipo de evento (eclipse, lluvia de meteoros).

10. **astronomicalEvents**: Guarda información sobre eventos astronómicos relevantes (eclipses, lluvias de meteoros, etc.).
   - `id` (PK): Identificador único del evento.
   - `eventId`: Nombre del evento astronómico.
   - `eventDate`: Fecha y hora en la que ocurre el evento.

11. **Observations**: Registra las observaciones astronómicas realizadas.
   - `id` (PK): Identificador único de la observación.
   - `idTelescope` (FK): Relación con el telescopio utilizado.
   - `idUser` (FK): Relación con el cliente que realizó la observación.
   - `idBody` (FK): Relación con el cuerpo celeste al cual se le realizó la observación.
   - `observationDate`: Fecha y hora de la observación.
   - `timeSpent`: Tiempo usado en la observacion del cuerpo celeste.
---

## Relaciones

- Un **usuario** puede realizar múltiples **observaciones** (relación 1:N).
- Un **telescopio** puede ser utilizado en varias **observaciones** (relación 1:N).
- Un **cuerpo celeste** puede ser observado en varias **observaciones** (relación 1:N).
- Un **cuerpo celeste** puede ser de diferentes tipos como **planeta**, **estrella**, **galaxia**, etc. Las tablas `Planets`, `Stars`, `Galaxies`, `BlackHoles` y `Asteroids` extienden la tabla `CelestialBodies` con información específica para cada tipo de cuerpo.
- Un **evento astronómico** puede pertenecer a un tipo específico de evento definido en la tabla `TypeAstronomicalEvents`.

## Consultas SQL

### 1. Cuerpo celeste y telescopio usado en las observaciones de mas de 2 horas

```sql
SELECT celestialBodies.name, telescopes.location FROM observations INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id INNER JOIN telescopes ON observations.idTelescope = telescopes.id WHERE timeSpent > '02:00:00';
```
| Name                     | Location                                   |
|--------------------------|--------------------------------------------|
| IC 1101 galaxy            | Hubble Space Telescope                     |
| TRAPPIST-1                | Arecibo Observatory, Puerto Rico           |
| Whirlpool Galaxy          | Kitt Peak National Observatory, Arizona    |
| NGC 3115                 | Palomar Observatory, California            |
| Small Magellanic Cloud    | Keck Observatory, Hawaii                   |
| Aldebaran                 | Kitt Peak National Observatory, Arizona    |
| Eugenia                  | Keck Observatory, Hawaii                   |
| Pallas                   | Atacama Desert, Chile                      |
| ESO 243-49 HLX-1          | La Silla Observatory, Chile                |
| Sun                      | Kitt Peak National Observatory, Arizona    |
| Saturn                   | Mauna Kea, Hawaii                          |
| NGC 4889                 | Keck Observatory, Hawaii                   |
| Triangulum               | Cerro Tololo Inter-American Observatory, Chile |



### 2. Nombre y direccion de usuarios que nacieron antes de 1990

```sql
SELECT name,address FROM users WHERE birthDate < '1990-01-01';
```
| Name            | Address               |
|-----------------|-----------------------|
| Bob Smith       | 456 Oak St, Springfield|
| Diana Prince    | 101 Maple St, Springfield|
| Ethan Hunt      | 202 Birch St, Springfield|
| George Costanza | 404 Walnut St, Springfield|
| Kevin Spacey    | 808 Elm St, Springfield|
| Laura Croft     | 909 Oak St, Springfield|
| Michael Scott   | 111 Pine St, Springfield|
| Nina Simone     | 222 Maple St, Springfield|
| Rachel Green    | 666 Hickory St, Springfield|
| Sam Winchester  | 777 Sycamore St, Springfield|


### 3. Nombre y Id de los 5 asteroides mas cercanos

```sql
SELECT name,id FROM celestialBodies WHERE bodyType = 'asteroid' ORDER BY distance ASC LIMIT 5;
```

| Name        | ID  |
|-------------|-----|
| Apophis     | 97  |
| Toutatis    | 90  |
| Bennu       | 87  |
| Orpheus     | 98  |
| 1998 KY26   | 100 |

### 4. Nombre y distancia de las 3 galaxias mas pequeñas

```sql
SELECT name,distance FROM celestialBodies WHERE bodyType = 'galaxy' ORDER BY diameter ASC LIMIT 3;
```

| Name                   | Distance (million light-years) |
|------------------------|-------------------------------|
| Small Magellanic Cloud  | 0.197                         |
| Large Magellanic Cloud  | 0.163                         |
| Sombrero Galaxy         | 31.6                          |


### 5. Toda la informacion de los agujeros negros en la Via Lactea (Milky Way)

```sql
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, celestialBodies.diameter, celestialBodies.diameterUnits, mass, spin FROM blackHoles INNER JOIN celestialBodies ON blackHoles.id = celestialBodies.id WHERE galaxy = 1;
```
| Name              | Distance (light-years) | Diameter (kilometers) | Mass (solar masses) | Spin |
|-------------------|-----------------------|----------------------|---------------------|------|
| Ton 618           | 10,000,000,000        | 5,000,000,000        | 1.32e40             | 0.8  |
| Sagittarius A*    | 26,000                | 44,000,000           | 4e32                | 0.5  |
| Cygnus X-1       | 60,700                | 88,000,000           | 1e35                | 0.3  |
| V404 Cygni       | 78,000                | 76,000,000           | 1e33                | 0.4  |
| GRO J1655-40     | 11,200                | 51,000,000           | 6e33                | 0.5  |
| GX 339-4         | 13,500                | 48,000,000           | 2e29                | 0.6  |
| NGC 4889         | 336,000,000           | 130,000,000          | 3e31                | 0.3  |
| NGC 3115         | 32,000,000            | 900,000              | 1e33                | 0.2  |
| Mrk 501          | 456,000,000           | 120,000,000          | 1e31                | 0.4  |

### 6. Todos los planetas que orbitan al Sol

```sql
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, celestialBodies.diameter, celestialBodies.diameterUnits, mass, moonsAmount FROM planets INNER JOIN celestialBodies ON planets.id = celestialBodies.id WHERE planets.orbitId = 41;
```

| Name      | Distance (light-years) | Diameter (kilometers) | Mass (solar masses) | Moons Amount |
|-----------|-----------------------|----------------------|---------------------|--------------|
| Mercury   | 0                     | 4,879                | 0.05                | 0            |
| Venus     | 0                     | 12,104               | 0.8                 | 0            |
| Earth     | 0                     | 12,742               | 1                   | 1            |
| Mars      | 0                     | 6,779                | 0.1                 | 1            |
| Jupiter   | 0                     | 139,820              | 317.8               | 2            |
| Saturn    | 0                     | 116,460              | 95.2                | 95           |
| Uranus    | 0                     | 50,724               | 14.5                | 146          |
| Neptune   | 0                     | 49,244               | 17.1                | 27           |
| Pluto     | 0                     | 2,376                | 0.0022              | 14           |
| Haumea    | 0                     | 1,960                | 0.00067             | 5            |
| Makemake  | 0                     | 1,430                | 0.00052             | 2            |
| Eris      | 0                     | 2,326                | 0.0028              | 1            |

### 7. Todos los eclipses, tanto solares como lunares, que van a pasar en el futuro

```sql
SELECT typeAstronomicalEvents.eventName, eventDate FROM astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id WHERE eventId < 3;
```
| Event Name      | Event Date   |
|------------------|--------------|
| Solar Eclipse     | 2024-04-08   |
| Solar Eclipse     | 2026-08-12   |
| Solar Eclipse     | 2024-10-02   |
| Lunar Eclipse     | 2024-03-25   |
| Lunar Eclipse     | 2024-09-17   |

### 8. Los 5 telescoipios mas potentes hasta la resolucion 12000

```sql
SELECT location, resolution FROM telescopes WHERE resolution <= 12000 ORDER BY resolution DESC LIMIT 5;
```

| Location                                | Resolution |
|-----------------------------------------|------------------|
| La Silla Observatory, Chile             | 12,000           |
| Hubble Space Telescope                  | 12,000           |
| Atacama Desert, Chile                   | 11,000           |
| Mt. Graham International Observatory, Arizona | 11,000      |
| National Radio Astronomy Observatory, Virginia | 10,000     |

### 9. Las 6 observaciones en febrero de 2024 mas duraderas

```sql
SELECT celestialBodies.name, telescopes.location, users.name, observationDate FROM observations INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id INNER JOIN telescopes ON observations.idTelescope = telescopes.id INNER JOIN users ON users.id = observations.idUser WHERE observationDate >= '2024-02-01  00:00:00' AND observationDate < '2024-03-01 00:00:00' ORDER BY timeSpent DESC LIMIT 6;
```

| Name               | Location                            | Observer        | Observation Date       |
|--------------------|-------------------------------------|------------------|-------------------------|
| Saturn             | Mauna Kea, Hawaii                  | Kevin Spacey     | 2024-02-14 20:45:00     |
| Sun                | Kitt Peak National Observatory, Arizona | Isaac Newton   | 2024-02-12 20:15:00     |
| Eugenia            | Keck Observatory, Hawaii            | Charlie Brown    | 2024-02-06 19:45:00     |
| NGC 4889          | Keck Observatory, Hawaii            | Nina Simone      | 2024-02-17 23:00:00     |
| Aldebaran          | Kitt Peak National Observatory, Arizona | Sam Winchester | 2024-02-02 23:30:00     |
| ESO 243-49 HLX-1   | La Silla Observatory, Chile         | George Costanza  | 2024-02-10 23:00:00     |


### 10. Todos los planetas con 2 o mas lunas

```sql
SELECT celestialBodies.name, moonsAmount FROM planets INNER JOIN celestialBodies ON planets.id = celestialBodies.id WHERE moonsAmount > 1;
```
| Name      | Moons Amount |
|-----------|--------------|
| Jupiter   | 2            |
| Saturn    | 95           |
| Uranus    | 146          |
| Neptune   | 27           |
| Pluto     | 14           |
| Haumea    | 5            |
| Makemake  | 2            |


### 11. Los 5 eventos astronomicos mas antiguos

```sql
SELECT astronomicalEvents.id, typeAstronomicalEvents.eventName, astronomicalEvents.eventDate FROM astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id ORDER BY astronomicalEvents.eventDate ASC LIMIT 5;
```
| ID | Event Name       | Event Date   |
|----|------------------|--------------|
| 9  | Supernovae       | 1217-07-15   |
| 8  | Conjunctions     | 2020-12-21   |
| 17 | Meteor Shower    | 2024-01-03   |
| 3  | Lunar Eclipse     | 2024-03-25   |
| 1  | Solar Eclipse    | 2024-04-08   |

### 12. Todos los asteroides carbonaceos

```sql
SELECT celestialBodies.name, asteroids.mass FROM asteroids INNER JOIN celestialBodies ON asteroids.id = celestialBodies.id WHERE asteroidType = 'carbonaceous';
```

| Name       | Mass (kg)   |
|------------|-------------|
| Ceres      | 939,000,000 |
| Hygiea     | 83,200,000  |
| Bennu      | 0.0733      |
| Mathilde   | 103,000     |
| Eugenia    | 5,690,000   |
| Davida     | 38,400,000  |
| 1998 KY26  | 0.000025    |

### 13. Todos los usuarios que usaron el telescopio en Manua Kea, Hawaii

```sql
SELECT users.name, celestialBodies.name FROM observations INNER JOIN users ON observations.idUser = users.id INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id WHERE observations.idTelescope = 1;
```
| Name             | Related Name        |
|------------------|---------------------|
| Bob Smith        | Betelgeuse          |
| Kevin Spacey     | Florence            |
| Alice Johnson     | Pinwheel Galaxy     |
| Kevin Spacey     | Saturn              |

### 14. Cuantos planetas tiene cada estrella, segun la base de datos

```sql
SELECT celestialBodies.name, COUNT(planets.id) AS planetCount FROM planets INNER JOIN celestialBodies ON planets.orbitId = celestialBodies.id INNER JOIN stars ON stars.id = celestialBodies.id GROUP BY celestialBodies.name;
```

| Name                | Planet Count |
|---------------------|--------------|
| Sun                 | 12           |
| Proxima Centauri    | 1            |
| TRAPPIST-1         | 1            |
| WASP-12            | 1            |
| 55 Cancri          | 1            |
| HD 209458          | 1            |
| Gliese 581         | 1            |
| Kepler-452         | 1            |
| Kepler-22          | 1            |


### 15. Todos los agujeros negros en la Via Lactea

```sql
SELECT name, blackHoles.mass, blackHoles.spin FROM celestialBodies INNER JOIN blackHoles ON celestialBodies.id = blackHoles.id WHERE blackHoles.galaxy = 1;
```
| Name              | Mass (kg)    | Spin |
|--------------------|--------------|------|
| Ton 618            | 1.32e40      | 0.8  |
| Sagittarius A*     | 4e32         | 0.5  |
| Cygnus X-1       | 1e35         | 0.3  |
| V404 Cygni       | 1e33         | 0.4  |
| GRO J1655-40     | 6e33         | 0.5  |
| GX 339-4         | 2e29         | 0.6  |
| NGC 4889         | 3e31         | 0.3  |
| NGC 3115         | 1e33         | 0.2  |
| Mrk 501          | 1e31         | 0.4  |

### 16. Todos los asteroides que orbitan cerca a la tierra (63)

```sql
SELECT name, distance, distanceUnits, asteroids.mass, asteroids.surface, asteroids.asteroidType FROM celestialBodies INNER JOIN asteroids ON asteroids.id = celestialBodies.id WHERE asteroids.orbitId = 63;
```
| Name     | Distance (km) | Mass (kg) | Surface                          | Asteroid Type |
|----------|---------------|-----------|----------------------------------|---------------|
| Eros     | 218,000,000   | 6,690     | Rocky with large craters and ridges | Stony         |
| Mathilde | 396,000,000   | 103,000   | Dark and heavily cratered         | Carbonaceous  |
| Psyche   | 448,000,000   | 27,200,000| Metallic with impact craters      | Nickel-Iron   |
| Apophis  | 137,000,000   | 0.0438    | Rocky with small craters          | Stony         |


### 17. Todos las observaciones que el usuario George Costanza ha hecho

```sql
SELECT telescopes.location,telescopes.resolution, celestialBodies.name, celestialBodies.bodyType FROM observations INNER JOIN telescopes ON telescopes.id = observations.idTelescope INNER JOIN celestialBodies ON celestialBodies.id = observations.idBody WHERE idUser = 7;
```
| Location                      | Resolution (km) | Name                   | Body Type   |
|-------------------------------|------------------|------------------------|-------------|
| La Silla Observatory, Chile    | 12,000           | NGC 1300               | Galaxy      |
| La Silla Observatory, Chile    | 12,000           | ESO 243-49 HLX-1      | Black Hole  |

### 18. Todas las galaxias con al menos 1 agujero negro en la base de datos

```sql
SELECT DISTINCT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, galaxyType FROM galaxies INNER JOIN celestialBodies ON galaxies.id = celestialBodies.id INNER JOIN blackHoles ON blackHoles.galaxy = galaxies.id;
```
| Name                   | Distance (million light-years) | Distance Units   | Galaxy Type   |
|------------------------|---------------------------------|------------------|---------------|
| Milky Way              | 0                               | light years       | Spiral        |
| Andromeda              | 2.537                           | million light years| Spiral        |
| Triangulum             | 3                               | million light years| Spiral        |
| Whirlpool Galaxy       | 23.16                           | million light years| Spiral        |
| Sombrero Galaxy        | 31.6                            | million light years| Spiral        |
| Messier 87             | 53.5                            | million light years| Elliptical    |
| Cartwheel Galaxy       | 500                             | million light years| Lenticular    |
| Messier 81             | 11.74                           | million light years| Spiral        |
| NGC 253                | 11.42                           | million light years| Spiral        |
| NGC 6744               | 30                              | million light years| Spiral        |

### 19. Todos los usuarios que observaron un agujero negro

```sql
SELECT DISTINCT users.id, users.name, users.email FROM users INNER JOIN observations ON users.id = observations.idUser INNER JOIN celestialBodies ON observations.idBody = celestialBodies.id WHERE celestialBodies.bodyType = 'blackHole';
```
| ID | Name             | Email                     |
|----|------------------|---------------------------|
| 3  | Charlie Brown    | charlie.brown@gmail.com   |
| 13 | Michael Scott    | michael.scott@gmail.com   |
| 19 | Sam Winchester    | sam.winchester@gmail.com   |
| 18 | Rachel Green     | rachel.green@gmail.com     |
| 14 | Nina Simone      | nina.simone@gmail.com      |
| 7  | George Costanza  | george.costanza@gmail.com  |
| 5  | Ethan Hunt       | ethan.hunt@gmail.com       |
| 12 | Laura Croft      | laura.croft@gmail.com      |


### 20. Los eventos que van a ocurrir en los proximos 30 dias

```sql
SELECT astronomicalEvents.id, typeAstronomicalEvents.eventName, astronomicalEvents.eventDate FROM astronomicalEvents astronomicalEvents INNER JOIN typeAstronomicalEvents ON astronomicalEvents.eventId = typeAstronomicalEvents.id WHERE astronomicalEvents.eventDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);
```
| ID | Event Name      | Event Date   |
|----|------------------|--------------|
| 5  | Meteor Shower    | 2024-10-08   |
| 18 | Meteor Shower    | 2024-10-21   |
| 20 | Solar Eclipse    | 2024-10-02   |


### 21. 5 galaxias mas masivas

```sql
SELECT cb.name, bh.mass FROM celestialBodies cb inner join blackHoles bh on cb.id = bh.id order by bh.mass desc limit 5;

```
| Name               | Mass (kg)        |
|---------------------|------------------|
| Ton 618             | 1.32e40          |
| GRS 1915+105        | 1e38             |
| XTE J1118+480       | 1e37             |
| ESO 243-49 HLX-1   | 7.0e36           |
| Cygnus X-1         | 1e35             |

### 22. 10 Usuarios màs viejos

```sql
SELECT name,birthDate FROM users order by birthDate limit 10;

```
| Name             | Birth Date   |
|-------------------|--------------|
| Ethan Hunt        | 1980-07-10   |
| Michael Scott     | 1981-12-25   |
| Nina Simone       | 1982-02-21   |
| George Costanza   | 1983-06-25   |
| Bob Smith         | 1985-05-22   |
| Sam Winchester     | 1985-10-04   |
| Rachel Green      | 1986-07-30   |
| Kevin Spacey      | 1987-04-15   |
| Diana Prince      | 1988-12-05   |
| Laura Croft       | 1989-10-09   |

### 23. avistamientos por orden de recientes a antiguos

```sql
SELECT observations.observationDate, celestialBodies.name from observations join celestialBodies on observations.idBody = celestialBodies.id order by observations.observationDate desc limit 5;

```
| Observation Date       | Name          |
|------------------------|---------------|
| 2024-02-23 20:30:00    | Triangulum    |
| 2024-02-22 23:30:00    | GRS 1915+105  |
| 2024-02-21 22:00:00    | Rigel         |
| 2024-02-20 21:45:00    | ESO 137-001   |
| 2024-02-19 19:15:00    | Kepler-452b   |

### 24. seleccionar todos los planetas con sus masas y lunas 

```sql
SELECT celestialBodies.name, planets.mass, planets.moonsAmount from celestialBodies join planets on planets.id = celestialBodies.id order by planets.moonsAmount desc;
```
| Name              | Mass   | Moons Amount |
|--------------------|--------|--------------|
| Uranus             | 14.5   | 146          |
| Saturn             | 95.2   | 95           |
| Neptune            | 17.1   | 27           |
| Pluto              | 0.0022 | 14           |
| Haumea             | 0.00067| 5            |
| Jupiter            | 317.8  | 2            |
| Makemake           | 0.00052| 2            |
| Earth              | 1      | 1            |
| Mars               | 0.1    | 1            |
| Eris               | 0.0028 | 1            |
| Kepler-22b        | 30     | 1            |
| TRAPPIST-1d       | 0.38   | 0            |
| Mercury            | 0.05   | 0            |
| WASP-12b          | 1.47   | 0            |
| 55 Cancri e       | 8      | 0            |
| HD 209458 b       | 0.69   | 0            |
| Gliese 581g       | 3.1    | 0            |
| Kepler-452b       | 5      | 0            |
| Proxima Centauri b| 1.17   | 0            |
| Venus              | 0.8    | 0            |


### 25. Diametro de estrellas que estén en kilometros

```sql
SELECT celestialBodies.name, celestialBodies.diameter FROM stars JOIN celestialBodies ON stars.id = celestialBodies.id WHERE diameterUnits = 'kilometers';
```
| Name                 | Diameter (km)  |
|----------------------|----------------|
| Sun                  | 1,390,000      |
| Proxima Centauri     | 200,000        |
| Alpha Centauri A     | 1,230,000      |
| Alpha Centauri B     | 870,000        |
| Betelgeuse           | 1,400,000,000  |
| Sirius A             | 2,396,000      |
| Sirius B             | 11,800         |
| Vega                 | 2,700,000      |
| Rigel                | 980,000,000    |
| Aldebaran            | 61,000,000     |
| Arcturus             | 36,000,000     |
| Antares              | 1,180,000,000  |
| TRAPPIST-1          | 8,800,000      |
| WASP-12              | 7,500,000      |
| 55 Cancri            | 1,700,000      |
| HD 209458            | 1,720,000      |
| Gliese 581          | 2,030,000,000  |
| Kepler-452           | 99,400,000     |
| Capella              | 11,000,000     |
| Kepler-22            | 1,260,000,000  |

### 26. Cuerpos celestes segun distancia a la tierra en años luz

```sql
SELECT name, distance, distanceUnits FROM celestialBodies where distanceUnits = "lightYears" ORDER BY distance;

```
| Name                 | Distance   | Distance Units |
|----------------------|------------|-----------------|
| Venus                | 0          | lightYears       |
| Milky Way            | 0          | lightYears       |
| Sun                  | 0          | lightYears       |
| Mercury              | 0          | lightYears       |
| Earth                | 0          | lightYears       |
| Mars                 | 0          | lightYears       |
| Jupiter              | 0          | lightYears       |
| Saturn               | 0          | lightYears       |
| Uranus               | 0          | lightYears       |
| Pluto                | 0          | lightYears       |
| Haumea               | 0          | lightYears       |
| Makemake             | 0          | lightYears       |
| Eris                 | 0          | lightYears       |
| Neptune              | 0          | lightYears       |
| Proxima Centauri b   | 4.24       | lightYears       |
| Proxima Centauri     | 4.24       | lightYears       |
| Alpha Centauri B     | 4.37       | lightYears       |
| Alpha Centauri A     | 4.37       | lightYears       |
| Sirius B             | 8.6        | lightYears       |
| Sirius A             | 8.6        | lightYears       |
| 55 Cancri            | 16.73      | lightYears       |
| Gliese 581g          | 20.4       | lightYears       |
| Vega                 | 25.04      | lightYears       |
| HD 209458            | 25.13      | lightYears       |
| TRAPPIST-1          | 33.78      | lightYears       |
| Arcturus             | 36.7       | lightYears       |
| TRAPPIST-1d          | 39         | lightYears       |
| 55 Cancri e         | 41         | lightYears       |
| Capella              | 42.92      | lightYears       |
| Aldebaran            | 65.1       | lightYears       |
| HD 209458 b         | 153        | lightYears       |
| WASP-12              | 250        | lightYears       |
| Kepler-452           | 310        | lightYears       |
| Antares              | 554        | lightYears       |
| Kepler-22b          | 600        | lightYears       |
| Betelgeuse           | 642.5      | lightYears       |
| Rigel                | 860        | lightYears       |
| Kepler-452b         | 1400       | lightYears       |
| WASP-12b             | 1410       | lightYears       |
| Gliese 581          | 2600       | lightYears       |
| Kepler-22            | 6000       | lightYears       |
| GRO J1655-40        | 11200      | lightYears       |
| GX 339-4            | 13500      | lightYears       |
| Sagittarius A*      | 26000      | lightYears       |
| GRS 1915+105        | 36000      | lightYears       |
| Cygnus X-1          | 60700      | lightYears       |
| XTE J1118+480       | 62000      | lightYears       |
| V404 Cygni          | 78000      | lightYears       |
| NGC 3115            | 32000000   | lightYears       |
| M87*                 | 53000000   | lightYears       |
| NGC 1365            | 56000000   | lightYears       |
| NGC 4151            | 62000000   | lightYears       |
| NGC 1600            | 200000000  | lightYears       |
| NGC 1277            | 220000000  | lightYears       |
| ESO 243-49 HLX-1    | 290000000  | lightYears       |
| NGC 4889            | 336000000  | lightYears       |
| Ophiuchus           | 390000000  | lightYears       |
| Mrk 501              | 456000000  | lightYears       |
| IC 1101             | 1045000000 | lightYears       |
| 3C 273              | 2400000000 | lightYears       |
| Ton 618             | 10000000000| lightYears       |

### 27. Cantidad de cada tipo de cuerpo celeste

```sql
SELECT bodyType, COUNT(*) FROM celestialBodies GROUP BY bodyType;

```
| Body Type   | Count |
|-------------|-------|
| galaxy      | 20    |
| blackHole   | 20    |
| star        | 20    |
| planet      | 20    |
| asteroid    | 20    |

### 28. planetas que orbiten lo mismo que la tierra

```sql
SELECT celestialBodies.name from planets join celestialBodies on planets.id = celestialBodies.id  WHERE planets.orbitId = (select planets.orbitId from planets join celestialBodies on planets.id = celestialBodies.id where celestialBodies.name ="Earth");

```

| Name      |
|-----------|
| Mercury   |
| Venus     |
| Earth     |
| Mars      |
| Jupiter   |
| Saturn    |
| Uranus    |
| Neptune   |
| Pluto     |
| Haumea    |
| Makemake  |
| Eris      |

### 29. Mostrar todos los tipos y nombres de las galaxias

```sql
SELECT celestialBodies.name , galaxies.galaxyType from celestialBodies join galaxies on celestialBodies.id = galaxies.id;

```
| Name                      | Galaxy Type   |
|---------------------------|---------------|
| Milky Way                 | spiral        |
| Andromeda                 | spiral        |
| Triangulum                | spiral        |
| Whirlpool Galaxy          | spiral        |
| Sombrero Galaxy           | spiral        |
| Messier 87                | elliptical     |
| Pinwheel Galaxy           | spiral        |
| Cartwheel Galaxy          | lenticular    |
| Centaurus A              | elliptical     |
| NGC 1300                  | spiral        |
| NGC 4993                  | elliptical     |
| IC 1101 galaxy            | elliptical     |
| Large Magellanic Cloud    | spiral        |
| Small Magellanic Cloud    | spiral        |
| Messier 81                | spiral        |
| NGC 253                   | spiral        |
| NGC 891                   | spiral        |
| NGC 6744                  | spiral        |
| NGC 3370                  | spiral        |
| ESO 137-001              | spiral        |


### 30. Estrellas con más de 5 planetas

```sql
SELECT celestialBodies.name , stars.planetsAmount from celestialBodies join stars on celestialBodies.id = stars.id WHERE stars.planetsAmount >= 5;

```

| Name            | Planets Amount |
|------------------|----------------|
| Sun              | 8              |
| TRAPPIST-1      | 7              |
| 55 Cancri       | 5              |
| Gliese 581      | 6              |


### 31. Todos los cuerpos celestes y su tipo

```sql
select name,bodyType from celestialBodies;
```
| Name                       | Body Type |
|----------------------------|-----------|
| Milky Way                  | galaxy    |
| Andromeda                  | galaxy    |
| Triangulum                 | galaxy    |
| Whirlpool Galaxy           | galaxy    |
| Sombrero Galaxy            | galaxy    |
| Messier 87                 | galaxy    |
| Pinwheel Galaxy            | galaxy    |
| Cartwheel Galaxy           | galaxy    |
| Centaurus A               | galaxy    |
| NGC 1300                   | galaxy    |
| NGC 4993                   | galaxy    |
| IC 1101 galaxy             | galaxy    |
| Large Magellanic Cloud     | galaxy    |
| Small Magellanic Cloud     | galaxy    |
| Messier 81                 | galaxy    |
| NGC 253                    | galaxy    |
| NGC 891                    | galaxy    |
| NGC 6744                   | galaxy    |
| NGC 3370                   | galaxy    |
| ESO 137-001                | galaxy    |
| Ton 618                    | blackHole  |
| Sagittarius A*            | blackHole  |
| M87*                       | blackHole  |
| Cygnus X-1                | blackHole  |
| V404 Cygni                | blackHole  |
| NGC 1277                   | blackHole  |
| GRO J1655-40              | blackHole  |
| GX 339-4                  | blackHole  |
| XTE J1118+480             | blackHole  |
| GRS 1915+105              | blackHole  |
| Ophiuchus                 | blackHole  |
| NGC 1365                  | blackHole  |
| NGC 4889                   | blackHole  |
| IC 1101                    | blackHole  |
| ESO 243-49 HLX-1          | blackHole  |
| 3C 273                    | blackHole  |
| NGC 4151                   | blackHole  |
| NGC 3115                   | blackHole  |
| NGC 1600                   | blackHole  |
| Mrk 501                    | blackHole  |
| Sun                        | star      |
| Proxima Centauri           | star      |
| Alpha Centauri A           | star      |
| Alpha Centauri B           | star      |
| Betelgeuse                 | star      |
| Sirius A                   | star      |
| Sirius B                   | star      |
| Vega                       | star      |
| Rigel                      | star      |
| Aldebaran                  | star      |
| Arcturus                   | star      |
| Antares                    | star      |
| TRAPPIST-1                | star      |
| WASP-12                    | star      |
| 55 Cancri                 | star      |
| HD 209458                  | star      |
| Gliese 581                 | star      |
| Kepler-452                 | star      |
| Capella                    | star      |
| Kepler-22                  | star      |
| Mercury                    | planet    |
| Venus                      | planet    |
| Earth                      | planet    |
| Mars                       | planet    |
| Jupiter                    | planet    |
| Saturn                     | planet    |
| Uranus                     | planet    |
| Neptune                    | planet    |
| Pluto                      | planet    |
| Haumea                     | planet    |
| Makemake                   | planet    |
| Eris                       | planet    |
| Kepler-22b                | planet    |
| Proxima Centauri b         | planet    |
| Kepler-452b               | planet    |
| Gliese 581g                | planet    |
| HD 209458 b                | planet    |
| 55 Cancri e               | planet    |
| WASP-12b                  | planet    |
| TRAPPIST-1d               | planet    |
| Ceres                      | asteroid  |
| Vesta                      | asteroid  |
| Pallas                     | asteroid  |
| Hygiea                     | asteroid  |
| Eros                       | asteroid  |
| Itokawa                   | asteroid  |
| Bennu                      | asteroid  |
| Gaspra                     | asteroid  |
| Ida                        | asteroid  |
| Toutatis                   | asteroid  |
| Mathilde                   | asteroid  |
| Eugenia                    | asteroid  |
| Davida                     | asteroid  |
| Juno                       | asteroid  |
| Psyche                     | asteroid  |
| 1994 PC1                  | asteroid  |
| Apophis                   | asteroid  |
| Orpheus                   | asteroid  |
| Florence                   | asteroid  |
| 1998 KY26                 | asteroid  |

### 32. Todos los planetas que sean "gigantes helados"

```sql
SELECT celestialBodies.name, planets.mass, planets.moonsAmount, planets.planetType FROM planets JOIN celestialBodies ON planets.id = celestialBodies.id  WHERE planetType = 'iceGiant';

```
| Name        | Mass  | Moons Amount | Planet Type |
|-------------|-------|--------------|-------------|
| Uranus     | 14.5  | 146          | iceGiant    |
| Neptune     | 17.1  | 27           | iceGiant    |
| Kepler-22b | 30    | 1            | iceGiant    |

### 33. Estrellas de tipo G

```sql
SELECT celestialBodies.name, stars.mass FROM stars JOIN celestialBodies ON stars.id = celestialBodies.id  WHERE stars.starType = 'g-type';

```
| Name                | Mass  |
|---------------------|-------|
| Sun                 | 1     |
| Alpha Centauri A    | 1.1   |
| HD 209458           | 1.1   |
| Kepler-452          | 1.04  |
| Capella             | 1.5   |
| Kepler-22          | 1     |

### 34. Cuerpos celestes a distancia < a 10 años luz

```sql
SELECT name,bodyType, distance, distanceUnits FROM celestialBodies WHERE (distance < 10 AND distanceUnits = 'lightYears') or (distanceUnits="kilometers");

```
| Name                  | Body Type | Distance      | Distance Units |
|-----------------------|-----------|---------------|-----------------|
| Milky Way             | galaxy    | 0             | lightYears       |
| Sun                   | star      | 0             | lightYears       |
| Proxima Centauri      | star      | 4.24          | lightYears       |
| Alpha Centauri A      | star      | 4.37          | lightYears       |
| Alpha Centauri B      | star      | 4.37          | lightYears       |
| Sirius A              | star      | 8.6           | lightYears       |
| Sirius B              | star      | 8.6           | lightYears       |
| Mercury               | planet    | 0             | lightYears       |
| Venus                 | planet    | 0             | lightYears       |
| Earth                 | planet    | 0             | lightYears       |
| Mars                  | planet    | 0             | lightYears       |
| Jupiter               | planet    | 0             | lightYears       |
| Saturn                | planet    | 0             | lightYears       |
| Uranus                | planet    | 0             | lightYears       |
| Neptune               | planet    | 0             | lightYears       |
| Pluto                 | planet    | 0             | lightYears       |
| Haumea                | planet    | 0             | lightYears       |
| Makemake              | planet    | 0             | lightYears       |
| Eris                  | planet    | 0             | lightYears       |
| Proxima Centauri b    | planet    | 4.24          | lightYears       |
| Ceres                 | asteroid  | 413000000     | kilometers        |
| Vesta                 | asteroid  | 353000000     | kilometers        |
| Pallas                | asteroid  | 413000000     | kilometers        |
| Hygiea                | asteroid  | 469000000     | kilometers        |
| Eros                  | asteroid  | 218000000     | kilometers        |
| Itokawa               | asteroid  | 197000000     | kilometers        |
| Bennu                 | asteroid  | 169000000     | kilometers        |
| Gaspra                | asteroid  | 330000000     | kilometers        |
| Ida                   | asteroid  | 427000000     | kilometers        |
| Toutatis              | asteroid  | 152000000     | kilometers        |
| Mathilde              | asteroid  | 396000000     | kilometers        |
| Eugenia               | asteroid  | 407000000     | kilometers        |
| Davida                | asteroid  | 472000000     | kilometers        |
| Juno                  | asteroid  | 399000000     | kilometers        |
| Psyche                | asteroid  | 448000000     | kilometers        |
| 1994 PC1             | asteroid  | 227000000     | kilometers        |
| Apophis               | asteroid  | 137000000     | kilometers        |
| Orpheus               | asteroid  | 181000000     | kilometers        |
| Florence              | asteroid  | 264000000     | kilometers        |
| 1998 KY26            | asteroid  | 182000000     | kilometers        |


### 35. Planetas con una masa mayor a la tierra

```sql
SELECT celestialBodies.name, planets.mass, planets.moonsAmount FROM planets JOIN celestialBodies ON planets.id = celestialBodies.id  WHERE mass > (select planets.mass from planets join celestialBodies on planets.id = celestialBodies.id where celestialBodies.name ="Earth" );

```
| Name                 | Mass  | Moons Amount | Planet Type |
|----------------------|-------|--------------|-------------|
| Jupiter              | 317.8 | 2            | gasGiant    |
| Saturn               | 95.2  | 95           | gasGiant    |
| Uranus               | 14.5  | 146          | iceGiant    |
| Neptune              | 17.1  | 27           | iceGiant    |
| Kepler-22b          | 30    | 1            | iceGiant    |
| Proxima Centauri b   | 1.17  | 0            | terrestrial  |
| Kepler-452b         | 5     | 0            | terrestrial  |
| Gliese 581g         | 3.1   | 0            | terrestrial  |
| 55 Cancri e         | 8     | 0            | terrestrial  |
| WASP-12b             | 1.47  | 0            | terrestrial  |


### 36. Mostrar superficie de todos los asteroides

```sql
SELECT celestialBodies.name, asteroids.surface FROM asteroids JOIN celestialBodies ON asteroids.id = celestialBodies.id;

```
| Name           | Surface                                           |
|----------------|---------------------------------------------------|
| Ceres          | Rocky, with water ice and some hydrated minerals  |
| Vesta          | Rocky with basaltic areas and impact craters      |
| Pallas         | Heavily cratered and rocky                        |
| Hygiea         | Dark and possibly water-rich                       |
| Eros           | Rocky with large craters and ridges               |
| Itokawa        | Rubble pile, with boulders and loose regolith     |
| Bennu          | Loose, rocky, with boulders and gravel            |
| Gaspra         | Rocky with visible craters                         |
| Ida            | Rocky with many impact craters                     |
| Toutatis       | Irregular, boulders, ridges                       |
| Mathilde       | Dark and heavily cratered                          |
| Eugenia        | Dark with possible dust layers                     |
| Davida         | Dark with minor craters                           |
| Juno           | Rocky, with craters and high albedo               |
| Psyche         | Metallic with impact craters                       |
| 1994 PC1      | Rocky with craters                                 |
| Apophis        | Rocky with small craters                           |
| Orpheus        | Rocky and irregular                                |
| Florence       | Rocky with visible craters                         |
| 1998 KY26      | Dark and smooth                                   |

### 37. nombre 5 personas de las ultimas observaciones

```sql
select users.name ,observations.observationDate, celestialBodies.name, celestialBodies.bodyType from observations join celestialBodies on observations.idBody = celestialBodies.id  join users on observations.idUser = users.id order by observationDate limit 5;

```

| Observer Name    | Observation Date       | Name            | Body Type |
|-------------------|-----------------------|------------------|-----------|
| Alice Johnson      | 2024-01-15 20:30:00   | NGC 891          | galaxy    |
| Bob Smith          | 2024-01-16 21:00:00   | Betelgeuse       | star      |
| Charlie Brown      | 2024-01-17 22:15:00   | GX 339-4         | blackHole  |
| Diana Prince       | 2024-01-18 19:45:00   | IC 1101 galaxy   | galaxy    |
| Ethan Hunt         | 2024-01-19 20:00:00   | 3C 273           | blackHole  |

### 38. telescopios con resoluciones mayores al promedio

```sql
select * from telescopes where resolution >= (select avg(resolution) from telescopes);

```
| ID | Location                                       | Resolution |
|----|------------------------------------------------|------------|
| 2  | La Silla Observatory, Chile                    | 12000      |
| 3  | Palomar Observatory, California                 | 15000      |
| 4  | Hubble Space Telescope                          | 12000      |
| 5  | Keck Observatory, Hawaii                        | 16000      |
| 7  | Very Large Telescope, Chile                     | 14000      |
| 10 | Cerro Tololo Inter-American Observatory, Chile | 13000      |
| 14 | Gran Telescopio Canarias, Spain                | 16000      |
| 15 | Subaru Telescope, Hawaii                        | 14000      |
| 19 | James Webb Space Telescope                      | 14000      |

### 39. Mostrar cuerpos celestes que usen "lighyears" como medida 

```sql
select name, distance, distanceUnits, bodyType from celestialBodies where distanceUnits = "lightYears";

```
| Name                   | Distance      | Distance Units | Body Type   |
|------------------------|---------------|----------------|-------------|
| Milky Way              | 0             | lightYears      | galaxy      |
| Ton 618                | 10,000,000,000| lightYears      | blackHole   |
| Sagittarius A*        | 26,000        | lightYears      | blackHole   |
| M87*                   | 53,000,000    | lightYears      | blackHole   |
| Cygnus X-1            | 60,700        | lightYears      | blackHole   |
| V404 Cygni            | 78,000        | lightYears      | blackHole   |
| NGC 1277               | 220,000,000   | lightYears      | blackHole   |
| GRO J1655-40          | 11,200        | lightYears      | blackHole   |
| GX 339-4              | 13,500        | lightYears      | blackHole   |
| XTE J1118+480         | 62,000        | lightYears      | blackHole   |
| GRS 1915+105          | 36,000        | lightYears      | blackHole   |
| Ophiuchus             | 390,000,000   | lightYears      | blackHole   |
| NGC 1365              | 56,000,000    | lightYears      | blackHole   |
| NGC 4889              | 336,000,000   | lightYears      | blackHole   |
| IC 1101               | 1,045,000,000 | lightYears      | blackHole   |
| ESO 243-49 HLX-1      | 290,000,000   | lightYears      | blackHole   |
| 3C 273                | 2,400,000,000 | lightYears      | blackHole   |
| NGC 4151              | 62,000,000    | lightYears      | blackHole   |
| NGC 3115              | 32,000,000    | lightYears      | blackHole   |
| NGC 1600              | 200,000,000   | lightYears      | blackHole   |
| Mrk 501               | 456,000,000   | lightYears      | blackHole   |
| Sun                   | 0             | lightYears      | star        |
| Proxima Centauri      | 4.24          | lightYears      | star        |
| Alpha Centauri A      | 4.37          | lightYears      | star        |
| Alpha Centauri B      | 4.37          | lightYears      | star        |
| Betelgeuse            | 642.5         | lightYears      | star        |
| Sirius A              | 8.6           | lightYears      | star        |
| Sirius B              | 8.6           | lightYears      | star        |
| Vega                  | 25.04         | lightYears      | star        |
| Rigel                 | 860           | lightYears      | star        |
| Aldebaran             | 65.1          | lightYears      | star        |
| Arcturus              | 36.7          | lightYears      | star        |
| Antares               | 554           | lightYears      | star        |
| TRAPPIST-1           | 33.78         | lightYears      | star        |
| WASP-12               | 250           | lightYears      | star        |
| 55 Cancri             | 16.73         | lightYears      | star        |
| HD 209458             | 25.13         | lightYears      | star        |
| Gliese 581            | 2,600         | lightYears      | star        |
| Kepler-452            | 310           | lightYears      | star        |
| Capella               | 42.92         | lightYears      | star        |
| Kepler-22             | 6,000         | lightYears      | star        |
| Mercury               | 0             | lightYears      | planet      |
| Venus                 | 0             | lightYears      | planet      |
| Earth                 | 0             | lightYears      | planet      |
| Mars                  | 0             | lightYears      | planet      |
| Jupiter               | 0             | lightYears      | planet      |
| Saturn                | 0             | lightYears      | planet      |
| Uranus                | 0             | lightYears      | planet      |
| Neptune               | 0             | lightYears      | planet      |
| Pluto                 | 0             | lightYears      | planet      |
| Haumea                | 0             | lightYears      | planet      |
| Makemake              | 0             | lightYears      | planet      |
| Eris                  | 0             | lightYears      | planet      |
| Kepler-22b           | 600           | lightYears      | planet      |
| Proxima Centauri b    | 4.24          | lightYears      | planet      |
| Kepler-452b          | 1,400         | lightYears      | planet      |
| Gliese 581g          | 20.4          | lightYears      | planet      |
| HD 209458 b          | 153           | lightYears      | planet      |
| 55 Cancri e          | 41            | lightYears      | planet      |
| WASP-12b             | 1,410         | lightYears      | planet      |
| TRAPPIST-1d          | 39            | lightYears      | planet      |

### 40. Mostrar galaxia mas cercana, ( que no sea via lactea porque estamos en ella)

```sql
SELECT celestialBodies.name, celestialBodies.distance, celestialBodies.distanceUnits, galaxies.galaxyType FROM celestialBodies JOIN galaxies ON galaxies.id = celestialBodies.id  WHERE distance > (select MIN(distance) from celestialBodies) limit 1;

```
| Name       | Distance | Distance Units    | Galaxy Type |
|------------|----------|-------------------|-------------|
| Andromeda  | 2.537    | millionLightYears  | spiral      |
