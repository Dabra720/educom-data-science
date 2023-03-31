--4.1.5 Selecteer de naam, straat, huisnummer, postcode en geo-locatie van de 5 meest noordelijk gelegen leveranciers.
SELECT sup.name, straat, huisnr, postcode, pc.* FROM mhl_suppliers sup
LEFT JOIN pc_lat_long pc
ON pc.pc6=sup.postcode
ORDER BY pc.lat DESC
LIMIT 5;