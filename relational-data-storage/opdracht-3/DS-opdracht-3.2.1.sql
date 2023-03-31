--3.2.1 Selecteer naam, straat, huisnummer en postcode van alle leveranciers uit 'Amsterdam'.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
WHERE cit.name='Amsterdam'