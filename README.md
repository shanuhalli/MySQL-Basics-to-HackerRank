![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/a423a3e6-3541-4aee-8595-948164922651)

## Hacker Rank SQL Problem Solving:
### My solutions to various HackerRank SQL problems using MySQL

<details>
  <summary><h2>1. Basic Select<h2></summary>
  <br/>

### The CITY table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/86129f64-5081-4062-8b63-92123ad9ecad)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/3d95dae5-c23d-4790-b8fe-799fdfa80f36)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/a8dbdbe0-9a7d-4111-8196-0ab64132320d)

### The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

## Q 18. Higher Than 75 Marks

Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Solution:
```sql
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(NAME,3), ID ASC;
```

### The Employee table containing employee data for a company is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/aa67796f-863e-4097-be17-b75d3a3f5e2c)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/50d5242c-f1e5-4a90-967b-aef199d04dff)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/28387ec2-949b-4c04-b0f6-687937f15828)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/3ef07643-e2fe-40b2-a205-101d4ae88d0c)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/5d771e72-edba-45fd-9c83-ad9c2c1e2f49)

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

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/5ecc92ed-185e-421e-960f-598621b477c4)

Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

**Note:**

•	The tables may contain duplicate records.

•	The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.
________________________________________________________________________________________________________________________________________

The following tables contain company data:

•	Company: The company_code is the code of the company and founder is the founder of the 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/7595b942-f5b1-4613-a0e5-def6eb0e6e47)

•	Lead_Manager: The lead_manager_code is the code of the lead manager, and the company_code is the code of the working company.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/29803f25-08ae-48b5-80f5-eab4cc693731)

•	Senior_Manager: The senior_manager_code is the code of the senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/1d08f461-d684-4b62-a62c-28d21e6a07b5)

•	Manager: The manager_code is the code of the manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company. 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/eab932f4-fb3f-49cd-8c84-4e59f92d8669)

•	Employee: The employee_code is the code of the employee, the manager_code is the code of its manager, the senior_manager_code is the code of its senior manager, the lead_manager_code is the code of its lead manager, and the company_code is the code of the working company.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/707aed37-56ed-41bb-b023-849d98e1937d)

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

<details>
  <summary><h2>3. Aggregation<h2></summary>
  <br/>
    
### The CITY table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/a7d9f7f8-3dbf-41c2-9db9-da9392eb196e)

## Q1. Revising Aggregations - The Count Function

Query a count of the number of cities in CITY having a Population larger than.

Solution:
```sql
SELECT COUNT (*) FROM CITY WHERE POPULATION > 100000;
```

## Q2. Revising Aggregations - The Sum Function

Query the total population of all cities in CITY where District is California.

Solution:
```sql
SELECT SUM(POPULATION) FROM CITY WHERE DISTRICT = 'California';
```

## Q3. Revising Aggregations – Averages

Query the average population of all cities in CITY where District is California.

Solution:
```sql
SELECT AVG(POPULATION) FROM CITY WHERE DISTRICT = 'California'
```

## Q4. Average Population

Query the average population for all cities in CITY, rounded down to the nearest integer.

Solution:
```sql
SELECT FLOOR(AVG(POPULATION)) FROM CITY
```

## Q5. Japan Population

Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

Solution:
```sql
SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE = 'JPN'
```

## Q6. Population Density Difference

Query the difference between the maximum and minimum populations in CITY.

Solution:
```sql
SELECT MAX(POPULATION) - MIN(POPULATION) FROM CITY
```

## Q7. The Blunder

Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: Actual - Miscalculated average monthly salaries), and round it up to the next integer.

### The EMPLOYEES table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/accbce70-5ac6-4d83-a916-882ad51ad456)
 
**Note:** Salary is per month.

**Constraints:** 1000 < Salary < 10**5

Solution:
```sql
SELECT CEIL(AVG(SALARY) - AVG (REPLACE (SALARY, '0', ''))) FROM EMPLOYEES;
```

## Q8. Top Earners
We define an employee's total earnings to be their monthly salary * months worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as 2 space-separated integers.

### The Employee table containing employee data for a company is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/c1fafa99-e15b-4225-819f-d24acfaaabf9)
 
where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Solution:
```sql
SELECT MONTHS * SALARY AS EARNINGS, COUNT (*) FROM EMPLOYEE
GROUP BY EARNINGS
ORDER BY EARNINGS DESC
LIMIT 1;
```

### The STATION table is described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/0ed15699-ce19-4d45-ba25-5c2a5f8f1234)

### where LAT_N is the northern latitude and LONG_W is the western longitude.

## Q9. Weather Observation Station 2
Query the following two values from the STATION table:

1.	The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2.	The sum of all values in LONG_W rounded to a scale of 2 decimal places.

Solution:
```sql
SELECT ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2) FROM STATION;
```

## Q10. Weather Observation Station 13
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

Solution:
```sql
SELECT ROUND(SUM(LAT_N),4) FROM STATION 
WHERE LAT_N BETWEEN 38.7880 AND 137.2345;
```

## Q11. Weather Observation Station 14
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

Solution:
```sql
SELECT ROUND(MAX(LAT_N),4) FROM STATION
WHERE LAT_N < 137.2345;
```

## Q12. Weather Observation Station 15
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

Solution:
```sql
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N = (SELECT MAX(LAT_N) FROM STATION WHERE LAT_N < 137.2345);
```

## Q13. Weather Observation Station 16
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to 4 decimal places.

Solution:
```sql
SELECT ROUND(MIN(LAT_N),4) FROM STATION
WHERE LAT_N > 38.7780;
```

## Q14. Weather Observation Station 17
Query the Western Longitude (LONG_W) where the smallest Northern Latitude (LAT_N) in STATION is greater than 38.7780. Round your answer to 4 decimal places.

Solution:
```sql
SELECT ROUND(LONG_W,4) FROM STATION
WHERE LAT_N = (SELECT MIN(LAT_N) FROM STATION WHERE LAT_N > 38.7780);
```

## Q15. Weather Observation Station 18
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane.

•	happens to equal the minimum value in Northern Latitude (LAT_N in STATION).

•	happens to equal the minimum value in Western Longitude (LONG_W in STATION).

•	happens to equal the maximum value in Northern Latitude (LAT_N in STATION).

•	happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

Solution:
```sql
SELECT ROUND(ABS(MAX(LAT_N) - MIN(LAT_N)) + ABS(MAX(LONG_W) - MIN(LONG_W)), 4) FROM STATION;
```

## Q16. Weather Observation Station 19
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

Solution:
```sql
SELECT ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)),4) FROM STATION;
```

## Q17. Weather Observation Station 20
A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

Solution:
```sql
SELECT CAST (LAT_N AS DECIMAL (7,4))
FROM (SELECT LAT_N, ROW_NUMBER () OVER (ORDER BY LAT_N) as ROWNU FROM STATION) AS X
WHERE ROWNU = (SELECT ROUND((COUNT(LAT_N)+1)/2,0) FROM STATION);
```

</details>

<details>
  <summary><h2>4. Basic Join<h2></summary>
  <br/>

### The CITY and COUNTRY tables are described as follows:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/aff0b1fa-993f-4360-aa18-70bbe956ee84)
![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/d460e5e1-fe5a-4007-8b39-6ee22317d97a)

## Q1. Population Census
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Solution:
```sql
SELECT SUM(CITY.POPULATION) FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'ASIA';
```

## Q2. African Cities
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Solution:
```sql
SELECT CITY.NAME FROM CITY
JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE COUNTRY.CONTINENT = 'Africa';
```

## Q3. Average Population of Each Continent
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

Solution:
```sql
SELECT COUNTRY.CONTINENT, FLOOR(AVG(CITY.POPULATION)) FROM COUNTRY
JOIN CITY ON COUNTRY.CODE = CITY.COUNTRYCODE
GROUP BY COUNTRY.CONTINENT;
```

## Q4. The Report
You are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/9f94fd1a-e0c4-4f5a-bdb2-822ae4d85ce9)

Grades contains the following data:

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/afe8a89c-582d-400a-a158-64f25dd60765)


Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students by their marks in ascending order.

Write a query to help Eve.

Solution:
```sql
SELECT 
    CASE WHEN Grade >= 8 THEN Name END, 
    Grade, 
    Marks
FROM Students
JOIN Grades
ON Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY Grade DESC, Name, Marks;
```

## Q5. Top Competitors
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

The following tables contain contest data:

•	Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/12c5f8c2-d3c1-46ef-9125-3554b7ffd3c8)
  
•	Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of the challenge for the difficulty level. 

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/7da96c42-8973-42aa-88f2-2ae995a64f6a)

•	Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, and difficulty_level is the level of difficulty of the challenge.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/50a833ad-5180-48d7-a204-a36d2a0b9070)

•	Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id is the id of the challenge that the submission belongs to, and score is the score of the submission.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/2034fcd3-3ca4-48ca-b626-48d5f1d9bde8)

Solution:
```sql
SELECT H.HACKER_ID, H.NAME FROM HACKERS H
INNER JOIN SUBMISSIONS S ON H.HACKER_ID = S.HACKER_ID
INNER JOIN CHALLENGES C ON S.CHALLENGE_ID = C.CHALLENGE_ID
INNER JOIN DIFFICULTY D ON C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL

WHERE S.SCORE = D.SCORE AND C.DIFFICULTY_LEVEL = D.DIFFICULTY_LEVEL
GROUP BY H.HACKER_ID, H.NAME
HAVING COUNT(S.HACKER_ID) > 1
ORDER BY COUNT(S.HACKER_ID) DESC, S.HACKER_ID ASC;
```

## Q6. Ollivander's Inventory
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

The following tables contain data on the wands in Ollivander's inventory:

•	Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/32301f24-1948-4774-8411-decc4c55ef23)

•	Wands_Property: The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), then code1 ≠ code2 and age1 ≠ age2.

![image](https://github.com/shanuhalli/MySQL-Basics-to-HackerRank/assets/109328924/15b1fea3-e1fd-429e-b8c2-ddc842c3c4e0)

Solution:
```sql
SELECT W.ID, P.AGE, W.COINS_NEEDED, W.POWER FROM WANDS AS W
JOIN WANDS_PROPERTY AS P ON (W.CODE = P.CODE) 
WHERE P.IS_EVIL = 0 AND W.COINS_NEEDED = (SELECT MIN(COINS_NEEDED) 
                                          FROM WANDS AS X
                                          JOIN WANDS_PROPERTY AS Y 
                                          ON (X.CODE = Y.CODE) 
                                          WHERE X.POWER = W.POWER AND Y.AGE = P.AGE) 
ORDER BY W.POWER DESC, P.AGE DESC;
```

</details>
