SELECT sup.name, straat, huisnr, postcode, mem.name as membertype FROM mhl_suppliers sup
LEFT JOIN mhl_membertypes mem
ON mem.id=sup.membertype
WHERE mem.name='Gold' OR mem.name='Silver' OR mem.name='Bronze' OR mem.name='GEEN INTRESSE'