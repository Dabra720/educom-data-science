SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE name LIKE '%&%'

-- Volgens mij klopt deze nog niet