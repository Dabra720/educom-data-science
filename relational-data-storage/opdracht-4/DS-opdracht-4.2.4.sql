--4.2.4 Selecteer alle mogelijke Y/N-properties van leveranciers uit Amsterdam, met indien aanwezig de waarde van de property voor deze leverancier en anders 'NOT SET'.
SELECT c.name Stad, COUNT(IF(m.name='Gold', 1, NULL)) Gold, COUNT(IF(m.name='Silver', 1, NULL)) Silver, 
COUNT(IF(m.name='Bronze', 1, NULL)) Bronze, COUNT(IF(m.id>3, 1, NULL)) Other
FROM mhl_suppliers s
LEFT JOIN mhl_membertypes m
ON m.id=s.membertype
LEFT JOIN mhl_cities c
ON c.id=s.city_ID
GROUP BY c.name
ORDER BY Gold DESC, Silver DESC, Bronze DESC, Other DESC