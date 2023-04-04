--5.3.3 Maak nu met behulp van deze views een query voor een verzendlijst
--mhl_suppliers.name
--contact of t.a.v. directie
--adres
--postcode
--stad
SELECT s.name, IF(ISNULL(contact), 'tav de directie', contact) contact, adres, v.postcode, v.stad 
FROM mhl_suppliers s
LEFT JOIN v_directie d
ON d.ID=s.id
LEFT JOIN v_verzendlijst v
ON v.id=s.id