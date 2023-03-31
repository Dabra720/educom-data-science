--4.1.2 Selecteer de naam, straat, huisnummer, postcode en plaatsnaam van alle leveranciers uit de gemeente Steenwijkerland.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
LEFT JOIN mhl_communes com
ON com.id=cit.commune_ID
WHERE com.name = 'Steenwijkerland'