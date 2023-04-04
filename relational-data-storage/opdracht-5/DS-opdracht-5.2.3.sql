--5.2.3 Selecteer een overzicht van de totale hitcount per jaar.
SELECT year Jaar, SUM(IF(month<4, hitcount, 0)) 'Eerste kwartaal', 
SUM(IF(month BETWEEN 4 AND 6, hitcount, 0)) 'Tweede kwartaal', 
SUM(IF(month BETWEEN 7 AND 9, hitcount, 0)) 'Derde kwartaal', 
SUM(IF(month>9, hitcount, 0)) 'Vierde kwartaal', SUM(hitcount) Totaal 
FROM mhl_hitcount
GROUP BY Jaar