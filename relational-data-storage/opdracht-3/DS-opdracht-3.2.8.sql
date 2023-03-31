--3.2.8 Selecteer naam, straat, huisnummer en postcode van alle leveranciers wiens naam eindigt op handel.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE name LIKE '%handel'