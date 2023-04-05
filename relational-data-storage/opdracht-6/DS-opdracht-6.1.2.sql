--6.1.2 Selecteer alle Nederlandse gemeentes, de leveranciersnaam, 
--de totale hitcount en de gemiddelde hitcount van de betreffende gemeente, 
--van die leveranciers die een hogere hitcount hebben dan dat gemiddelde, 
--gesorteerd op het verschil (totaal ten opzichte van gemiddelde) in aflopende volgorde.

-- SELECT com.name gemeente, s.name leverancier, SUM(hitcount) total_hitcount, AVG(hitcount) average_hitcount
-- FROM mhl_suppliers s
-- LEFT JOIN mhl_cities cit 
-- ON cit.id=s.city_ID
-- LEFT JOIN mhl_communes com
-- ON com.id=cit.commune_ID
-- LEFT JOIN mhl_hitcount h
-- ON h.supplier_ID=s.id
-- GROUP BY gemeente, leverancier
-- ORDER BY gemeente
SELECT com.name gemeente, SUM(hitcount) total, AVG(hitcount) average
FROM mhl_suppliers s
LEFT JOIN mhl_hitcount h
ON h.supplier_ID=s.id
LEFT JOIN mhl_cities cit 
ON cit.id=s.city_ID
LEFT JOIN mhl_communes com
ON com.id=cit.commune_ID
GROUP BY gemeente
ORDER BY gemeente

-- DEZE IS IN PROGRESS..

-- FINISHED PRODUCT:

SELECT com.name gemeente, s.name leverancier, SUM(hitcount) total_hitcount, G.average average_hitcount
FROM mhl_suppliers s
LEFT JOIN mhl_cities cit 
ON cit.id=s.city_ID
LEFT JOIN mhl_communes com
ON com.id=cit.commune_ID
LEFT JOIN mhl_hitcount h
ON h.supplier_ID=s.id
INNER JOIN (
SELECT com.id id, com.name gemeente, SUM(hitcount) total, AVG(hitcount) average
FROM mhl_suppliers s
LEFT JOIN mhl_hitcount h
ON h.supplier_ID=s.id
LEFT JOIN mhl_cities cit 
ON cit.id=s.city_ID
LEFT JOIN mhl_communes com
ON com.id=cit.commune_ID
GROUP BY gemeente
) G
ON G.id=com.id
GROUP BY gemeente, leverancier
ORDER BY gemeente, (SUM(hitcount)-average_hitcount) DESC