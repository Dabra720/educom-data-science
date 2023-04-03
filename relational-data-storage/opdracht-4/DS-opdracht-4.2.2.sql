--4.2.2 Selecteer naam van de plaats en naam van de gemeente, wanneer gemeentenaam niet geldig dan 'INVALID' als waarde.
SELECT c1.name, IFNULL(c2.name, 'INVALID')
FROM mhl_cities c1
LEFT JOIN mhl_communes c2
ON c2.id=c1.commune_ID