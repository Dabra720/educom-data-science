--3.2.6 Selecteer naam, straat, huisnummer en postcode van alle leveranciers met een huisnummer tussen de 10 en 20 of groter dan 100.
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE (huisnr>=10 AND huisnr<=20)OR huisnr>=100

SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE (huisnr BETWEEN 10 AND 20)OR huisnr>=100

