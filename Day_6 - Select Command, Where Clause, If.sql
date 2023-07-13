# DQL (Data Query Language)
# DML (Data Manipulation Language)
# DDL (Data Definition Language)
# TCL (Transaction Control Language)
# DCL (Data Control Language)

# Select
# from
# where
# Group by
# Having
# Order by
# Limit

# Select command is used to read data from your table
# Where clause is used to filter the data

# <,>,<=,>=,<>,!=,or,and,between,in,not in,like,not like,is null,is not null,regexp,not regexp,exists,not exists

Select *
from movies.film ;

Select
Title,BoxOfficeDollars,RunTimeMinutes,OscarWins
from movies.film ;

Select
Title,BoxofficeDollars
from movies.film
Where BoxofficeDollars > 1e9 ;

Select
Title,BoxofficeDollars
from movies.film
Where OscarWins >=5 ;

Select
Title,BoxofficeDollars,OscarWins
from movies.film
where BoxOfficeDollars > 1e9 and OscarWins > 0 ;

Select
Title,CertificateId
from movies.film
Where CertificateID = 1 or CertificateID = 2 ;

Select
Title,CertificateId
from movies.film
Where CertificateID in (1,2) ;

# 1. Display the list of hit films which won oscars also

Select
Title,BoxOfficeDollars,BudgetDollars,OscarWins
from movies.film 
where BoxofficeDollars > BudgetDollars and OscarWins > 0 ;

# 2. Display the list of films with boxofficedollars > 1e9 and oscars > 0 and certificateid 1,2

Select
Title,BoxofficeDollars,BudgetDollars,OscarWins,CertificateId
from movies.film
Where BoxofficeDollars > 1e9 and OscarWins >0 and CertificateId in (1,2) ;

Select
Title,BoxofficeDollars,BudgetDollars,OscarWins,CertificateId
from movies.film
Where BoxofficeDollars > 1e9 and OscarWins >0 and (CertificateId = 1 or CertificateId = 2) ;

# 3. Display the list of films which has either won oscars or made boxoffice collection more than 1e9

Select
Title,BoxofficeDollars,OscarWins
from movies.film
Where BoxOfficeDollars > 1e9 or OscarWins >0 ;

# 4. Display the list of all films except with certificateid 1,2 and oscarwins >0

Select
Title,BoxofficeDollars,OscarWins
from movies.film
Where CertificateId not in (1,2) and OscarWins >0 ;

Select
Title,RunTimeMinutes
from movies.film
Where RunTimeMinutes >= 200 and RunTimeMinutes <= 260 ;

Select
Title,RunTimeMinutes
from movies.film
Where RunTimeMinutes between 180 and  260 ;

# Like operator (to match patterns, its like contains filter in excel)

# % (Zero or any number of  characters)
# _ (Single character)

Select
Title
from movies.film
Where Title like '%Star%' ;

Select
Title
from movies.film
Where Title like '%Star%' or Title like '%King%' or Title like '%Die%' ;

Select
Title
from movies.film
Where Title like 'Star%' ;

Select
Title
from movies.film
Where Title not like '%Star%' ;

Select
Title
from movies.film
where Title like '_a%' ;

Select
Title
from movies.film
where Title like '__a%' ;

Select
Title,ReleaseDate
from movies.film
where ReleaseDate > '2000-1-1' ;

# 1. Use IPL, Display the list of players with word singh in their name and born after 1980

Select
Player_Name,Dob
from ipl.Player
Where Player_Name like '%Singh%' and Dob >= '1980-1-1' ;

# 2. Display the list of films with exactly four characters in the title

Select
Title
from movies.film
Where Title like '____' ;

# 3. Display the list of films which is second part of that movie series

Select
Title
from movies.film 
Where Title like '% 2%' or (Title like '% II%' and Title not like '% III%') ;

# 4. Use Employees Database,display the list of non full time employees hired between 2000-1-1 to 2000-12-31 with Salary more than 80000

Select
First,Last,Status,HireDate,Salary
from employees.employees
Where Status != 'Full Time' and HireDate between '2000-1-1' and '2000-12-31' and Salary > 80000 ;

# 5. Display the list of films not containing the words star,king,die

Select
Title
from movies.film
where Title not like '%Star%' and Title not like '%King%' and Title not like '%Die%' ;

# 6. Display the list of films starting with E and ending with E

Select
Title
from movies.film
Where Title like 'E%E' ;

# 7. Display the list of films starting with C or H but end with od

Select
Title
from movies.film
where Title like 'C%od' or Title like 'H%od' ;

Select
Title
from movies.film
where (Title like 'C%' or Title like 'H%') and Title like '%od' ;

# 8. Display the list of all full time employees and only those contract employees with Jobrating 1

Select
First,Last,Status,Jobrating
from employees.employees
Where Status = 'Full Time' or (Status = 'Contract' and Jobrating = 1) ;

Select
First,Last,Status
from employees.employees
Where Status in ('Full Time','Contract') ;

Select
First,Last,Status
from employees.employees
Where Department like '%Time%' or Status like '%H%' ;

# ======================================================== THE END ========================================================