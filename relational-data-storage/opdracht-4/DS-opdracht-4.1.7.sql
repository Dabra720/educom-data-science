--4.1.7 Selecteer de plaatsnamen en id en gemeente id's van steden met dezelfde naam, gesorteerd op plaatsnaam.
SELECT c1.name, c2.name, c1.id, c2.id, c1.commune_ID, c2.commune_ID 
FROM mhl_cities c1, mhl_cities c2
WHERE c1.id <> c2.id AND
c1.name=c2.name
ORDER BY c1.name;

-- V2.0
SELECT c1.name, c2.name, c1.id, c2.id, c1.commune_ID, c2.commune_ID 
FROM mhl_cities c1, mhl_cities c2
WHERE c1.id <> c2.id AND
c1.name=c2.name AND
c1.name IN
(SELECT name FROM mhl_cities
GROUP BY name
HAVING COUNT(*)>1)
ORDER BY c1.name;

-- V3.0
SELECT c1.name, c2.name, c1.id, c2.id, c1.commune_ID, c2.commune_ID
FROM mhl_cities c1 
INNER JOIN mhl_cities c2
ON c2.name = c1.name AND c2.id<>c1.id
ORDER BY c1.name

