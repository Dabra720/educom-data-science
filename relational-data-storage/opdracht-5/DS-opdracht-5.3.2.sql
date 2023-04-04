--5.3.2 Maak een view 'VERZENDLIJST'
CREATE VIEW v_verzendlijst AS
SELECT s.id, 
IF(p_address="", concat(straat, " ", huisnr), p_address) adres,
IF(p_postcode="", postcode, p_postcode) postcode,
c.name stad
FROM mhl_suppliers s
LEFT JOIN mhl_cities c
ON IF(p_address="", city_ID, p_city_ID)=c.id