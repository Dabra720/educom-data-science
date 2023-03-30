SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE (huisnr>=10 AND huisnr<=20)OR huisnr>=100

SELECT sup.name, straat, huisnr, postcode FROM mhl_suppliers sup
WHERE (huisnr BETWEEN 10 AND 20)OR huisnr>=100

