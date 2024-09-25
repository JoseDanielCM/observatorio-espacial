-- SQLBook: Code
INSERT INTO celestialBodies (
    name,distance,distanceUnits,diameter,diameterUnits,bodyType
) VALUES 
("Ton 618",1 * POWER(10, 10),"lightYears",5 * POWER(10, 9),"kilometers","blackHole"),
("Sun",0,"lightYears",1390000,"kilometers","star"),
("Proxima Centauri",4.24,"lightYears",200000,"kilometers","star"),
("Sagittarius A",26000,"lightYears",44000000,"kilometers","blackHole"),
("Alpha Centauri A",4.37,"lightYears",1220000,"kilometers","star"),

INSERT INTO blackHole (
    id,mass,spin,charge,galaxy
) VALUES (1, 1.32 * POWER(10, 40))

INSERT INTO stars (
    id,mass,planets,starType
) VALUES 
(2,1,8,"g-type"),
(3,0.12,2,"m-type"),
(5,1.1,1,"g-type")
