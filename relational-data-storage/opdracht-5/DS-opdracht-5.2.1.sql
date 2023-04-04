--5.2.1 Maak een verzendlijst voor alle directieleden van alle leveranciers, 
--gesorteerd per provincie, plaatsnaam en naam: 
--wanneer een postbusadres ingevuld dan dit gebruiken, anders vestigingsadres, 
--wanneer contactpersoon aanwezig dan die naam in aanhef, anders 't.a.v. de directie'.
SELECT sup.name leverancier, IFNULL(con.name, "t.a.v. de directie") aanhef, IF(sup.p_address<>"", sup.P_address, CONCAT(straat, " ", huisnr)) 
adres, IF(sup.p_address<>"", sup.P_postcode, sup.postcode) postcode, IF(sup.p_address<>"", cit2.name, cit.name) stad,
IF(sup.p_address<>"", dis2.name, dis.name) provincie
FROM  mhl_suppliers sup
LEFT JOIN mhl_contacts con ON sup.id=con.supplier_ID AND con.department=3
LEFT JOIN mhl_cities cit ON sup.city_ID=cit.id
LEFT JOIN mhl_communes com ON cit.commune_ID=com.id
LEFT JOIN mhl_districts dis ON com.district_ID=dis.id
LEFT JOIN mhl_cities cit2 ON sup.p_city_ID=cit2.id
LEFT JOIN mhl_communes com2 ON cit2.commune_ID=com2.id
LEFT JOIN mhl_districts dis2 ON com2.district_ID=dis2.id
WHERE postcode <> ""
ORDER BY provincie, stad, leverancier