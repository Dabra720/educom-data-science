-- Add 'joindate' kolom
ALTER TABLE mhl_suppliers 
  ADD joindate DATE NULL DEFAULT NULL 
  AFTER p_city_ID;

-- Set 'joindate' kolom voor alle leveranciers
UPDATE mhl_suppliers 
   SET joindate=CAST(CONCAT(2000+membertype,'-',(id%12)+1, '-',(id%28)+1) AS DATE)

-- Controleer of het gelukt is:
SELECT MIN(joindate), MAX(joindate) FROM mhl_suppliers
--De MIN(joindate) moet dan als uitkomst 2000-01-25 hebben en de MAX(joindate) als uitkomst 2010-11-11.

--6.1.1 Selecteer uit de hitcount-tabel het aantal records, de minimale, maximale, gemiddelde en totale hitcount.
-- VIEW voor maandnamen:
CREATE VIEW v_monthsofyear (id, month) AS
    SELECT 1, 'Januari'
    UNION 
    SELECT 2, 'Februari' 
    UNION 
    SELECT 3, 'Maart'
    UNION 
    SELECT 4, 'April'
    UNION 
    SELECT 5, 'Mei'
    UNION 
    SELECT 6, 'Juni'
    UNION 
    SELECT 7, 'Juli'
    UNION 
    SELECT 8, 'Augustus'
    UNION 
    SELECT 9, 'September' 
    UNION 
    SELECT 10, 'Oktober'
    UNION 
    SELECT 11, 'November'
    UNION 
    SELECT 12, 'December'

-- SELECT voor de gevraagde tabel:
SELECT year jaar, m.month maand, COUNT(supplier_ID) 'aantal leveranciers', SUM(hitcount) 'totaal aantal hits'
FROM mhl_hitcount h
LEFT JOIN v_monthsofyear m
ON m.id=h.month
GROUP BY jaar, maand
ORDER BY jaar DESC