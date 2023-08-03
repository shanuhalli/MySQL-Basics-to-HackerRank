# Practice-MySQL

## Hacker Rank Problem Solving:
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

Q7. Query a list of CITY and STATE from the STATION table. where LAT_N is the northern latitude and LONG_W is the western longitude.

Solution:
```sql
SELECT CITY, STATE FROM STATION;
```

Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer. where LAT_N is the northern latitude and LONG_W is the western longitude.

Solution:
```sql
SELECT DISTINCT CITY FROM STATION WHERE MOD (ID,2) = 0 ORDER BY CITY;
```

Q9. Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. where LAT_N is the northern latitude and LONG_W is the western longitude.

Solution:
```sql
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY LIMIT 1;
SELECT CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
```
