--4.1.3 Selecteer de naam, straat, huisnummer en postcode van alle leveranciers uit de stad Amsterdam, 
--die actief zijn in de (sub)rubriek 'drank' (of een subrubriek daarvan) gesorteerd op rubrieknaam, leveranciersnaam.
SELECT rub.name, sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
LEFT JOIN mhl_cities cit
ON cit.id=sup.city_ID
LEFT JOIN mhl_suppliers_mhl_rubriek_view srv
ON srv.mhl_suppliers_ID=sup.id
LEFT JOIN mhl_rubrieken rub
ON rub.id=srv.mhl_rubriek_view_ID
LEFT JOIN mhl_rubrieken rub2
ON rub2.id=rub.parent
WHERE cit.name='Amsterdam' AND
(rub2.name='drank' OR rub.name='drank')
ORDER BY rub.name, sup.name