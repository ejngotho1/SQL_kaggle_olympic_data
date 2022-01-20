--Kaggle Data

Select * from [dbo].[athlete_events]   -- Select count(1) FROM [dbo].[athlete_events]
Select * From [dbo].[noc_regions]

--1. How many olympic games have been held?

Select COUNT(distinct Games) num_games
From [dbo].[athlete_events]
--or--
Select distinct games
From [dbo].[athlete_events]
order by Games
----------------------------------------------------------------------------
--2. List all Olympic games held so far

Select distinct games
From athlete_events
----------------------------------------------------------------------
--3. What is the total number of nations that have participated in each olympic games

Select games, COUNT(country) cnt
From
(
Select distinct games,n.region as Country
From [dbo].[athlete_events] e
join [dbo].[noc_regions] n on e.NOC = n.NOC
--where Games like '2004%'
)sub
Group by Games
Order by Games
-----------------------------------------------------------------------------------------------
--4. Which year saw the highest and the lowest countries participating in Olympics?
;with cte
as (
Select YEAR, Cnt, ROW_NUMBER() over(Order by Cnt desc) as rnk
From
(
	Select YEAR, COUNT(Country) as Cnt
	From
	(
		Select distinct year, n.region as Country
		From [dbo].[athlete_events] e
		join [dbo].[noc_regions] n on e.NOC = n.NOC
		--Order by Cnt desc
	)sub
	Group by YEAR
)sub
)
Select YEAR, cnt from cte where rnk = 1 or rnk = 35
--------ALT-------
      with all_countries as
              (select games, n.region as country
              from [dbo].[athlete_events] oh
              join  [dbo].[noc_regions] n ON n.noc=oh.noc
              group by games, n.region),
          tot_countries as
              (select games, count(*) as total_countries
              from all_countries
              group by games)
      select distinct
      concat(first_value(games) over(order by total_countries)
      , ' - '
      , first_value(total_countries) over(order by total_countries)) as Lowest_Countries,

      concat(first_value(games) over(order by total_countries desc)
      , ' - '
      , first_value(total_countries) over(order by total_countries desc)) as Highest_Countries
      from tot_countries
      order by 1;
------------------------------------------------------------------------------
--5. Which nation has participated in all of the olympic games
      with tot_games as
              (select count(distinct games) as total_games
              from [dbo].[athlete_events]
			  where Games like '%summer' or Games like '%winter'),
          countries as
              (select games, n.region as country
              from [dbo].[athlete_events] e
              join [dbo].[noc_regions] n ON n.noc=e.noc
              group by games, n.region),
          countries_participated as
              (select country, count(1) as total_participated_games
              from countries
              group by country) --select * from countries_participated
      select cp.*
      from countries_participated cp
      join tot_games tg on tg.total_games = cp.total_participated_games
      order by 1
--------------------------------------------------------------------------------------------
--6. Identify the sport which was played in all summer olympics.
--Select * From [dbo].[athlete_events]


With t1 as
    (Select COUNT(distinct Games) as total_sport_cnt
	 From [dbo].[athlete_events]
	 Where Season = 'summer' ),
	 
t2 as
	 (Select distinct games,sport
	  from [dbo].[athlete_events]
	  Where Season = 'summer' ),

t3 as
	  (Select Sport, COUNT(1) as sports_in_games
	   From t2
	   Group by Sport) --select * from t3
Select *
From t3 Join t1
on t3.sports_in_games = t1.total_sport_cnt
-----------------------------------------------------------------------------------------
--7. Which Sports were just played only once in the olympics.
      with t1 as
          	(select distinct games, sport
          	from [dbo].[athlete_events]
			where Games like '%Summer' or Games like '%Winter'),
          t2 as
          	(select sport, count(1) as no_of_games  --------or Count(Sport)
          	from t1
          	group by sport)
      select t2.*, t1.games
      from t2
      join t1 on t1.sport = t2.sport
      where t2.no_of_games = 1
      order by t1.sport;
---------------------------------------------------------------------------------------------
--8. Fetch the total no of sports played in each olympic games.
with t1 as (
	Select distinct games,Sport
	From [dbo].[athlete_events] 
	where (Games like '%Summer' or Games like '%Winter') --and Games = '1896 Summer'
	--Order by Games
	),
t2 as
   (Select Games, COUNT(1) as no_of_sports
    From t1
	group by Games
	) 
	select * from t2 order by Games
--------------------------------------------------------------------------------------------
--9.  Fetch oldest athletes to win a gold medal
--Select * From [dbo].[athlete_events]

Select top 1 Name, Age, Medal, Games, Sport
From [dbo].[athlete_events]
Where Medal = 'Gold' and Age != 'NA'
Order by Age desc
--------------------------------------------------------------------------------------------
--10. Find the Ratio of male to female athletes participated in all olympic games.
--need total male to total female
--then divide male by female
with t1 as (
	Select COUNT(distinct Name) M_cnt
	From [dbo].[athlete_events]
	Where Sex = 'M'),
t2 as (
	Select COUNT(distinct Name) F_cnt
	From [dbo].[athlete_events]
	Where Sex = 'F'),
t3 as (
    Select cast(M_cnt/F_cnt as float) as ratio
	From t1 , t2 )
Select concat(1, ':', ratio) 
From t3
---------------------------------------------------------------------------------









