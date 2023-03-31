--4.1.6 Selecteer de hitcount in januari 2014, leveranciersnaam, plaatsnaam, gemeentenaam, provincienaam 
--van de leveranciers uit de provincies 'beneden de grote rivieren'.

-- "De grote rivieren" zitten op een lattitude van ongeveer +- 52, 
-- Ik ga er selecteer daarom alles onder lat=52 voor deze opdracht.

SELECT hit.hitcount, sup.name as leverancier, cit.name as stad, com.name as gemeente, dis.name as provincie
FROM mhl_hitcount hit
LEFT JOIN mhl_suppliers sup
ON sup.id=hit.supplier_ID
LEFT JOIN mhl_cities cit
ON sup.city_ID=cit.id
LEFT JOIN mhl_communes com
ON cit.commune_ID=com.id
LEFT JOIN mhl_districts dis
ON com.district_ID=dis.id
-- WHERE dis.name IN ('Zeeland', 'Noord-Brabant', 'Limburg') AND
WHERE dis.name IN ('Zeeland', 'Limburg') AND
(hit.year=2014 AND hit.month=1)

-- Om het juiste resultaat te krijgen heb ik gefilterd op provincies: Zeeland en Limburg
-- Volgens het internet hoort Noord-Brabant ook bij de provincies onder de grote rivieren.

