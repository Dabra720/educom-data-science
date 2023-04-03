--5.2.1 Maak een verzendlijst voor alle directieleden van alle leveranciers, 
--gesorteerd per provincie, plaatsnaam en naam: 
--wanneer een postbusadres ingevuld dan dit gebruiken, anders vestigingsadres, 
--wanneer contactpersoon aanwezig dan die naam in aanhef, anders 't.a.v. de directie'.
SELECT S.name leverancier, IFNULL(CON.name, "t.a.v. de directie") aanhef, IF(S.p_address<>"", S.P_address, CONCAT(straat, " ", huisnr)) adres,
IF(S.p_address<>"", S.P_postcode, S.postcode) postcode, IF(S.p_address<>"", CITP.name, CIT.name) stad,
IF(S.p_address<>"", DISP.name, DIS.name) provincie
FROM  mhl_suppliers S
LEFT JOIN mhl_contacts CON ON S.id=CON.supplier_ID AND CON.department=3
LEFT JOIN mhl_cities CIT ON S.city_ID=CIT.id
LEFT JOIN mhl_communes COM ON CIT.commune_ID=COM.id
LEFT JOIN mhl_districts DIS ON COM.district_ID=DIS.id
LEFT JOIN mhl_cities CITP ON S.p_city_ID=CITP.id
LEFT JOIN mhl_communes COMP ON CITP.commune_ID=COMP.id
LEFT JOIN mhl_districts DISP ON COMP.district_ID=DISP.id
WHERE postcode<>""
ORDER BY provincie, stad, leverancier
;