# Joins
use movies ;

# 1) Title & Genre
        
SELECT 
f.Title, g.Genre
FROM movies.film f
INNER JOIN
movies.genre g ON f.GenreID = g.GenreID ;

# 2) Title Director
        
SELECT 
f.Title, concat(d.FirstName,' ', d.FamilyName) as FullName
FROM movies.film f
INNER JOIN
movies.director d ON f.DirectorID = d.DirectorID ;

# 3) Title Country 

SELECT 
f.Title, c.Country
FROM movies.film f
INNER JOIN
movies.country c ON f.CountryID = c.CountryID ;

# 4) Title Certificate 

SELECT
f.Title, c.Certificate
FROM movies.film f 
INNER JOIN movies.certificate c ON f.CertificateID = c.CertificateID ;

# 5) Title Language 
        
SELECT 
f.Title, l.Language
FROM movies.film f
INNER JOIN
movies.language l ON f.LanguageID = l.LanguageID ;

# 6) Title, Genre, Director, Country, Certificate, Language

SELECT 
f.Title, g.Genre, d.FullName as Director, c.Country, ct.Certificate, l.language 
FROM movies.film f 
INNER JOIN 
movies.genre g ON f.genreid = g.genreid 
INNER JOIN 
movies.director d ON f.directorid = d.directorid 
INNER JOIN 
movies.country c ON f.countryid = c.countryid 
INNER JOIN 
movies.certificate ct ON f.Certificateid = ct.Certificateid 
INNER JOIN 
movies.language l ON f.languageid = l.LanguageID ;

# Update full name in Director table

SET SQL_SAFE_UPDATES = 0 ;

UPDATE movies.director
SET FullName = case
when FamilyName is null then FirstName
else concat(FirstName, ' ', FamilyName)
end ;

select * from movies.director ; 
-- ------------------------------------------------------------------------------------------

# 1. Display Director Name ,Total Oscars won by Director,Avg Boxoffice of his movies

Select
FullName,
Sum(OscarWins) as TotalOscars,
Avg(BoxOfficeDollars) as AvgBO
from movies.film f inner join movies.Director d on f.DirectorId = d.DirectorId
Group by FullName ;

# 2. Display Avg runtime of each genre films, Sort by highest avg to lowest avg

Select
Genre,
Avg(RunTimeMinutes) as AvgRunTime
from movies.film f inner join movies.Genre g on f.GenreId = g.GenreId
Group by Genre 
Order by AvgRunTime desc ;

# 3. Which Director and Studio combination has more number of films together

select 
FullName as Director, Studio, count(*) As Number_of_Films
from movies.film f
join movies.Director d on f.DirectorID = d.DirectorID
join movies.Studio s on f.StudioId = S.StudioID
group by Director, Studio
Order by Number_of_Films Desc ;

# 4. Display the age of Director when his film got released ,Directorname,Title,Age of the film 

Select
FullName as Director, Title,
timestampdiff(Year,DoB,ReleaseDate) as Age_of_Film
from movies.film f inner join movies.Director d on f.DirectorId = d.DirectorId ;

# 5. Which Director is more versatile (he should have done movies on different genres) Director, count of different genres he has directed
# Steven Speilberg | 4 | Action,Mystery,Thriller,SciFi....

Select 
FullName,
Count(Distinct g.GenreId) as GenreCount,
Group_concat(Distinct Genre) as GenreList
from movies.film f inner join movies.Director d on f.DirectorId = d.DirectorId
inner join movies.Genre g on f.GenreId = g.GenreId
Group by FullName
Order by GenreCount desc ;
-- ------------------------------------------------------------------------------------------

# 1. Display the Players with most number of man of the matches

SELECT 
p.player_name Player, COUNT(*) Man_Of_Matches 
FROM ipl.match m 
INNER JOIN 
ipl.player p ON m.Man_of_the_Match = p.Player_Id 
GROUP BY Player 
ORDER BY Man_Of_Matches DESC ;

# 2. Display the number of matches played in each Venue

Select
Venue_Name,
Count(Venue_Name) as Number_of_Matches
from ipl.match m inner join ipl.Venue v on m.Venue_Id = v.Venue_Id
Group by Venue_Name ;

# 3. Display the number of venues in each city, which city has more venues? also display venue names in comma list

Select
City_Name,
Count(*) as Number_of_Venues,
Group_concat(Venue_Name) as VenueList
from ipl.Venue v inner join ipl.City c on v.City_Id = c.City_Id
Group by City_Name
Order by Number_of_Venues desc ;

# 4. Display the Teams list along with their number of wins, Which is the most successfull team in IPL

Select
Team_Name,
Count(*) as Number_of_wins
from ipl.match m inner join ipl.Team t on m.Match_Winner = t.Team_Id
Group by Team_Name
Order by Number_of_Wins desc ;

# 5. Display the breakup of number of players from each country in IPL

Select
c.Country_Name ,
Count(Player_Name) as Number_of_Players
from ipl.player p inner join ipl.Country c on p.Country_Name = c.Country_Id
Group by c.Country_Name ;

Select
Match_Date,
t.Team_Name as Team1,
t2.Team_Name as Team2,
t3.Team_Name as MatchWinner,
t4.Team_Name as TossWinner
from ipl.match m inner join ipl.Team t on m.Team_1 = t.Team_Id
inner join ipl.Team t2 on m.Team_2 = t2.Team_Id
inner join ipl.Team t3 on m.Match_Winner = t3.Team_Id
inner join ipl.Team t4 on m.Toss_Winner = t4.Team_Id ;
-- ------------------------------------------------------------------------------------------

# 1) Display total number of matches played by each team

SELECT 
	t.Team_Name, COUNT(*) AS Match_Count 
FROM 
	ipl.match AS m 
INNER JOIN 
	ipl.team AS t ON m.team_1 = t.Team_Id OR m.Team_2 = t.Team_Id
GROUP BY 
	t.Team_Name 
ORDER BY 
	Match_Count DESC ;
    
# 2) Display the list of players who bat and bowl with different hands, also display their batting and bowling style

SELECT 
	p.player_name Player, b.Batting_hand, b2.bowling_skill 
FROM 
	ipl.player p 
INNER JOIN 
	ipl.batting_style b ON p.batting_hand = b.Batting_id 
INNER JOIN 
	ipl.bowling_style b2 ON p.Bowling_skill = b2.Bowling_Id 
WHERE 
	(b.Batting_hand REGEXP 'Right' and b2.bowling_skill REGEXP 'Left') or
	(b.Batting_hand REGEXP 'Left' and b2.bowling_skill REGEXP 'Right') ;

# 3) Display the man of the series player, Orange cap player and purple cap player of every season

SELECT 
	s.Season_Id, p.player_name Man_of_the_Series, oc.player_name Orange_Cap, ppc.player_name Purple_Cap, s.Season_Year
FROM
	ipl.season s 
INNER JOIN 
	ipl.player p ON s.man_of_the_series = p.player_id 
INNER JOIN 
	ipl.player oc ON s.orange_cap = oc.player_id 
INNER JOIN 
	ipl.player ppc ON s.purple_cap = ppc.player_id ;

# 4) Display Players who captained most number of matches 

SELECT 
	p.player_name, r.Role_Desc, COUNT(*) Total_Matches_as_Captain 
FROM
	ipl.player_match m 
INNER JOIN 
	ipl.player p ON m.Player_Id = p.Player_Id 
INNER JOIN 
	ipl.rolee r ON m.Role_Id = r.Role_Id 
WHERE 
	r.Role_Desc REGEXP 'Captain' 
GROUP BY 
	player_name, r.Role_Desc 
ORDER BY 
	Total_Matches_as_Captain DESC ;

# 5) Which Team Produced most captains, display team name and captains list

Select 
Team_Name,
Count(distinct Player_Name) as CaptainedMatches,
GROUP_CONCAT(distinct Player_Name) as CaptainList
from ipl.player_match pm 
inner join ipl.player p on pm.Player_Id = p.Player_Id
inner join ipl.rolee r on pm.role_id = r.role_id 
inner join ipl.Team t on pm.Team_Id = t.Team_Id
where Role_Desc regexp 'Captain'
Group by Team_Name
Order by CaptainedMatches desc ;

Select 
Team_Name, Player_Name, Role_Desc
from ipl.player_match pm 
inner join ipl.player p on pm.Player_Id = p.Player_Id
inner join ipl.rolee r on pm.role_id = r.role_id 
inner join ipl.Team t on pm.Team_Id = t.Team_Id
where Role_Desc regexp 'Captain' ;

# 6) Highest runscoring players in IPL

Select
Player_Name,
sum(Runs_scored) as TotalRuns
from ipl.ball_by_ball b inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and b.innings_no = bs.innings_no
and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
Group by Player_Name 
Order by TotalRuns desc ;

# 7) Highest runscoring matches in IPL Output should contain Match_date, Teams Played,Match Score

Select
Match_Date,
t.Team_Name as TeamA,
t2.Team_Name as TeamB,
Sum(Runs_Scored) as TotalRuns
from ipl.batsman_scored bs inner join ipl.match m on bs.match_id = m.match_id
inner join ipl.Team t on m.Team_1 = t.Team_Id
inner join ipl.Team t2 on m.Team_2 = t2.Team_Id
Group by Match_Date,TeamA,TeamB
Order by TotalRuns desc ;

# 8) Display the players who scored most number of sixes in IPL 

Select
Player_Name,
Count(Runs_scored) as Number_of_Sixes
from ipl.ball_by_ball b 
inner join ipl.batsman_scored bs on 
b.match_id = bs.match_id and b.over_id = bs.over_id and 
b.innings_no = bs.innings_no and b.ball_id = bs.ball_id 
inner join ipl.player p on b.striker = p.player_id
Where Runs_Scored = 6
Group by Player_Name 
Order by Number_of_Sixes desc ;
-- ================================================= THE END =================================================