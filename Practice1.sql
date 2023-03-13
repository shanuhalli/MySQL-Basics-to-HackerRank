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
-- =================================================================================
-- (INSERT) DATA IN RECORD
INSERT INTO RECORD VALUES(101, 'Shanu Halli', 29, 'M', 'Belagavi');
INSERT INTO RECORD VALUES(102, "Rakhi Talap", 28, "F", "Kolhapur");
INSERT INTO RECORD VALUES(109,  "Kiran Halli",15, 'F', "Mumbai"),
						 (110,  "Mayappa Patil",45,'M', "Sangli"),
						 (111,  "Vasant Helavi",56, 'M', "Mumbai");

SELECT * FROM RECORD;
-- =================================================================================
-- Re-arranged columns
INSERT INTO RECORD (ID, Age, Gender, FName, City) VALUES(103, 54, 'M', "Kirti Sonawane", "Pune");

SELECT * FROM RECORD;
-- =================================================================================
-- Missing data in columns
INSERT INTO RECORD(ID, AGE, FName, City) VALUES(104, 52, "Bharti Sonawane", "Worli");
INSERT INTO RECORD(ID, Gender, FName, City) VALUES(105, 'F', "Priti Prakash", "Pune");
INSERT INTO RECORD(Age, Gender, FName, City) VALUES(09, 'M', "Vedant", "Mumbai");
INSERT INTO RECORD(ID, Gender, Age, City) VALUES(107, 'F',19, "Thane");
INSERT INTO RECORD(ID, Gender, Age) VALUES(108, 'F',30);

SELECT * FROM RECORD;
-- =================================================================================
-- (UPDATE) DATA IN RECORD
-- Safe Mode Disabled --
SET SQL_SAFE_UPDATES = 0;

-- ADD NULL VALUES IN RECORD
UPDATE RECORD SET Gender = 'F' WHERE ID = 104;
UPDATE RECORD SET City = 'Ghatkopar',  FName = 'Neha' WHERE ID = 108;
UPDATE RECORD SET ID = 106 WHERE FName = 'Vedant';
UPDATE RECORD SET Age = 46 WHERE Age IS Null;

SELECT * FROM RECORD;
-- =================================================================================
-- (DELETE) DATA IN RECORD
DELETE FROM RECORD WHERE Age>50; 
DELETE FROM RECORD WHERE City = 'Thane';
DELETE FROM RECORD WHERE City IN ('Sangli', 'Pune');
DELETE FROM RECORD WHERE City NOT IN ('Belagavi', 'Kolhapur');

SELECT * FROM RECORD;
-- ================================== THE END ======================================