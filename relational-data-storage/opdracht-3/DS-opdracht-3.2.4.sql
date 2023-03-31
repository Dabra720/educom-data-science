--3.2.4 Selecteer naam, straat, huisnummer en postcode van alle leveranciers uit 'Amsterdam' of met een postbus in 'Den Haag'.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
LEFT JOIN mhl_cities c2
ON c2.id=sup.p_city_ID
WHERE cit.name='Amsterdam' OR c2.name='Den Haag'