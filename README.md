![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/a423a3e6-3541-4aee-8595-948164922651)

## Hacker Rank SQL Problem Solving:
### My solutions to various HackerRank SQL problems using MySQL

<details>
  <summary><h2>1. Basic Select<h2></summary>
  <br/>

### The CITY table is described as follows:

![1449729804-f21d187d0f-CITY](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/dbb4a313-b8c2-44a6-a054-2c91c9308275)

## Q1. Revising the Select Query I

Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Solution:
```sql
SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
```

## Q2. Revising the Select Query II

Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

Solution:
```sql
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;
```

## Q3. Select All

Query all columns (attributes) for every row in the CITY table.

Solution:
```sql
SELECT * FROM CITY;
```

## Q4. Select By ID

Query all columns for a city in CITY with the ID 1661.

Solution:
```sql
SELECT * FROM CITY WHERE ID = 1661;
```

## Q5. Japanese Cities' Attributes

Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

Solution:
```sql
SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';
```

## Q6. Japanese Cities' Names

Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

Solution:
```sql
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';
```

### The STATION table is described as follows:

![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/07a885c8-5994-489f-bbc3-5dcfaa78e309)

### where LAT_N is the northern latitude and LONG_W is the western longitude.

## Q7. Weather Observation Station 1

Query a list of CITY and STATE from the STATION table.

Solution:
```sql
SELECT CITY, STATE FROM STATION;
```

## Q8. Weather Observation Station 3

Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE MOD (ID,2) = 0 ORDER BY CITY;
```

## Q9. Weather Observation Station 4

Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Solution:
```sql
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
```

## Q10. Weather Observation Station 5

Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

Solution:
```sql
SELECT COUNT(CITY) – COUNT (DISTINCT CITY) FROM STATION;
```

## Q11. Weather Observation Station 6

Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U');
```

## Q12. Weather Observation Station 7

Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) IN ('A','E','I','O','U');
```

## Q13. Weather Observation Station 8

Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U') AND 
RIGHT(CITY,1) IN ('A','E','I','O','U');
```

## Q14. Weather Observation Station 9

Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U');
```

## Q15. Weather Observation Station 10

Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

## Q16. Weather Observation Station 11

Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') OR 
RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

## Q17. Weather Observation Station 12

Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') AND
RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

### The STUDENTS table is described as follows: 
![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/680963aa-a36c-4d89-9c36-d1bf9f0e0f01)

### The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

## Q 18. Higher Than 75 Marks

Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Solution:
```sql
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(NAME,3), ID ASC;
```

### The Employee table containing employee data for a company is described as follows:
![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/382d5f81-1816-4e9f-b024-a76d0bcee3f5)

### where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

## Q 19. Employee Names

Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Solution:
```sql
SELECT NAME FROM EMPLOYEE ORDER BY NAME;
```

## Q 20. Employee Salaries

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

Solution:
```sql
SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY EMPLOYEE_ID;
```
</details>

<details>
  <summary><h2>2. Advanced Select<h2></summary>
  <br/>

## Q1. Type of Triangle

Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

•	Equilateral: It's a triangle with 3 sides of equal length.

•	Isosceles: It's a triangle with 2 sides of equal length.

•	Scalene: It's a triangle with 3 sides of differing lengths.

•	Not A Triangle: The given values of A, B, and C don't form a triangle.

### The TRIANGLES table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/626377ad-5d9a-4836-b622-c4cc3fcbbd97)

### Each row in the table denotes the lengths of each of a triangle's three sides.

Solution:
```sql
SELECT CASE
WHEN A+B <= C OR A+C <= B OR B+C <= A THEN "Not A Triangle"
WHEN A = B AND B = C THEN "Equilateral"
WHEN A = B OR A = C OR B = C THEN "Isosceles"
ELSE "Scalene"
END AS TRIANGLE_SIDES FROM TRIANGLES
```

## Q2. The PADS

Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).

2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

3. There are a total of [occupation_count] [occupation]s.

where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

**Note:** There will be at least two entries in the table for each type of occupation.

### The OCCUPATIONS table is described as follows: 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/76b251c4-5d1f-4293-9dd8-b4abc881ba36)

### Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Solution:
```sql
SELECT CONCAT(NAME,'(',SUBSTRING(OCCUPATION,1,1),')') AS NAME
FROM OCCUPATIONS
ORDER BY NAME;
SELECT CONCAT ('There are a total of ', COUNT(OCCUPATION),' ', LOWER(OCCUPATION), 's.') AS TOTALS
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY TOTALS
```

## Q3. Occupations

Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

**Note:** Print NULL when there are no more names corresponding to an occupation.

### The OCCUPATIONS table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/ee38ac39-4ebc-4646-b29d-116ffa389076)

### Occupation will only contain one of the following values: Doctor, Professor, Singer or Actor.

Solution:
```sql
SELECT Doctor, Professor, Singer, Actor
FROM (
    SELECT
        NameOrder,
        MAX(CASE Occupation WHEN 'Doctor' THEN Name END) AS Doctor,
        MAX(CASE Occupation WHEN 'Professor' THEN Name END) AS Professor,
        MAX(CASE Occupation WHEN 'Singer' THEN Name END) AS Singer,
        MAX(CASE Occupation WHEN 'Actor' THEN Name END) AS Actor
FROM (
    SELECT
        Occupation,
        Name,
        Row_Number() OVER(PARTITION BY Occupation ORDER BY Name ASC) AS NameOrder
        FROM Occupations) AS NameLists
GROUP BY NameOrder) AS NAMES
```

## Q4. Binary Tree Nodes

You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/57720329-4942-4978-9f8e-a77c13a858da)

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

•	Root: If node is root node.

•	Leaf: If node is leaf node.

•	Inner: If node is neither root nor leaf node.

Solution:
```sql
SELECT N,
CASE
    WHEN P IS NULL THEN 'Root'
    WHEN N IN (SELECT P FROM BST) THEN 'Inner'
    ELSE 'Leaf'
END
FROM BST
ORDER BY N;
```

## Q5. New Companies

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/c0761a63-1bd1-4348-915e-e59fe3ba07b8)

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

**Note:**

•	The tables may contain duplicate records.

•	The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
________________________________________________________________________________________________________________________________________

The following tables contain company data:

•	Company: The company_code is the code of the company and founder is the founder of the 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/2672b9f6-d808-469a-875a-0ce0c2d395cb)

•	Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/f3e36eec-b01d-4581-9ea5-6ebc9563a180)

•	Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/b098aa06-cc38-49db-941c-064423ed319e)

•	Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/34d22425-9678-4715-854f-e30a1fde25d5)

•	Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/5d3ca0b7-7ab7-41aa-b1aa-c80619f78d88)

Solution:
```sql
SELECT C.COMPANY_CODE, C.FOUNDER,
  (SELECT COUNT(DISTINCT LEAD_MANAGER_CODE)
   FROM LEAD_MANAGER L
   WHERE L.COMPANY_CODE = C.COMPANY_CODE),
  (SELECT COUNT(DISTINCT SENIOR_MANAGER_CODE)
   FROM SENIOR_MANAGER S
   WHERE S.COMPANY_CODE = C.COMPANY_CODE),
  (SELECT COUNT(DISTINCT MANAGER_CODE)
   FROM MANAGER M
   WHERE M.COMPANY_CODE = C.COMPANY_CODE),
  (SELECT COUNT(DISTINCT EMPLOYEE_CODE)
   FROM EMPLOYEE E
   WHERE E.COMPANY_CODE = C.COMPANY_CODE)
FROM COMPANY C
ORDER BY C.COMPANY_CODE ASC;
```

  </details>
