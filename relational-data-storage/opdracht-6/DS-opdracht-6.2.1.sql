--6.2.1 Selecteer het ID en de joindate (in 'EUR' datumformaat) van de leveranciers die in de laatste 7 dagen van de maand lid zijn geworden.

SELECT DATE_FORMAT(joindate, "%d.%m.%Y") joindate, id
FROM mhl_suppliers s
WHERE MONTH(ADDDATE(s.joindate, INTERVAL 7 DAY))<>MONTH(s.joindate)

-- ADDDATE moest op 8 staan voor het juiste resultaat

SELECT DATE_FORMAT(joindate, "%d.%m.%Y") joindate, id
FROM mhl_suppliers s
WHERE MONTH(ADDDATE(s.joindate, INTERVAL 8 DAY))<>MONTH(s.joindate)