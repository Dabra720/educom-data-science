--6.1.3 Selecteer alle rubrieknamen en het aantal leveranciers in die rubriek.

-- Beide select statements geven hetzelfde resultaat:

-- SELECT CONCAT_WS(" - ", r1.name, r2.name) name, N.numsup numsup
SELECT IF(ISNULL(r1.name), r2.name, CONCAT_WS(" - ", r1.name, r2.name)) name, N.numsup
FROM mhl_rubrieken r1
RIGHT JOIN mhl_rubrieken r2
ON r2.parent=r1.id
RIGHT JOIN (
SELECT r.id, IFNULL(COUNT(s.id), 0) numsup
FROM mhl_rubrieken r
JOIN mhl_suppliers_mhl_rubriek_view sr
ON sr.mhl_rubriek_view_ID=r.id
JOIN mhl_suppliers s
ON s.id=sr.mhl_suppliers_ID
GROUP BY r.id
) N
ON N.id=r2.id
ORDER BY name

-- numsup aantallen wijken iets af, ik weet niet of dit aan mijn query ligt of aan de database.