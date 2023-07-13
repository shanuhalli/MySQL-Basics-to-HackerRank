use training;
SELECT * FROM employee_tbl;

SHOW INDEXES FROM employee_tbl;

CREATE INDEX emp_idx ON employee_tbl(emp_id);
SHOW INDEXES FROM employee_tbl;
SELECT * FROM employee_tbl WHERE emp_id=6;
CREATE INDEX emp_nx ON employee_tbl(emp_name);
CREATE INDEX emp_idname ON employee_tbl(emp_id,emp_name);
SHOW INDEXES FROM employee_tbl;

SELECT * FROM employee_tbl WHERE emp_id>1 AND emp_name='Ramya';
-- -------------------------------------------------------------------------------------------

-- DATA CONTROL LANGUAGE
GRANT SELECT ON employee_tbl TO 'root'@localhost;
GRANT SELECT,INSERT ON employee_tbl TO 'root'@localhost;
REVOKE DROP, DELETE on employee_tbl FROM 'root'@localhost;

CREATE USER 'bala'@localhost IDENTIFIED BY 'bala@123';
SHOW GRANTS FOR 'root'@localhost;
SHOW GRANTS FOR 'bala'@localhost;
GRANT SELECT,INSERT ON employee_tbl TO 'bala'@localhost;
SHOW GRANTS FOR 'bala'@localhost;

REVOKE INSERT ON employee_tbl FROM 'bala'@localhost;
SHOW GRANTS FOR 'bala'@localhost;

SELECT * FROM mysql.user;
GRANT SELECT ON * TO 'bala'@localhost;
-- -------------------------------------------------------------------------------------------

-- STRING FUNCTIONS
SELECT * FROM transaction_tbl;

SELECT product_name, CHAR_LENGTH(product_name) as len FROM transaction_tbl;

SELECT product_name, LENGTH(product_name) as len FROM transaction_tbl;

SELECT product_name, CHARACTER_LENGTH(product_name) as len FROM transaction_tbl;

SELECT product_name, amount , concat(product_name,'-',amount) as prod_amt FROM transaction_tbl;
SELECT product_name, amount , concat(cust_id,'-',product_name,'-',amount) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , concat_ws('-',trans_id,cust_id,product_name,amount) as prod_amt FROM transaction_tbl;
-- -------------------------------------------------------------------------------------------

SELECT * FROM transaction_tbl;

SELECT cust_id, GROUP_CONCAT(product_name) as products FROM transaction_tbl GROUP BY cust_id;

SELECT cust_id, count(product_name) as no_of_products FROM transaction_tbl GROUP BY cust_id;

SELECT cust_id, sum(amount) as total_amount FROM transaction_tbl GROUP BY cust_id;

SELECT product_name, amount , SUBSTRING_INDEX(concat_ws('-',trans_id,cust_id,product_name,amount),'-',3 ) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , SUBSTRING_INDEX(concat_ws('-',trans_id,cust_id,product_name,amount),'-',-2 ) as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[A-Za-z]+') as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[A-Z]+') as prod_amt FROM transaction_tbl;

SELECT product_name, amount , REGEXP_SUBSTR(concat_ws('-',trans_id,cust_id,product_name,amount),'[0-9]+',1,2) as prod_amt FROM transaction_tbl;
-- -------------------------------------------------------------------------------------------

-- Lower case, Upper case 
SELECT cust_id, product_name, amount FROM transaction_tbl;
SELECT cust_id, product_name, lower(product_name) as lname, amount FROM transaction_tbl;
SELECT cust_id, product_name, lcase(product_name) as lname, amount FROM transaction_tbl;
SELECT cust_id, product_name, upper(product_name) as uname, amount FROM transaction_tbl;
SELECT cust_id, product_name, ucase(product_name) as uname, amount FROM transaction_tbl;
-- -------------------------------------------------------------------------------------------

-- Replace
SELECT product_name, replace(product_name, 'o','-') as product FROM transaction_tbl;
SELECT product_name, replace(product_name, 'Desktop','System') as product FROM transaction_tbl;
SELECT product_name, replace(product_name, 'o','-') as product FROM transaction_tbl;

SELECT product_name, amount FROM transaction_tbl;
SELECT product_name, FORMAT(amount,2) FROM transaction_tbl;
SELECT product_name, FORMAT(amount,3) FROM transaction_tbl;
SELECT FORMAT(55635.6354256,2) ;
SELECT ROUND(55635.6354256,1) ;
SELECT ROUND(55635.6354256) ;

SELECT 1000;
SELECT CAST(1000 AS CHAR);
SELECT CAST("26-02-2023" AS DATE);
SELECT CAST("2023-02-26" AS DATE);
-- -------------------------------------------------------------------------------------------

SELECT 
    product_name, 
    CONCAT('₹ ',FORMAT(amount,0)) as Sal 
FROM 
    transaction_tbl 
ORDER BY 
    amount ASC;
-- -------------------------------------------------------------------------------------------

-- DATE FUNCTION
SELECT curdate();
SELECT current_timestamp();
SELECT NOW();
SELECT current_time();

-- %a - Weekday short name - Sun,Mon...Sat
-- %W- Weekday full name - Sunday, Monday,..... Saturday
-- %b - Month short name - Jan, Feb...Dec
-- %M - Month full name - January, february,...December
-- %c - Numeric month - 1..12
-- %d  - day of month - 1..31   
-- %e - day of moth - 1..31
-- %D - date with suffix -- 1st , 2nd, ...31st
-- %y - year in 2 digit format - 23,24,25...
-- %Y - year in 4 digit format -- 2023,2024,205...
-- %H - 24 hour format - 0..23
-- %I - 12 hour format .. 0..12
-- %p - AM|PM
-- %i - Minutes (00.59)
-- %s - seconds (00.59)

-- ================================================================================================

-- ------------------------------------- Use Employees Database -------------------------------------

SELECT * FROM Employees;

SELECT max(HireDate),min(HireDate) FROM Employees;

UPDATE Employees SET HireDate=current_timestamp() WHERE EmployeeID=1;
SELECT HireDate,year(HireDate) as year, month(HireDate) as month , day(HireDate) as day , date(HireDate) as date, 
time(HireDate) as time ,hour(HireDate) as hr, minute(HireDate) as minute, second(HireDate) as sec FROM Employees WHERE employeeid=1;

SELECT * FROM employees WHERE year(HireDate) = 2010 and month(HireDate)=01;

SELECT first,last,department,date_format(hiredate,"%D %M %Y %W"),salary FROM employees WHERE  EmployeeID=460;

SELECT date_format(current_date(),"%W,%d %M, %Y");
SELECT date_format(current_date(),"%b/%d/%Y");
SELECT date_format(current_date(),"%m/%d/%Y");
SELECT date_format(current_date(),"%d-%m-%Y") ;

SELECT ADDDATE(current_date(), INTERVAL 5 DAY);
SELECT ADDDATE(current_date(), INTERVAL 365 DAY);
SELECT ADDDATE(current_timestamp(), INTERVAL 2 HOUR);
SELECT ADDDATE(current_timestamp(), INTERVAL 3 MONTH);
SELECT ADDDATE(current_timestamp(), INTERVAL -3 MONTH);
SELECT ADDDATE(current_timestamp(), INTERVAL -1 DAY);
SELECT ADDDATE(current_timestamp(), INTERVAL 1 MONTH );
SELECT ADDTIME(current_timestamp(),"3:00:00");
SELECT ADDTIME(current_timestamp(),"3:30:00");
SELECT ADDTIME(current_timestamp(),"00:30:00");

-- DATE_ADD  works same as ADDATE
-- -------------------------------------------------------------------------------------------

SELECT DATEDIFF(current_date(), "2023-01-01");

SELECT dayofmonth(current_date());
SELECT dayofweek(current_date());
SELECT dayofyear(current_date());

SELECT timestampdiff(MONTH, '2023-02-26', '2023-11-26');
SELECT timestampdiff(DAY, '2023-02-26', '2023-11-26');
SELECT timestampdiff(YEAR, '2023-02-26', '2030-11-26');
-- -------------------------------------------------------------------------------------------

SELECT * FROM OFFICE;

SELECT * FROM country;
SELECT coalesce(country_name, 'NEWZELAND') FROM country;
SELECT IFNULL(country_name, 'NEWZELAND') FROM country;

SELECT * FROM Employees;

SELECT sal_category , count(sal_category) FROM (
SELECT concat(first," " ,last) as fullname, Salary,IF(Salary>50000,"HIGH PAID","LESS PAID") as sal_category FROM Employees) tbl
GROUP BY 1;
-- -----------------------------------------------------------------------------------------------

-- CASE STATEMENT

SELECT * FROM Employees;
SELECT DISTINCT status FROM Employees;

-- SYNTAX:
-- CASE
-- WHEN condition THEN ops
-- WHEN condition2 THEN ops1
-- .
-- .
-- ELSE ops
-- END as col_name

SELECT concat(first," ",last) as fullname,  salary, CASE
                                                    WHEN salary >= 50000 THEN "HIGH PAID"
                                                    WHEN salary < 50000 THEN "less paid"
                                                    END AS "category"
FROM employees;
                             
SELECT concat(first," ",last) as fullname,  salary, CASE
                                                    WHEN salary >= 50000 THEN "HIGH PAID"
                                                    ELSE "less"
                                                    END AS "category"
FROM employees;

SELECT * FROM employees;

-- 1999-2005    -> Super Senior
-- 2006-2009    -> Senior
-- 2010 onwords -> Junio

SELECT 
    CONCAT_WS(' ',first,last) AS Employee, 
    YEAR(hiredate) as year_of_hire, 
    CASE 
	  WHEN YEAR(hiredate) BETWEEN 1999 AND 2005 THEN 'Super Senior' 
	  WHEN YEAR(hiredate) > 2005 && YEAR(hiredate) <= 2009 THEN 'Senior' 
    ELSE 'Junior' 
    END AS Emp_type FROM employees;

-- =============================================== THE END ===============================================