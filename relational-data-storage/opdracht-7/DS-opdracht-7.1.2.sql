-- ASSIGNMENT #2
-- Alter the code from the procedure p_get_total_order() so it only summarizes the order per given customer.
DELIMITER $$

CREATE PROCEDURE p_get_total_order_by_customer(IN custNum int)
BEGIN
    
    DECLARE totalOrder INT DEFAULT 0;
    
    SELECT COUNT(*)
    INTO totalOrder
    FROM orders
    WHERE customerNumber = custNum;
    
    SELECT totalOrder;
END$$

DELIMITER ;

