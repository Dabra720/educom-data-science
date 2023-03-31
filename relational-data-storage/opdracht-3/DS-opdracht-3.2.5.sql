--3.2.5 Selecteer naam, straat, huisnummer en postcode van alle leveranciers met een huisnummer tussen de 10 en 20.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE huisnr>=10 AND huisnr<=20

SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE huisnr BETWEEN 10 AND 20