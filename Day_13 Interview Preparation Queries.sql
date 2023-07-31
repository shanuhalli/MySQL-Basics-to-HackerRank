create database mocktest ;
use mocktest ;

# 1. find the number of new and repeat customers on each Order Date

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

select * from customer_orders ;

insert into customer_orders values
(1,100,cast('2022-01-01' as date),2000),
(2,200,cast('2022-01-01' as date),2500),
(3,300,cast('2022-01-01' as date),2100),
(4,100,cast('2022-01-02' as date),2000),
(5,400,cast('2022-01-02' as date),2200),
(6,500,cast('2022-01-02' as date),2700),
(7,100,cast('2022-01-03' as date),3000),
(8,400,cast('2022-01-03' as date),1000),
(9,600,cast('2022-01-03' as date),3000);

-- Solution --
with orders as
(
Select
customer_Id,
order_date,
min(order_date) over (partition by customer_id) as first_order_date
from customer_orders 
)
Select
Order_date,
sum(case when order_Date = first_order_Date then 1 else 0 end) as Newcustomers,
sum(case when order_Date !=  first_order_Date then 1 else 0 end) as Repeatcustomers
from orders 
Group by Order_date ;

# 2. Display the name, floor, most visited floor and resoruces used 

create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10)) ;

insert into entries values
('A','Bangalore','A@gmail.com',1,'CPU'),
('A','Bangalore','A1@gmail.com',1,'CPU'),
('A','Bangalore','A2@gmail.com',2,'DESKTOP'),
('B','Bangalore','B@gmail.com',2,'DESKTOP'),
('B','Bangalore','B1@gmail.com',2,'DESKTOP'),
('B','Bangalore','B2@gmail.com',1,'MONITOR');

-- Solution --
with mv as
(
Select 
name,
floor,
count(*) as Number_of_Visits,
Rank() over (Partition by name Order by Count(*) desc) as rk
from entries 
Group by name,floor 
)
Select *
from mv
where rk = 1 ;

# Q3. Display the list of Bowlers(Top5) who conceeded more extras in IPL

Select 
p.player_name Bowler,
Sum(extra_runs) as Total_Extras
from ipl.extra_runs e
Inner join ipl.ball_by_ball b on 
e.Match_Id = b.Match_Id and e.Over_Id = b.Over_Id and
e.Ball_Id = b.Ball_Id and e.Innings_No = b.Innings_No
Inner join ipl.player p on b.Bowler = p.Player_Id
Group by e.Match_Id
Order by Total_Extras desc
Limit 5 ;

# Q4. Display the list of most expensive overs in IPL Match Date, Teams Played, Bowler Name and TotalRuns should be in the Output

Select 
m.Match_date Date,
b.Over_Id OverId,
b.Innings_No Innings,
t.Team_Name as TeamA,
t2.Team_Name TeamB,
p.Player_Name Bowler,
Sum(Runs_Scored) Runs,
group_concat(distinct p2.player_name) Players
From ipl.ball_by_ball b
Inner join ipl.batsman_scored bs on
b.Match_Id = bs.Match_Id && b.Over_Id = bs.Over_Id &&
b.Ball_Id = bs.Ball_Id && b.Innings_No = bs.Innings_No
Inner Join ipl.player p on b.Bowler = p.Player_Id
Inner join ipl.player p2 on b.Striker = p2.Player_Id
Inner join ipl.match m on b.Match_Id = m.Match_Id
Inner join ipl.team t on m.Team_1 =  t.Team_Id
Inner join ipl.team t2 on m.Team_2 = t2.Team_Id
Group by 
Date, OverId, Innings, TeamA, TeamB, Bowler
Order by Runs desc ;

# Q5. Display the list of films which released multiple times with same title Output should be in Format
--  Title     OldReleaseDate     NewReleaseDate

with earlyfilms as
(
Select
Title,
ReleaseDate
from movies.film 
Where Year(ReleaseDate) < 2000
),
recentfilms as
(
Select
Title,
ReleaseDate
from movies.film 
Where Year(ReleaseDate) >=2000
)
Select
e.Title,
e.ReleaseDate as EarlyDate,
r.ReleaseDate as RecentDate
from earlyfilms e join recentfilms r on e.Title = r.Title ;

# Q6. Use BookStore Database,Display BookName,Prequel BookName and Sequel BookName

Create table tblbook
(BookId int,
BookName varchar(100),
SequelBookId int) ;

Insert into tblbook Values
(1,'The Fellowship of the Ring',4),
(2,'The Girl with the Draggon Tattoo',5),
(3,'The Hobbit',1),
(4,'The Two Towers',6),
(5,'The Girl who Played with Fire',10),
(7,'Harry Potter''s and the Philosopher''s Stone',8) ;

Insert into tblbook(BookId,BookName) Values
(9,'The Life of Pi'),
(8,'Harry Potter and the Prisoner of Azkabhan'),
(6,'The Return of the King'),
(10,'The Girl who Kicked the Hornet''s Nest') ;

-- Solution --
Select
b.BookName as Book,
s.Bookname as Sequel,
p.Bookname as Prequel
from tblbook b left join tblbook s on b.sequelbookid = s.bookid
left join tblbook p on b.bookid = p.sequelbookid ;

# Q7. Display the list of Products which were unsold on any given date Output should contain
-- SalesDate  ProductName  TotalQty  TotalSales

CREATE TABLE Product
(ID int,
ProductName varchar(100),
Cost Double) ;

CREATE TABLE SalesItem
(ID int,
SalesDate datetime,
ProductID int,
Qty int,
TotalSalesAmt double) ;

INSERT INTO Product VALUES 
(1,'Widget',21.99),
(2,'Thingamajig',5.38),
(3,'Watchamacallit',1.96) ;
   
INSERT INTO SalesItem VALUES 
(1,'2014-10-1',1,1,21.99),
(2,'2014-10-2',3,1,1.96),
(3,'2014-10-3',3,10,19.60),
(4,'2014-10-3',1,2,43.98),
(5,'2014-10-3',1,2,43.98) ;

-- Solution --
With sd as
(
Select distinct salesdate 
from SalesItem
),
cs as
(
Select
Salesdate,
ProductName
from sd cross join Product 
)
Select
cs.SalesDate,
cs.ProductName,
Sum(Qty) as TotalQty,
Sum(TotalSalesAmt) as TotalSales
from cs left join salesitem s on s.SalesDate = cs.SalesDate
Group by cs.SalesDate,
cs.ProductName ;