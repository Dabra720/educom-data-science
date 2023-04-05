--6.3.1 Selecteer alle plaatsnamen met uppercase van de eerste letter.
SELECT name, 
CONCAT(UCASE(LEFT(name, 1)), SUBSTRING(name, 2)) nice_name
FROM mhl_cities
ORDER BY name