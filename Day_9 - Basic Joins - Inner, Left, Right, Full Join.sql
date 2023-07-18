# Inner join
# Left join
# Right Join
# Full Join
# Cross Join

Create database HR ;
Use HR ;

Create table hr.employees(
EmployeeId int primary key AUTO_INCREMENT,
Employee varchar(500),
GenderId int,
DepartmentId int,
CityId int,
HireDate datetime,
Phone char(10),
Email varchar(500),
Salary double 
) ;

Create table hr.Gender(
GenderId int primary key auto_increment,
Gender varchar(500)
) ;

Create table hr.City(
CityId int primary key auto_increment,
City varchar(500)
) ;

Create table hr.Department(
DepartmentId int primary key auto_increment,
Department varchar(500)
) ;

Alter table hr.employees
add constraint Fk_Employees_GenderId
Foreign key(GenderId) REFERENCES Gender(GenderId) ;

Alter table hr.employees
add constraint Fk_Employees_CityId
Foreign key(CityId) REFERENCES City(CityId);

Alter table hr.employees
add constraint Fk_Employees_DepartmentId
Foreign key(DepartmentId) REFERENCES Department(DepartmentId);

# Make Phone and email columns unique by creating constraint

Alter table hr.employees
add constraint UK_Employees_Phone
Unique(Phone) ;

Alter table hr.employees
add constraint UK_Employees_Email
Unique(Email) ;

# Ensure that phonenumber will take 10 characters only (no alphabets)

Alter table hr.employees
add constraint Ck_Employees_Phone
Check(Length(Phone) = 10 and Phone not regexp '[A-Z]');

# Email should have @ and gmail.com 

Alter table hr.employees
add constraint Ck_Employees_Email
Check(Email like '%@gmail.com');

Alter table hr.employees
drop constraint Ck_Employees_Email ;
-- ----------------------------------------------------------------------------------------------

# Create database by name APP

Create database App ;
Use App ;

# Create table Users (UserId,UserName,LoginId(text),Password,Email,CountryId,PlanId,Rating)

Create table App.Users(
UserId int primary key auto_increment,
UserName varchar(500),
LoginId char(6),
Password varchar(100),
Email varchar(500),
CountryId int,
PlanId int,
Rating int
) ;

# Create table Plan (PlanId,Plan)

Create table App.Plan(PlanId int primary key auto_increment, Plan varchar(100)) ;

Alter table app.Plan
modify column Plan char(1);

# Create table Country(CountryId,Country,RegionId)

Create table App.Country(CountryId int primary key auto_increment, Country varchar(100), RegionId int) ;

# Create table Region (RegionId,Region)

Create table App.Region(RegionId int primary key auto_increment, Region varchar(500));

# Fk - CountryId,PlanId .. RegionId in Country

Alter table App.Users
add constraint Fk_Users_PlanId
foreign key(PlanId) references Plan(PlanId) ;

Alter table App.Users
add constraint Fk_Users_CountryId
foreign key(CountryId) references Country(CountryId) ;

Alter table App.Country
add constraint Fk_Country_RegionId
foreign key(RegionId) references Region(RegionId) ;

# Unique - LoginId,Password,Email

Alter table App.Users
add constraint Uk_Users_LoginId
unique(LoginId) ;

Alter table App.Users
add constraint Uk_Users_Password
unique(Password) ;

Alter table App.Users
add constraint Uk_Users_Email
unique(Email) ;

# Plan in plan table should have values A - D

ALTER table App.Plan
add constraint Ck_Plan_Plan
check(Plan regexp '[A-D]') ;

# Password should be having min length 6 chars and contain atleast one number, one text and one special character

Alter table App.Users
add constraint Ck_Users_Password
check(Length(Password) >= 6 and Password regexp '[0-9]' and Password regexp '[A-Z]' and 
(Password regexp '[~!@#%&*()_+\/]' or Password like '%$%' or Password like '%^%' or Password like '%-%')) ;

# LoginId should be six characters exactly, first 3 characters should be numbers, last three characters should be text

Alter table app.Users
add constraint Ck_LoginId
check(Length(LoginId) = 6 and LoginId regexp '^[0-9]{3}[A-Z]{3}$') ;

Alter table app.Users
drop constraint Ck_LoginId ;

# Rating should be 1-5 only

Alter table app.Users
add constraint Ck_Users_Rating
check(Rating between 1 and 5) ;
-- ----------------------------------------------------------------------------------------------

# Insert data into all tables and check whether constraints are working

# Inserting data

Insert into Region(Region)
Values('SouthWest');

INSERT INTO Region VALUES
(DEFAULT, 'East'),
(DEFAULT, 'West'),
(DEFAULT, 'North'),
(DEFAULT, 'South');

SELECT * FROM region ;

INSERT INTO country VALUES 
(DEFAULT, 'India', 1), 
(DEFAULT, 'Germany', 3), 
(DEFAULT, 'Australia', 4), 
(DEFAULT, 'USA', 2), 
(DEFAULT, 'Israel', 3), 
(DEFAULT, 'France', 2), 
(DEFAULT, 'Antarctica', 4);

SELECT * FROM country ;

INSERT INTO Plan VALUES
(DEFAULT, 'A'), 
(DEFAULT, 'B'), 
(DEFAULT, 'C'), 
(DEFAULT, 'D');

SELECT * FROM plan ;

INSERT INTO users VALUES
(DEFAULT, 'Hitesh', '111aaa', '1#Hite', 'Hitesh@exe.com', 1, 1, 5),
(DEFAULT, 'Krishna Nadar', '112aaa', '1#Kris', 'Krishna@exe.com', 2, 4, 4), 
(DEFAULT, 'Alen XP', '113aaa', '1#Alen', 'Alen@exe.com', 4, 2, 5), 
(DEFAULT, 'John Cartwell', '114aaa', '1#John', 'John@exe.com', 5, 2, 2) ;

SELECT * FROM users ;

# Inserting wrong values for loginid

INSERT INTO users VALUES
(DEFAULT, 'Grobler', 'aaa111', '1#Grob', 'Grobler@exe.com', 1, 1, 5) ;

# Inserting wrong values for Plan

INSERT INTO Plan VALUES 
(DEFAULT, 'Z') ;

# Inserting wrong values for Password

INSERT INTO users VALUES
(DEFAULT, 'Krishna Nadar', '112aaa', 'Krish1', 'Krishna@exe.com', 2, 4, 4) ;

# Update query to modify data

Create table movies.filmcopy as
Select *
from movies.film ;

Create table employees.empcopy as
Select *
from employees.employees ;

Create table movies.filmblank as
Select *
from movies.film 
where 1 = 2 ;
-- ============================================ THE END ============================================