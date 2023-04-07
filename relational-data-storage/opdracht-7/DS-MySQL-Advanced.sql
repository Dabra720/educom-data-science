--The following SELECT statement returns all rows in the table customers from the sample database:
SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
FROM
    customers
ORDER BY customerName;

--The following CREATE PROCEDURE statement creates a new stored procedure that wraps the query above:
DELIMITER $$

CREATE PROCEDURE p_get_customers()
BEGIN
    SELECT 
        customerName, 
        city, 
        state, 
        postalCode, 
        country
    FROM
        customers
    ORDER BY customerName;    
END$$

DELIMITER ;

--Once you save the stored procedure, you can invoke it by using the CALL statement:
call p_get_customers();

--Listing stored procedures
SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition]

--Or with a query:
SELECT  routine_name
FROM information_schema.routines
WHERE routine_type = 'PROCEDURE'
  AND routine_schema = '<database_name>';



--The stored procedure language is mostly constructed as any other procedural language. Analyze this stored procedure:
DELIMITER $$

CREATE PROCEDURE p_get_total_order()
BEGIN
    DECLARE totalOrder INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO totalOrder
    FROM orders;
    
    SELECT totalOrder;
END$$

DELIMITER ;

