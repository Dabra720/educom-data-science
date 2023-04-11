-- Create a stored procedure which fetches the customer name and 
-- the total order amount for that customer. The result is written to the new `customer_reporting' table.
DROP PROCEDURE IF EXISTS `p_get_total_order_by_customer_name`;

DELIMITER $$
CREATE PROCEDURE `p_get_total_order_by_customer_name`(IN custName varchar(50))
BEGIN
    
  CREATE TABLE TemporaryTable (naam VARCHAR(255), totaal INT); 
  INSERT INTO TemporaryTable    
  SELECT c.customerName, COUNT(o.customerNumber) total     
  FROM orders o   
	JOIN customers c
	ON o.customerNumber = c.customerNumber
  WHERE customerName = custName;
    
  SELECT * from TemporaryTable;
    
    
END$$
DELIMITER ;


-- V2
DROP PROCEDURE IF EXISTS `p_get_total_order_by_customer_name`;

DELIMITER $$
CREATE PROCEDURE `p_get_total_order_by_customer_name`()
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE naam VARCHAR(50);
  DECLARE totaal INT;
    
  DECLARE cur_customer 
    CURSOR FOR
      SELECT c.customerName, COUNT(o.customerNumber) total     
      FROM orders o
      JOIN customers c
      ON c.customerNumber = o.customerNumber
      GROUP BY c.customerName;
    
	DECLARE CONTINUE HANDLER 
    FOR NOT FOUND SET finished = 1;
        
  OPEN cur_customer;
    
  getNameAndTotal: LOOP
    FETCH cur_customer INTO naam, totaal;
    INSERT INTO customer_reporting(`naam`, `totaal`) VALUES (naam, totaal);
    IF finished = 1 THEN 
      LEAVE getNameAndTotal;
    END IF;       
  END LOOP getNameAndTotal;
  
  CLOSE cur_customer;
    
END$$
DELIMITER ;

-- Tabel structuur 'customer_reporting'
CREATE TABLE `customer_reporting` (
    `naam` VARCHAR(50) NOT NULL,
    `totaal` INT(11) NOT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

  -- Call 
CALL p_get_total_order_by_customer_name