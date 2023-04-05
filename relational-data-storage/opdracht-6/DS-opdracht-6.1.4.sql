--6.1.4 Selecteer de totale hitcount per rubriek met 'Geen hits' als een rubriek geen hitcount kent.

-- We beginnen met de namen.
SELECT r1.id id1, r2.id id2, CONCAT_WS('-', r1.name, r2.name) name
FROM mhl_rubrieken r1
RIGHT JOIN mhl_rubrieken r2
ON r2.parent=r1.id
ORDER BY name

