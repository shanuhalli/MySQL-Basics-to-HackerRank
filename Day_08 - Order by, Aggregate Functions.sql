# Order by
# Ascending Sort, Descending Sort, Multiple Column Sort, Custom Sort

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by Salary desc ;

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by Salary ;

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by Salary desc
Limit 5 ;

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by Salary desc
Limit 1 Offset 5 ;  # Shows 6th row

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
where Status = 'Full Time'
Union
Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Where Status = 'Contract' ;

Select
concat(First,' ',Last) as FullName, Department, Salary
from employees.employees
Order by Department asc, Salary desc ;

# Full Time, Contract, Half-Time, Hourly

Select
concat(First,' ',Last) as FullName, Status,
case
when Status = 'Full Time' then 1
when Status = 'Contract' then 2
when Status = 'Half-Time' then 3
else 4
end as Sort
from employees.employees
Order by Sort ;

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by case
when Status = 'Full Time' then 1
when Status = 'Contract' then 2
when Status = 'Half-Time' then 3
else 4
end asc, Salary desc ;

# 1. Display Top 10 Highest Grossing Films (Based on BoxofficeDollars)

Select
Title, BoxofficeDollars
from movies.film
Order by Boxofficedollars desc
Limit 10 ;

# 2. Display Top 10 Youngest Players from India (Country_Name = 1)

Select
Player_Name, DoB
from ipl.Player
Where Country_Name = 1
Order by DoB desc
Limit 10 ;

# 3. Sort by Status in Full Time, Contract, Half-Time, Hourly order and then by Jobrating and then by Salary in desc order

Select
concat(First,' ',Last) as FullName, Status, Jobrating, Salary
from employees.employees
Order by case
when Status = 'Full Time' then 1
when Status = 'Contract' then 2
when Status = 'Half-Time' then 3
else 4
end asc,Jobrating asc,salary desc ;

# 4. Sort by highest to lowest oscars and then by Boxoffice Dollars in desc

Select
Title, BoxofficeDollars, OscarWins
from movies.film
Order by OscarWins desc, BoxofficeDollars desc ;

# 5. Sort by Text Title and then by alphanumeric title and then by numeric title within each group, sort by title again

Select
Title
from movies.film
Order by case
when Title not regexp '[0-9]' then 1
when Title regexp '[A-Z]' then 2
else 3
end asc, Title asc ;

Select
concat(First,' ',Last) as FullName, Status, Salary
from employees.employees
Order by Salary asc
Limit 1 Offset 1 ;

with ty as(
Select
concat(First,' ',Last) as FullName, Status, Salary,
Row_number() over (Order by Salary asc) as rw,
Row_number() over (Order by Salary desc) as rh
from employees.employees
)
Select *
from ty
where rw = 2 or rh = 2 ;

-- --------------------------------------------------------------------------------------------

# Aggregate functions (Avg,Count,Max,Min,Sum)

Select
Count(*) as Number_of_Films,
Count(BoxofficeDollars) as CountBO,
Count(case when BoxofficeDollars > BudgetDollars then 1 end) as Hits,
Count(case when BoxofficeDollars < BudgetDollars then 1 end) as Flops,
Count(case when BoxofficeDollars is null or BudgetDollars is null then 1 end) as CountNulls,
Count(case when OscarWins > 0 then 1 end) as CountOscars,
Avg(BoxofficeDollars) as AvgBO,
Max(BoxofficeDollars) as MaxBO,
Sum(OscarWins) as TotalOscars,
Count(OscarWins) as Countall
from Movies.Film ;

# Count only oscar winning films

Select *
from movies.film 
Where BoxofficeDollars is null;

Select
Title, BoxofficeDollars, BudgetDollars, OscarWins,
case
when BoxofficeDollars > BudgetDollars then 1
end as Hit,
case
when BoxofficeDollars < BudgetDollars then 1
end as Flop,
Case
when BoxofficeDollars is null or BudgetDollars is null then 1
end as checknull,
Case
when OscarWins > 0 then 1
end as  Oscars
from movies.film ;

# Find out the list of films which has highest number of oscars in the table

Select
Title,OscarWins
from movies.film
Where OscarWins = 11 ; 

Select
Title,OscarWins
from movies.film
Where OscarWins = (Select Max(OscarWins) from movies.film) ;

# Display the list of films with runtime more than average runtime of all films

Select
Title, RunTimeMinutes
from movies.film
Where RunTimeMinutes > (Select Avg(RunTimeMinutes) from movies.film) ;

# Display the list of actors who are younger than the youngest Director

# Youngest Director - 30 Years
# Actors < 30 Years

Select
concat(FirstName,' ',FamilyName) as FullName, DoB
from movies.actor
Where DoB > (Select Max(DoB) from movies.Director) ;

Select
Department,
Count(*) as Number_of_Emp,
Avg(Salary) as AvgSalary
from employees.employees
Group by Department
Order by Department asc ;

Select
Department, Status,
Count(*) as Number_of_Emp,
Avg(Salary) as AvgSalary
from employees.employees
Group by Department, Status
Order by Department ;

# Display the count of all employees, Count of permanent employees, count of temp emp in each dept

Select
Department,
Count(*) as Number_of_Emp,
Count(case when status = 'Full Time' then 1 end) as PermanentEmp,
Count(case when status != 'Full Time' then 1 end) as TemporaryEmp
from employees.employees
Group by Department ;

Select
Department, Status,
case when status = 'Full Time' then 'P' else 'T' end as EmpType
from employees.employees ;

# Avg Salary of Permanent Employees and Avg Salary of Temporary employees by Dept

Select
Department,
round(Avg(case when Status = 'Full Time' then Salary end)) as AvgP,
round(Avg(case when Status != 'Full Time' then Salary end)) as AvgT
from employees.employees
Group by Department
Order by Department asc ;

# Final account balance of each UserId -- Use paypal database

Select
UserId,
Sum(case when TransactionType = 'Deposit' then Amount else 0 end) - 
(Sum(case when TransactionType = 'Withdraw' then Amount else 0 end)) as Balance
from paypal.accountmaster
Group by UserId ;

Select
UserId,
Sum(case when TransactionType = 'Deposit' then Amount else - Amount end) as Balance
from paypal.accountmaster
Group by UserId ;
-- ============================================ THE END ============================================