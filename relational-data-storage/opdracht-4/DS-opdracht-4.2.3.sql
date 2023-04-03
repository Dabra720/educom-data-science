--4.2.3 Selecteer alle hoofdrubrieken met hun subrubrieken, alfabetisch gesorteerd op hoofdrubriek en daarbinnen op subrubriek.
SELECT r1.id, r1.name, r2.name
FROM mhl_rubrieken r1
INNER JOIN mhl_rubrieken r2
ON r2.parent = r1.id
ORDER BY r1.name

--V2.0
SELECT r1.id, r1.name as hoofdrubriek, r2.name as subrubriek
FROM mhl_rubrieken r1, mhl_rubrieken r2
WHERE r2.parent=r1.id
ORDER BY r1.name

-- V3.0 
SELECT r1.id, r1.name as hoofdrubriek, r2.name as subrubriek
FROM mhl_rubrieken r1
LEFT JOIN mhl_rubrieken r2 
ON r1.parent=r2.id
ORDER BY r1.name

-- Krijg het nog niet voor elkaar