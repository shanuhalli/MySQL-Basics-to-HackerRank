# Window Functions (Used to find Best in category values)
# Any function used with Over Clause

# Aggregate Functions (Sum,Avg,Count,Max,Min)
# Ranking Functions (Row_number,Rank,Dense_Rank)
# Analytical Functions (Lead,Lag,first_value)

Select
concat(First,' ',Last) as FullName,
Department,
Salary,
Row_number() over (Order by Salary desc) as rw
from employees.employees ;

with dmax as
(
Select
concat(First,' ',Last) as FullName,
Department,
Salary,
Row_number() over (Partition by Department Order by Salary desc) as rw
from employees.employees
)
Select FullName,Department, Salary
from dmax
where rw = 1 ;

with ds as
(
Select
concat(First,' ',Last) as FullName,
Department,
Status,
Salary,
Row_number() over (Partition by Department,Status Order by Salary desc) as rw
from employees.employees 
)
Select *
from ds
where rw = 1 ;
-- ------------------------------------------------------------------------------------------

# 1. Display the highest grossing movie of every Director along with its title

with dmax as
(
Select 
FullName,
title,
Boxofficedollars,
Row_number() over (Partition by fullname order by Boxofficedollars desc) as Rw
from movies.director d inner join movies.film f on d.directorID = f.directorID
)
Select FullName,
title,
Boxofficedollars
from dmax
where rw = 1
Order by BoxofficeDollars desc ;

# 2. Display the highest and lowest salaried employee details of each Department

with dr as
(
Select 
concat(first," ",last) as FullName,
Department,
Salary,
Row_number() over (Partition by Department order by Salary desc) as HS,
Row_number() over (Partition by Department Order by Salary asc) as LS
from employees.employees
)
Select 
FullName,
Department,
Salary
from dr
where HS = 1 or LS = 1 ;

# 3. Display the youngest player from each country in IPL

with cy as
(
Select p.player_name,
p.DOB as Youngest,
c.Country_name,
Row_number() over (Partition by Country_Name order by DOB desc) as RY
from ipl.player p inner join ipl.country c on p.country_name = c.Country_ID
)
Select *
from cy
where ry = 1 ;

# 4. Display 3 longest runtime films in every genre
with DRRTM as 
(
Select
Genre,
Title,
Runtimeminutes,
Row_number() over (Partition by Genre order by Runtimeminutes desc) as Rw
from movies.film f inner join movies.genre g on f.genreID = g.GenreID
)
Select * from DRRTM Where Rw <=3 ;

# 5. Display Top 3 highest runscoring players from every country in IPL

with nt as
(
Select
Player_Name,
c.Country_Name ,
Sum(Runs_scored) as TotalRuns,
Row_number() over (PARTITION BY c.Country_Name Order by Sum(Runs_Scored) desc) as rw
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and 
b.innings_no = bs.innings_no and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
inner join ipl.Country c on p.Country_Name = c.Country_Id
Group by Player_Name,c.Country_Name
) 
Select *
from nt
where rw <=3 ;
# PlayerName, TotalRuns, CountryName
-- ================================================= THE END =================================================