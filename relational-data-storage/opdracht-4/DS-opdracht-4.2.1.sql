--4.2.1 Selecteer naam en gemeente id van plaatsen zonder geldige gemeente.
SELECT c1.name, commune_ID
FROM mhl_cities c1
LEFT JOIN mhl_communes c2
ON c2.id=c1.commune_ID
WHERE c2.id IS NULL