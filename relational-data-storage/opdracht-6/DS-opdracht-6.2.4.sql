--6.2.4 Selecteer het aantal leveranciers dat lid is geworden per jaar en per maandnaam.
SELECT YEAR(joindate) jaar, MONTHNAME(joindate) maand, COUNT(s.id) aantal
FROM mhl_suppliers s
GROUP BY jaar, maand
ORDER BY jaar ASC, MONTH(joindate) ASC