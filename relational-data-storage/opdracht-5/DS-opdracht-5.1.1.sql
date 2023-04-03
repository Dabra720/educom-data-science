--5.1.1 Selecteer uit de hitcount-tabel het aantal records, de minimale, maximale, gemiddelde en totale hitcount.
SELECT COUNT(hitcount), AVG(hitcount), MIN(hitcount), MAX(hitcount), SUM(hitcount)
FROM mhl_hitcount