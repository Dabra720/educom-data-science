-- ASSIGNMENT #1
-- Complete this fragment of code, so it shows the offices in the specified country.
DELIMITER $$
CREATE PROCEDURE p_get_office_by_country(IN countryName 
VARCHAR(255))

BEGIN
    SELECT *
    FROM offices
    WHERE country = countryName;
END$$

DELIMITER ;
-- Call to function
call p_get_office_by_country('USA');