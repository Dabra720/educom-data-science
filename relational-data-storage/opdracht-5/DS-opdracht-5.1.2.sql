--5.1.2 Selecteer uit de hitcount-tabel per jaar het aantal records, de minimale, maximale, gemiddelde en totale hitcount.
SELECT COUNT(hitcount), AVG(hitcount), MIN(hitcount), MAX(hitcount), SUM(hitcount)
FROM mhl_hitcount
group by year