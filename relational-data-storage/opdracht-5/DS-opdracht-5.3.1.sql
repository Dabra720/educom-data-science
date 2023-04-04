--5.3.1 Maak een view 'DIRECTIE'
CREATE VIEW v_directie AS
SELECT supplier_ID ID, c.name contact, c.contacttype functie, d.name department
FROM mhl_contacts c
LEFT JOIN mhl_departments d
ON d.id=c.department
WHERE department='Directie' OR 
c.contacttype LIKE '%directeur%'