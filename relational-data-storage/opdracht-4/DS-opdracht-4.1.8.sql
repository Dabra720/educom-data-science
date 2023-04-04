--4.1.8 Selecteer de plaatsnamen en id's van steden met dezelfde naam met een geldige gemeentenaam 
--(toon ook de id en naam van de betreffende gemeenten), gesorteerd op plaatsnaam.
SELECT c.name AS stad, c.id AS cid, c2.id AS cid2, c.commune_ID AS gid, c2.commune_ID AS gid2,
com.name AS gemeente_1, com.name AS gemeente_2
FROM mhl_cities c
JOIN mhl_cities c2 
ON c2.name=c.name
JOIN mhl_communes com
ON c.commune_ID=com.id
JOIN mhl_communes com2 
ON c2.commune_ID=com2.id
WHERE c.id < C2.id
ORDER BY c.name;