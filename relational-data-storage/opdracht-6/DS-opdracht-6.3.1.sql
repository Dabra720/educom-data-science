--6.3.1 Selecteer alle plaatsnamen met uppercase van de eerste letter.
SELECT name, 
CASE
WHEN name LIKE "'%" THEN CONCAT(LCASE(SUBSTRING(name, 1, 2)), UCASE(SUBSTRING(name, 3, 2)), SUBSTRING(name,5))
ELSE CONCAT(UCASE(LEFT(name, 1)), SUBSTRING(name, 2)) 
END nice_name
FROM mhl_cities
ORDER BY name