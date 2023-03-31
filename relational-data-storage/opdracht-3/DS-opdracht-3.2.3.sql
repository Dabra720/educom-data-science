--3.2.3 Selecteer naam, straat, huisnummer en postcode van alle leveranciers uit 'Amsterdam' met een postbus in een andere stad.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
LEFT JOIN mhl_cities c2
ON c2.id=sup.p_city_ID
WHERE cit.name='Amsterdam' AND NOT c2.name='Amsterdam'