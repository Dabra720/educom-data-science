--6.2.3 Selecteer de naam van de dag en het aantal leveranciers dat op die dag lid geworden is.
SELECT DAYNAME(joindate) 'Dag van de week', COUNT(*) 'Aantal aanmeldingen' 
FROM mhl_suppliers
GROUP BY DAYNAME(joindate) 
ORDER BY DAYOFWEEK(joindate) ASC