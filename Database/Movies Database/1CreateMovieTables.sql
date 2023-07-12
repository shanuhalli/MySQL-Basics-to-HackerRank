Create database if not exists Movies ;

Use Movies;

CREATE TABLE Actor(
	ActorID int NOT NULL PRIMARY KEY auto_increment,
	FirstName nvarchar(100) NOT NULL,
	FamilyName nvarchar(100) NULL,
	FullName  nvarchar(1000),
	DoB datetime NULL,
	DoD datetime NULL,
	Gender nvarchar(20) NULL);


-- table of certificates
CREATE TABLE Certificate(
	CertificateID int  NOT NULL PRIMARY KEY auto_increment,
	Certificate nvarchar(10) NOT NULL);


-- table of countries
CREATE TABLE Country(
	CountryID int NOT NULL PRIMARY KEY auto_increment,
	Country nvarchar(255) NOT NULL);

-- table of directors
CREATE TABLE Director(
	DirectorID int NOT NULL PRIMARY KEY auto_increment,
	FirstName nvarchar(100) NOT NULL,
	FamilyName nvarchar(100) NULL,
	FullName  nvarchar(1000),
	DoB datetime NULL,
	DoD datetime NULL,
	Gender nvarchar(20) NULL);

-- table of films
CREATE TABLE Film(
	FilmID int NOT NULL PRIMARY KEY auto_increment,
	Title nvarchar(255) NOT NULL,
	ReleaseDate datetime NULL,
	DirectorID int NULL,
	StudioID int NULL,
	Review nvarchar(1000) NULL,
	CountryID int NULL,
	LanguageID int NULL,
	GenreID int NULL,
	RunTimeMinutes smallint NULL,
	CertificateID int NULL,
	BudgetDollars bigint NULL,
	BoxOfficeDollars bigint NULL,
	OscarNominations tinyint NULL,
	OscarWins tinyint NULL);


-- table of genres
 CREATE TABLE Genre(
	GenreID int NOT NULL PRIMARY KEY auto_increment,
	Genre nvarchar(50) NOT NULL);

-- table of languages
CREATE TABLE Language(
	LanguageID int  NOT NULL PRIMARY KEY auto_increment,
	Language nvarchar(255) NOT NULL);



-- table of roles
CREATE TABLE Role(
	RoleID int NOT NULL PRIMARY KEY auto_increment,
	Role nvarchar(255) NULL,
	FilmID int NULL,
	ActorID int NULL);



-- table of studios
CREATE TABLE Studio(
	StudioID int NOT NULL PRIMARY KEY auto_increment,
	Studio nvarchar(255) NOT NULL)