--5.2.2 Selecteer het aantal Gold, Silver, Bronze en Overige Suppliers per stad, aflopend gesorteerd op Gold, Silver, Bronze, Other.
SELECT c.name Stad, COUNT(IF(m.name='Gold', 1, NULL)) Gold, COUNT(IF(m.name='Silver', 1, NULL)) Silver, COUNT(IF(m.name='Bronze', 1, NULL)) Bronze, COUNT(IF(m.id>3, 1, NULL)) Other
FROM mhl_suppliers s
LEFT JOIN mhl_membertypes m
ON m.id=s.membertype
LEFT JOIN mhl_cities c
ON c.id=s.city_ID
GROUP BY c.name
ORDER BY Gold DESC, Silver DESC, Bronze DESC, Other DESC