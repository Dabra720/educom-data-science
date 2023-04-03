--5.1.4 Selecteer uit de hitcount-tabel de leveranciersnaam, het totaal aantal hits, het aantal maanden en de gemiddelde hitcount.
SELECT s.name name, SUM(h.hitcount) numhits, COUNT(h.month) nummonths, ROUND(AVG(h.hitcount), 0) avgpermonth
FROM mhl_hitcount h
INNER JOIN mhl_suppliers s 
ON h.supplier_ID=s.id
GROUP BY name
ORDER BY avgpermonth DESC