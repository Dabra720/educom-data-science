--3.2.9 Selecteer naam, straat, huisnummer en postcode van alle leveranciers met groothandel in hun naam.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE name LIKE '%groothandel%'