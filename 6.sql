-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'

-- 2
SELECT id,stadium,team1,team2
  FROM game WHERE id = 1012

-- 3
SELECT player, teamid, stadium, mdate
FROM goal JOIN game ON (id=matchid)
WHERE teamid = 'GER'

-- 4
SELECT team1, team2, player FROM goal
JOIN game on id=matchid
WHERE player LIKE 'Mario%'

-- 5
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam on teamid=id 
WHERE gtime<=10

-- 6
SELECT mdate, teamname FROM game
JOIN eteam ON team1=eteam.id
WHERE eteam.coach = 'Fernando Santos'

-- 7
SELECT player FROM goal
JOIN game ON matchid = id
WHERE stadium = 'National Stadium, Warsaw'

-- 8
SELECT DISTINCT player
FROM goal 
JOIN game ON matchid = id 
WHERE teamid != 'GER' AND (team1 = 'GER' OR team2 = 'GER');

-- 9
SELECT teamname, COUNT(*) FROM goal
JOIN eteam ON id=teamid
GROUP BY teamname;

-- 10
SELECT stadium, COUNT(*) FROM goal
JOIN game on id=matchid
GROUP BY stadium

-- 11
SELECT matchid, mdate, COUNT(*) FROM goal
JOIN game ON matchid=id
WHERE team1 = 'POL' OR team2 = 'POL'
GROUP BY matchid

-- 12
SELECT matchid, mdate, COUNT(teamid) FROM goal
JOIN game on matchid=id
WHERE teamid='GER'
GROUP BY matchid

-- 13
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1, team2, 
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2
  FROM game LEFT JOIN goal ON id = matchid
GROUP BY id
ORDER BY mdate, matchid, team1, team2
