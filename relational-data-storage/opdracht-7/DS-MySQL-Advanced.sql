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

-- We’ll use the customers table from the sample database for the demonstration:
DELIMITER $$

CREATE PROCEDURE p_get_customer_level(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END$$

DELIMITER ;

-- First off, let's find a customer to meet the criteria:
SELECT  customerNumber, creditLimit
  FROM customers
 WHERE creditLimit > 50000
ORDER BY creditLimit DESC;

--Customer with ID 141, is a good candidate:
CALL p_get_customer_level(141, @level);
SELECT @level;

--Adding an ELSE:
# First we drop so we can recreate!
DROP PROCEDURE p_get_customer_level;

DELIMITER $$

CREATE PROCEDURE p_get_customer_level(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$

DELIMITER ;

-- And call the procedure again:
CALL p_get_customer_level(447, @level);
SELECT @level;

-- ELSEIF
# First we drop so we can recreate!
DROP PROCEDURE p_get_customer_level;

DELIMITER $$

CREATE PROCEDURE p_get_customer_level(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END $$

DELIMITER ;

-- And call again:
CALL p_get_customer_level(447, @level);
SELECT @level;


-- Switch Case

DELIMITER $$

CREATE PROCEDURE p_get_customer_shipping(
    IN pCustomerNUmber INT
)

BEGIN
    
    DECLARE customerCountry VARCHAR(100);
    DECLARE pShipping VARCHAR(50);

    SELECT  country
      INTO customerCountry 
      FROM customers
     WHERE customerNumber = pCustomerNUmber;

    CASE customerCountry
        WHEN 'USA' THEN SET pShipping = '2-day Shipping';
        WHEN 'Canada' THEN SET pShipping = '3-day Shipping';
        ELSE SET pShipping = '5-day Shipping';
    END CASE;
    
    SELECT pShipping;
    
END$$

DELIMITER ;

-- And call the routine:
CALL p_get_customer_shipping(112);


-- LOOPS:
-- Syntax:
[begin_label:] LOOP
    statement_list
END LOOP [end_label]

-- Procedure:
DROP PROCEDURE IF EXISTS p_loop_demo;

DELIMITER $$
CREATE PROCEDURE p_loop_demo()
BEGIN
    DECLARE x  INT;
    DECLARE str  VARCHAR(255);
        
    SET x = 1;
    SET str =  '';
        
    loop_label:  LOOP
        IF  x > 10 THEN 
            LEAVE  loop_label;
        END  IF;
            
        SET  x = x + 1;
        IF  (x mod 2) THEN
            ITERATE  loop_label;
        ELSE
            SET  str = CONCAT(str,x,',');
        END  IF;
    END LOOP;
    SELECT str;
END$$

DELIMITER ;

-- Syntax:
[begin_label:] WHILE condition DO
    statement_list
END WHILE [end_label]

-- Procedure:
DROP PROCEDURE IF EXISTS p_while_demo;

DELIMITER $$
CREATE PROCEDURE p_while_demo()
BEGIN
    DECLARE x  INT;
    DECLARE str  VARCHAR(255);
        
    SET x = 1;
    SET str =  '';
        
    loop_label:  WHILE X <= 10 DO             
        IF NOT (x mod 2) THEN
            SET  str = CONCAT(str,x,',');
        END  IF;
        SET  x = x + 1;
    END WHILE;
    SELECT str;
END$$

DELIMITER ;

-- Syntax:
[begin_label:] REPEAT
    statement_list
UNTIL search_condition
END REPEAT [end_label]

-- Procedure:
DROP PROCEDURE IF EXISTS p_repeat_demo;

DELIMITER $$
CREATE PROCEDURE p_repeat_demo()
BEGIN
    DECLARE x  INT;
    DECLARE str  VARCHAR(255);
        
    SET x = 1;
    SET str =  '';
        
    loop_label:  REPEAT             
        IF NOT (x mod 2) THEN
            SET  str = CONCAT(str,x,',');
        END  IF;
        SET  x = x + 1;
    UNTIL x > 10
    END REPEAT;
    
    SELECT str;
END$$

DELIMITER ;

-- CURSORS:

# Declare the cursor: 
DECLARE cursor_name CURSOR FOR sql_statement;

# "Open" the cursor for processing
OPEN cursor_name;

# Fetching data: 
FETCH cursor_name INTO var [, var, var, etc];

# Closing the cursor is a good practice as it releases the memory it used.
CLOSE cursor_name;

-- To declare a NOT FOUND handler, you use the following syntax:
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;


-- This example creates a maillist (just a big string) for all records in the employee table:
DROP PROCEDURE IF EXISTS p_create_emaillist;

DELIMITER $$
CREATE PROCEDURE p_create_emaillist (
    INOUT emailList varchar(4000)
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE emailAddress varchar(100) DEFAULT "";

    -- declare cursor for employee email
    DEClARE curEmail 
        CURSOR FOR 
            SELECT email FROM employees;

    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    OPEN curEmail;

    getEmail: LOOP
        FETCH curEmail INTO emailAddress;
        IF finished = 1 THEN 
            LEAVE getEmail;
        END IF;
        -- build email list
        SET emailList = CONCAT(emailAddress,";",emailList);
    END LOOP getEmail;
    CLOSE curEmail;

END$$
DELIMITER ;

-- Now call the procedure:
SET @emailList = ""; 
CALL p_create_emaillist(@emailList); 
SELECT @emailList;


-- New OUT in customer_shipping
DROP PROCEDURE IF EXISTS p_get_customer_shipping;

DELIMITER $$

CREATE PROCEDURE p_get_customer_shipping(
    IN pCustomerNUmber INT,
    OUT pShipping VARCHAR(50)
)

BEGIN
    
    DECLARE customerCountry VARCHAR(100);

    SELECT country
      INTO customerCountry 
      FROM customers
     WHERE customerNumber = pCustomerNUmber;

    CASE customerCountry
        WHEN 'USA' THEN SET pShipping = '2-day Shipping';
        WHEN 'Canada' THEN SET pShipping = '3-day Shipping';
        ELSE SET pShipping = '5-day Shipping';
    END CASE;
    
END$$

DELIMITER ;


-- FUNCTIONS:

DROP FUNCTION IF EXISTS f_customer_level;

DELIMITER $$

CREATE FUNCTION f_customer_level(
    credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
        SET customerLevel = 'PLATINUM';
    ELSEIF (credit <= 50000 AND 
            credit >= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
    -- return the customer level
    RETURN (customerLevel);
END$$

DELIMITER ;

--We now can use this function in a SQL statement:
SELECT customerName, f_customer_level(creditLimit) status
FROM customers
ORDER BY customerName

