![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/a423a3e6-3541-4aee-8595-948164922651)

## Hacker Rank SQL Problem Solving:
### My solutions to various HackerRank SQL problems using MySQL

<details>
  <summary><h2>1. Basic Select<h2></summary>
  <br/>

### The CITY table is described as follows:

![1449729804-f21d187d0f-CITY](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/dbb4a313-b8c2-44a6-a054-2c91c9308275)

Q1. Query all columns for all American cities in the CITY table with populations larger than 100000. The CountryCode for America is USA.

Solution:
```sql
SELECT * FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
```

Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000. The CountryCode for America is USA.

Solution:
```sql
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;
```

Q3. Query all columns (attributes) for every row in the CITY table.

Solution:
```sql
SELECT * FROM CITY;
```

Q4. Query all columns for a city in CITY with the ID 1661.

Solution:
```sql
SELECT * FROM CITY WHERE ID = 1661;
```

Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.

Solution:
```sql
SELECT * FROM CITY WHERE COUNTRYCODE = 'JPN';
```

Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.

Solution:
```sql
SELECT NAME FROM CITY WHERE COUNTRYCODE = 'JPN';
```

### The STATION table is described as follows:

![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/07a885c8-5994-489f-bbc3-5dcfaa78e309)

### where LAT_N is the northern latitude and LONG_W is the western longitude.

Q7. Query a list of CITY and STATE from the STATION table.
Solution:
```sql
SELECT CITY, STATE FROM STATION;
```

Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE MOD (ID,2) = 0 ORDER BY CITY;
```

Q9. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Solution:
```sql
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
```

Q10. Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

Solution:
```sql
SELECT COUNT(CITY) – COUNT (DISTINCT CITY) FROM STATION;
```

Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U');
```

Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) IN ('A','E','I','O','U');
```

Q13. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) IN ('A','E','I','O','U') AND 
RIGHT(CITY,1) IN ('A','E','I','O','U');
```

Q14. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U');
```

Q15. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

Q16. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') OR 
RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

Q17. Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') AND
RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
```

### The STUDENTS table is described as follows: 
![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/680963aa-a36c-4d89-9c36-d1bf9f0e0f01)

### The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

Q 18. Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Solution:
```sql
SELECT NAME FROM STUDENTS WHERE MARKS > 75 ORDER BY RIGHT(NAME,3), ID ASC;
```

### The Employee table containing employee data for a company is described as follows:
![image](https://github.com/shanuhalli/Practice-MySQL/assets/109328924/382d5f81-1816-4e9f-b024-a76d0bcee3f5)

### where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is their monthly salary.

Q 19. Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.
Solution:

```sql
SELECT NAME FROM EMPLOYEE ORDER BY NAME;
```

Q 20. Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than $2000 per month who have been employees for less than 10 months. Sort your result by ascending employee_id.
Solution:

```sql
SELECT NAME FROM EMPLOYEE WHERE SALARY > 2000 AND MONTHS < 10 ORDER BY EMPLOYEE_ID;
```
