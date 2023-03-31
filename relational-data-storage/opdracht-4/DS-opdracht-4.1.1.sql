--4.1.1 Selecteer de naam, straat, huisnummer en postcode van alle leveranciers uit de stad Amsterdam.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
WHERE cit.name='Amsterdam'

-- Herhaling van 3.2.1