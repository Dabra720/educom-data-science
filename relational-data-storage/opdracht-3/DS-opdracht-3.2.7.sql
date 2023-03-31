--3.2.7 Selecteer naam, straat, huisnummer en postcode van alle leveranciers wiens naam begint met 't
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE name LIKE '\'t%'