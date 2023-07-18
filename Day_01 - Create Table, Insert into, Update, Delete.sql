-- CREATE NEW DATABASE
CREATE DATABASE training;

-- DELETE DATABASE
-- DROP DATABASE training;

-- USE AND WORK FON PERTICULER DATABASE
use training;

-- --------------------------------------------------------------------------------
-- DDL  -- Data Definition Language ( CREATE, ALTER, DROP, TRUNCATE)
-- DML  -- DATA MANUPULATION LANGUAGE (INSERT, UPDATE, DELETE)
-- DCL  -- DATA CONTROL LANGUAGE ( GRANT, REVOKE)
-- TCL  -- TRANSACTION CONTROL LANGUAGE (COMMIT, ROLLBACK, SAVEPOINT)
-- DQL  -- DATA QUERY LANGUGE (SELECT)

-- JOINS
-- FUNCTIONS
-- PLSQL
-- --------------------------------------------------------------------------------

-- OLTP  -> ONLINE TRANSACTION PROCESS (YOU CAN UPDATE OR MODIFY)
-- OLAP  -> ONLINE ANALYTICS PROCESS   (WORM -> Write Once Read Many)

-- RELATIONAL DATABASE SYSTEM  -> MYSQL, ORACLE, MsSQL
-- NoSQL  -> Mongo DB, ElasticSearch, Cassandra, Hbase
-- DataWarehouse  -> RedShift, BigQuery, Snowflake
-- Datalake  -> S3, GFS, Azure Blob
-- Data Lakehouse  -> Databricks

-- --------------------------------------------------------------------------------

CREATE TABLE customer (custid INT, custname VARCHAR(50), age INT, gender CHAR(1), city VARCHAR(50));

-- DATA TYPES
-- INT     -> To store a Number (1,2,3,4,5)
-- CHAR    -> Fixed length of String
-- VARCHAR -> Variable Characters
-- DATE    -> 05-02-2023 02/05/2023, 2023-02-05 10:30
-- BOOLEAN -> True False None
-- DOUBLE  -> 30.56,1.11

-- --------------------------------------------------------------------------------

-- LOAD DATA (INSERT)

INSERT INTO customer VALUES(1000,'Raghul Ramesh', 37, 'M', 'Chennai');
INSERT INTO CUSTOMER VALUES(1001,'Shanu Halli',30,'M','Belagavi');

INSERT INTO CUSTOMER(custid, custname, gender, city) VALUES(1002,'Malini Patil','F','Bangalore');
INSERT INTO customer(city,custname,gender,custid,age) VALUES('Pune','Pankaj Kumar','M',1003,40);

INSERT INTO CUSTOMER VALUES(1004,'Mohan Kuamr',37,'M','Chennai'),(1005,'Sivanand More',50,'M','Delhi'),(1006,'Ranga Reddy',55,'M','Chennai');

INSERT INTO CUsTOmEr(custid, custname, gender, city) VALUES(1007,'Raj Kumar','M','Pandicherry');
INSERT INTO CuStOmEr(custid, custname, city, gender) VALUES(1008,'Shilpa D','Mumbai', 'F');

-- SHOW the DATABASE
SELECT * FROM customer;

-- --------------------------------------------------------------------------------

-- UPDATE statement

-- SAFE MODE disable
SET sql_safe_updates=0;

UPDATE customer SET age=30 WHERE custid=1002;
UPDATE customer SET age=60 WHERE custid=1007;

-- CONSTAINTS (UNIQUE, NOT NULL, PRIMARY KEY, FOREIGN KEY, CHECK, DEFAULT);

UPDATE customer SET custid=1010 WHERE custid=1006;
UPDATE customer SET age=41, city='Hyderabad' WHERE custid=1003;
INSERT INTO CUSTOMER(custname, age, gender, city) VALUES('Aveek Sharma',45,'M','Hyderabad');

-- ENTER VALUE FOR NULL
UPDATE customer SET custid=1008 WHERE custid IS NULL;

 -- DELETE the records
DELETE FROM customer WHERE custname='Sivanand More';
  
SELECT * FROM CUSTOMER;
 
DELETE FROM customer WHERE age>=50;

-- DELETE THE RECORD IF THE CUSTOMER ARE FROM Chennai OR Bangalore
DELETE FROM CUSTOMER WHERE city IN ('Chennai','Bangalore');

-- -- DELETE THE RECORD IF THE CUSTOMER ARE NOT FROM Belagavi
DELETE FROM CUSTOMER WHERE city != 'Belagavi';

-- DELETE THE RECORD IF THE CUSTOMER ARE NOT FROM EITHER Chennai OR Hyderabad
DELETE FROM CUSTOMER WHERE CITY NOT IN ('Chennai','Hyderabad');

-- =================================================================================

-- My Practice
CREATE DATABASE STUDENT;
USE STUDENT;
SHOW DATABASES;

CREATE TABLE RECORD(
ID INT,
FName VARCHAR(50),
Age INT,
Gender CHAR(1),
City VARCHAR(50)
);

SELECT * FROM RECORD;
-- --------------------------------------------------------------------------------

-- (INSERT) DATA IN RECORD
INSERT INTO RECORD VALUES(101, 'Shanu Halli', 29, 'M', 'Belagavi');
INSERT INTO RECORD VALUES(102, "Rakhi Talap", 28, "F", "Kolhapur");
INSERT INTO RECORD VALUES(109,  "Kiran Halli",15, 'F', "Mumbai"),
						 (110,  "Mayappa Patil",45,'M', "Sangli"),
						 (111,  "Vasant Helavi",56, 'M', "Mumbai");

SELECT * FROM RECORD;
-- --------------------------------------------------------------------------------

-- Re-arranged columns
INSERT INTO RECORD (ID, Age, Gender, FName, City) VALUES(103, 54, 'M', "Kirti Sonawane", "Pune");

SELECT * FROM RECORD;
-- --------------------------------------------------------------------------------

-- Missing data in columns
INSERT INTO RECORD(ID, AGE, FName, City) VALUES(104, 52, "Bharti Sonawane", "Worli");
INSERT INTO RECORD(ID, Gender, FName, City) VALUES(105, 'F', "Priti Prakash", "Pune");
INSERT INTO RECORD(Age, Gender, FName, City) VALUES(09, 'M', "Vedant", "Mumbai");
INSERT INTO RECORD(ID, Gender, Age, City) VALUES(107, 'F',19, "Thane");
INSERT INTO RECORD(ID, Gender, Age) VALUES(108, 'F',30);

SELECT * FROM RECORD;
-- --------------------------------------------------------------------------------

-- (UPDATE) DATA IN RECORD
-- Safe Mode Disabled --
SET SQL_SAFE_UPDATES = 0;

-- ADD NULL VALUES IN RECORD
UPDATE RECORD SET Gender = 'F' WHERE ID = 104;
UPDATE RECORD SET City = 'Ghatkopar',  FName = 'Neha' WHERE ID = 108;
UPDATE RECORD SET ID = 106 WHERE FName = 'Vedant';
UPDATE RECORD SET Age = 46 WHERE Age IS Null;

SELECT * FROM RECORD;
-- --------------------------------------------------------------------------------

-- (DELETE) DATA IN RECORD
DELETE FROM RECORD WHERE Age>50; 
DELETE FROM RECORD WHERE City = 'Thane';
DELETE FROM RECORD WHERE City IN ('Sangli', 'Pune');
DELETE FROM RECORD WHERE City NOT IN ('Belagavi', 'Kolhapur');

SELECT * FROM RECORD;

-- ================================== THE END ======================================