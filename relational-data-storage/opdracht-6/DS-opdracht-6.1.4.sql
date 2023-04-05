--6.1.4 Selecteer de totale hitcount per rubriek met 'Geen hits' als een rubriek geen hitcount kent.

-- We beginnen met de namen.
SELECT r1.id id1, r2.id id2, CONCAT_WS('-', r1.name, r2.name) name
FROM mhl_rubrieken r1
RIGHT JOIN mhl_rubrieken r2
ON r2.parent=r1.id
ORDER BY name

-- Vervolgens de hitcount per rubriek

-- Hitcount per rubriek
SELECT r.name name, SUM(hitcount) 
FROM mhl_suppliers_mhl_rubriek_view sr
LEFT JOIN mhl_hitcount hit
ON hit.supplier_ID=sr.mhl_suppliers_ID
RIGHT JOIN mhl_rubrieken r
ON r.id=sr.mhl_rubriek_view_ID
GROUP BY r.id

-- Samenvoegen:

SELECT CONCAT_WS('-', hoofd.name, sub.name) name,
HIT.hitcount
FROM mhl_rubrieken sub
LEFT JOIN mhl_rubrieken hoofd
ON hoofd.id=sub.parent
LEFT JOIN (
SELECT r.id, r.name name, IFNULL(SUM(hitcount), 'Geen hits') hitcount
FROM mhl_suppliers_mhl_rubriek_view sr
LEFT JOIN mhl_hitcount hit
ON hit.supplier_ID=sr.mhl_suppliers_ID
RIGHT JOIN mhl_rubrieken r
ON r.id=sr.mhl_rubriek_view_ID
GROUP BY r.id
) HIT
ON HIT.id=sub.id
ORDER BY name

