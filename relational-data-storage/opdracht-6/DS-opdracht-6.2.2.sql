--6.2.2 Selecteer het ID, de joindate en het aantal dagen dat ze vandaag lid zijn, oplopend gesorteerd naar het aantal dagen lid.

SELECT ID, DATE_FORMAT(joindate, "%d.%m.%Y") joindate, DATEDIFF(CURRENT_DATE(), joindate) dagen_lid
FROM mhl_suppliers s
ORDER BY dagen_lid ASC