--3.2.10 Selecteer naam, straat, huisnummer en postcode van alle leveranciers wiens naam HTML-entities bevat (&xxxx;).
SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE name LIKE '%&____;%'