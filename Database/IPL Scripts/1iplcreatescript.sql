 Create database IPL ;
 
 Use IPL ;

CREATE TABLE Country(
	Country_Id int Primary key NOT NULL,
	Country_Name varchar(200) NOT NULL
    ) ;
    
CREATE TABLE City(
	City_Id int Primary key NOT NULL,
	City_Name varchar(200) NOT NULL,
	Country_id int NULL
);

ALTER TABLE City  ADD FOREIGN KEY(Country_id)
REFERENCES Country (Country_Id);  

CREATE TABLE Venue(
	Venue_Id int Primary key NOT NULL,
	Venue_Name varchar(450) NOT NULL,
	City_Id int NULL
);

ALTER TABLE Venue  ADD  CONSTRAINT FK_city5 FOREIGN KEY(City_Id)
REFERENCES City (City_Id);

CREATE TABLE Team(
	Team_Id int primary key NOT NULL,
	Team_Name varchar(450) NOT NULL
);

CREATE TABLE Batting_Style(
	Batting_Id int primary key NOT NULL,
	Batting_hand varchar(200) NOT NULL
);

CREATE TABLE Bowling_Style(
	Bowling_Id int primary key NOT NULL,
	Bowling_skill varchar(200) NOT NULL
);

CREATE TABLE Outcome(
	Outcome_Id int primary key NOT NULL,
	Outcome_Type varchar(200) NOT NULL
);


CREATE TABLE Out_Type(
	Out_Id int  primary key NOT NULL,
	Out_Name varchar(250) NOT NULL
);

CREATE TABLE Player(
	Player_Id int primary key NOT NULL,
	Player_Name varchar(400) NOT NULL,
	DOB date NULL,
	Batting_hand int NOT NULL,
	Bowling_skill int NULL,
	Country_Name int NOT NULL
);

ALTER TABLE Player ADD  CONSTRAINT fk_Batting FOREIGN KEY(Batting_hand)
REFERENCES Batting_Style (Batting_Id);

ALTER TABLE Player  ADD  CONSTRAINT fk_Bowling FOREIGN KEY(Bowling_skill)
REFERENCES Bowling_Style (Bowling_Id);

ALTER TABLE Player  ADD  CONSTRAINT fk_countrry FOREIGN KEY(Country_Name)
REFERENCES Country (Country_Id);

CREATE TABLE Rolee(
	Role_Id int  primary key NOT NULL,
	Role_Desc varchar(150) NOT NULL
);


CREATE TABLE Season(
	Season_Id int primary key NOT NULL,
	Man_of_the_Series int NOT NULL,
	Orange_Cap int NOT NULL,
	Purple_Cap int NOT NULL,
	Season_Year int NULL
 );

ALTER TABLE Season  ADD  CONSTRAINT FK_manofseries FOREIGN KEY(Man_of_the_Series)
REFERENCES Player (Player_Id);

ALTER TABLE Season  ADD  CONSTRAINT FK_orange FOREIGN KEY(Orange_Cap)
REFERENCES Player (Player_Id);

ALTER TABLE Season  ADD  CONSTRAINT FK_Purple FOREIGN KEY(Purple_Cap)
REFERENCES Player (Player_Id);


CREATE TABLE Umpire(
	Umpire_Id int primary key NOT NULL,
	Umpire_Name varchar(350) NOT NULL,
	Umpire_Country int NOT NULL
);

ALTER TABLE Umpire  ADD  CONSTRAINT fk_country FOREIGN KEY(Umpire_Country)
REFERENCES Country (Country_Id);

CREATE TABLE Win_By(
	Win_Id int primary key NOT NULL,
	Win_Type varchar(200) NOT NULL
);

CREATE TABLE Toss_Decision(
	Toss_Id int NOT NULL,
	Toss_Name varchar(50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	Toss_Id ASC
)
);

CREATE TABLE ipl.Match(
	Match_Id bigint primary key NOT NULL,
	Team_1 int NOT NULL,
	Team_2 int NOT NULL,
	Match_Date date NOT NULL,
	Season_Id int NOT NULL,
	Venue_Id int NOT NULL,
	Toss_Winner int NOT NULL,
	Toss_Decide int NOT NULL,
	Win_Type int NOT NULL,
	Win_Margin int NULL,
	Outcome_type int NOT NULL,
	Match_Winner int NULL,
	Man_of_the_Match int NULL
 );

ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_decision FOREIGN KEY(Toss_Decide)
REFERENCES Toss_Decision (Toss_Id);

ALTER TABLE ipl.Match  ADD  CONSTRAINT FK_manofmatch FOREIGN KEY(Man_of_the_Match)
REFERENCES Player (Player_Id);


ALTER TABLE ipl.Match ADD  CONSTRAINT fk_outcome FOREIGN KEY(Outcome_type)
REFERENCES Outcome (Outcome_Id);


ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_seasonn FOREIGN KEY(Season_Id)
REFERENCES Season (Season_Id);

ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_team1 FOREIGN KEY(Team_1)
REFERENCES Team (Team_Id);


ALTER TABLE ipl.Match ADD  CONSTRAINT fk_team2 FOREIGN KEY(Team_2)
REFERENCES Team (Team_Id);

ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_venue FOREIGN KEY(Venue_Id)
REFERENCES Venue (Venue_Id);

ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_Winner FOREIGN KEY(Match_Winner)
REFERENCES Team (Team_Id);

ALTER TABLE ipl.Match ADD  CONSTRAINT fk_winner2 FOREIGN KEY(Toss_Winner)
REFERENCES Team (Team_Id);


ALTER TABLE ipl.Match  ADD  CONSTRAINT fk_wintype FOREIGN KEY(Win_Type)
REFERENCES Win_By (Win_Id);


CREATE TABLE Ball_by_Ball(
	Match_Id bigint NOT NULL,
	Over_Id int NOT NULL,
	Ball_Id int NOT NULL,
	Innings_No int NOT NULL,
	Team_Batting int NOT NULL,
	Team_Bowling int NOT NULL,
	Striker_Batting_Position int NOT NULL,
	Striker int NOT NULL,
	Non_Striker int NOT NULL,
	Bowler int NOT NULL,
PRIMARY KEY(Match_Id ,Over_Id ,Ball_Id ,Innings_No)
);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_bowler FOREIGN KEY(Bowler)
REFERENCES Player (Player_Id);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_match1 FOREIGN KEY(Match_Id)
REFERENCES ipl.Match (Match_Id);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_nonstriker FOREIGN KEY(Non_Striker)
REFERENCES Player (Player_Id);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_striker FOREIGN KEY(Striker)
REFERENCES Player (Player_Id);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_team3 FOREIGN KEY(Team_Batting)
REFERENCES Team (Team_Id);

ALTER TABLE Ball_by_Ball  ADD  CONSTRAINT fk_team4 FOREIGN KEY(Team_Bowling)
REFERENCES Team (Team_Id);

CREATE TABLE Batsman_Scored(
	Match_Id bigint NOT NULL,
	Over_Id int NOT NULL,
	Ball_Id int NOT NULL,
	Runs_Scored int NOT NULL,
	Innings_No int NOT NULL,
 CONSTRAINT Batsmansco_pk PRIMARY KEY CLUSTERED 
(
	Match_Id ASC,
	Over_Id ASC,
    
	Ball_Id ASC,
	Innings_No ASC
)
);

ALTER TABLE Batsman_Scored  ADD  CONSTRAINT FK_Matchh_Ba FOREIGN KEY(Match_Id, Over_Id, Ball_Id, Innings_No)
REFERENCES Ball_by_Ball (Match_Id, Over_Id, Ball_Id, Innings_No);


CREATE TABLE Player_Match(
	Match_Id bigint NOT NULL,
	Player_Id int NOT NULL,
	Role_Id int NOT NULL,
	Team_Id int NULL,
 CONSTRAINT PK__Player_M__D7D79797ED630FCB PRIMARY KEY CLUSTERED 
(
	Match_Id ASC,
	Player_Id ASC
));

ALTER TABLE Player_Match   ADD  CONSTRAINT FK_matchhh FOREIGN KEY(Match_Id)
REFERENCES ipl.Match (Match_Id);

ALTER TABLE Player_Match  ADD  CONSTRAINT FK_PlayerMatch FOREIGN KEY(Team_Id)
REFERENCES Team (Team_Id);

ALTER TABLE Player_Match  ADD  CONSTRAINT FK_playerrr FOREIGN KEY(Player_Id)
REFERENCES Player (Player_Id);

ALTER TABLE Player_Match  ADD  CONSTRAINT fk_role1 FOREIGN KEY(Role_Id)
REFERENCES Rolee (Role_Id);

CREATE TABLE Extra_Type(
	Extra_Id int NOT NULL,
	Extra_Name varchar(150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	Extra_Id ASC
));


CREATE TABLE Extra_Runs(
	Match_Id bigint NOT NULL,
	Over_Id int NOT NULL,
	Ball_Id int NOT NULL,
	Extra_Type_Id int NOT NULL,
	Extra_Runs int NOT NULL,
	Innings_No int NOT NULL,
 CONSTRAINT ExtraRuns_pk PRIMARY KEY CLUSTERED 
(
	Match_Id ASC,
	Over_Id ASC,
	Ball_Id ASC,
	Innings_No ASC
));

ALTER TABLE Extra_Runs  ADD  CONSTRAINT fk_extra1 FOREIGN KEY(Extra_Type_Id)
REFERENCES Extra_Type (Extra_Id);

ALTER TABLE Extra_Runs  ADD  CONSTRAINT FK_Matchh_ext FOREIGN KEY(Match_Id, Over_Id, Ball_Id, Innings_No)
REFERENCES Ball_by_Ball (Match_Id, Over_Id, Ball_Id, Innings_No);



CREATE TABLE Wicket_Taken(
	Match_Id bigint NOT NULL,
	Over_Id int NOT NULL,
	Ball_Id int NOT NULL,
	Player_Out int NOT NULL,
	Kind_Out int NOT NULL,
	Fielders int NULL,
	Innings_No int NOT NULL,
 CONSTRAINT WicketTak_pk PRIMARY KEY CLUSTERED 
(
	Match_Id ASC,
	Over_Id ASC,
	Ball_Id ASC,
	Innings_No ASC
));

ALTER TABLE Wicket_Taken  ADD  CONSTRAINT fk_field8 FOREIGN KEY(Fielders)
REFERENCES Player (Player_Id);


ALTER TABLE Wicket_Taken  ADD  CONSTRAINT fk_kind8 FOREIGN KEY(Kind_Out)
REFERENCES Out_Type (Out_Id);

ALTER TABLE Wicket_Taken  ADD  CONSTRAINT FK_Matchh_wick FOREIGN KEY(Match_Id, Over_Id, Ball_Id, Innings_No)
REFERENCES Ball_by_Ball (Match_Id, Over_Id, Ball_Id, Innings_No);

ALTER TABLE Wicket_Taken  ADD  CONSTRAINT fk_player8 FOREIGN KEY(Player_Out)
REFERENCES Player (Player_Id);











