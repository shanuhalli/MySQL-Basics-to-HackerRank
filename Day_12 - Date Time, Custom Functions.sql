# Difference between row_number, rank and dense rank

with tie as
(
Select 
concat(First,' ',Last) as FullName, 
Salary,
Row_number() over (Order by Salary desc) as rw,
Rank() over (Order by Salary desc) as rnk,
Dense_Rank() over (Order by salary desc) as drnk
from employees.employees
Order by salary desc 
)
Select *
from tie
where drnk <=3 ;

# Display the list of films in each genre with runtime more than avg runtimeminutes of all films in that genre

with gt as
(
Select
Title,
Genre,
RunTimeMinutes,
Avg(RunTimeMinutes) over (Partition by Genre) as AvgRunTime
from movies.film f inner join movies.Genre g on f.GenreId = g.GenreID 
)
Select *
from gt
where RunTimeMinutes > AvgRunTime ;

# Display the list of films in each year with runtime more than avg runtimeminutes of all films in that year

with gt as
(
Select
Year(ReleaseDate) as Year,
RunTimeMinutes,
Avg(RunTimeMinutes) over (Partition by Year(ReleaseDate)) as AvgRunTime
from movies.film
)
Select *
from gt
where RunTimeMinutes > AvgRunTime ;
-- ------------------------------------------------------------------------------------------

# display Year wise % change in hiring

# 2008     100
# 2009     200    100%
# 2010     300    70%

Select
EmployeeId,
concat(First,' ',Last) as FullName,
Salary,
Lead(Salary) over (Order by EmployeeId) as ld
from employees.employees ;

Select
EmployeeId,
concat(First,' ',Last) as FullName,
Salary,
Lag(Salary) over (Order by EmployeeId) as ld
from employees.employees ;
-- ------------------------------------------------------------------------------------------

with ct as
(
Select
Year(Hiredate) as Year,
Count(*) as Number_of_Emp
from employees.employees
Group by Year 
)
Select
Year,
Number_of_Emp,
((Number_of_Emp - Lag(Number_of_Emp) over (Order by Year))/Lag(Number_of_Emp) over (Order by Year))*100 as py
from ct ;

# Year, Quarter, % change in hiring compared to prev quarter in each year

with qt as
(
select quarter(Hiredate) as quarter,
year(HireDate) as year,
count(*) as Number_of_Emp
from employees.employees
group by year,quarter
) 
select year,quarter,Number_of_Emp,
((number_of_Emp - lag(Number_of_Emp) over (order by Year,quarter))/lag(Number_of_Emp) over (order by year,quarter))*100 as py
from qt
order by year,quarter ;

# Q1 from 2001 with Q1 from 2000

with qt as
(
select quarter(Hiredate) as quarter,
year(HireDate) as year,
count(*) as Number_of_Emp
from employees.employees
group by year,quarter
) 
select 
year,
quarter,
Number_of_Emp,
lag(Number_of_Emp) over (order by Year) as py
from qt
order by year, quarter ;

# Datetime functions

Select 
curdate() as today,
curtime() as now,
now() as dt,
Year(curdate()) as Yr,
Month(curdate()) as Month,
Quarter(curdate()) as Qtr,
MonthName(curdate()) as MN,
DayName(curdate()) as dy,
date_add(curdate(), Interval -3 Year) as da,
datediff('2024-6-28', curdate()) as df,
timestampdiff(Year, curdate(),'2024-6-28') as tm ;
-- ------------------------------------------------------------------------------------------

# Display age of the movie in years and months format 

SELECT 
	Title, 
    Releasedate, 
    CONCAT(
		TIMESTAMPDIFF(YEAR,Releasedate,CURDATE()), 
        ' Years ',
		TIMESTAMPDIFF(MONTH,Releasedate,CURDATE()) % 12, 
        ' Months'
	) Age
FROM 
	movies.film ;

SELECT 
	Title, 
    Releasedate, 
    CONCAT(
		TIMESTAMPDIFF(YEAR,Releasedate,CURDATE()), 
        ' Years ',
		TIMESTAMPDIFF(MONTH,Releasedate,CURDATE()) % 12, 
        ' Months'
	) Age
FROM 
	movies.film ;
-- ================================================= THE END =================================================