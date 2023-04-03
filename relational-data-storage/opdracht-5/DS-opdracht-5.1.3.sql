--5.1.3 Selecteer uit de hitcount-tabel per jaar, per maand het aantal records, de minimale, maximale, gemiddelde en totale hitcount.
SELECT COUNT(hitcount), AVG(hitcount), MIN(hitcount), MAX(hitcount), SUM(hitcount)
FROM mhl_hitcount
group by month, year
order by year, month