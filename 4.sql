-- 1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2
SELECT name FROM world
WHERE continent = 'Europe'
AND gdp / population > 
(SELECT gdp/population 
FROM world 
WHERE name = 'United Kingdom')

-- 3
SELECT name, continent FROM world
WHERE continent IN(
(SELECT continent FROM world WHERE name = 'Argentina'),
(SELECT continent FROM world WHERE name = 'Australia')
)
ORDER BY name

-- 4
SELECT name, population FROM world
WHERE population >
(SELECT population FROM world WHERE name = 'United Kingdom') 
AND population <
(SELECT population FROM world WHERE name = 'Germany') 

-- 5
SELECT name, 
CONCAT(ROUND((population * 100) / (SELECT population FROM world WHERE name = 'Germany') ), '%') AS percentage 
FROM world
WHERE continent = 'Europe';

-- 6
SELECT name FROM world
WHERE gdp > 
ALL(SELECT gdp FROM world WHERE gdp IS NOT NULL AND continent = 'Europe');

-- 7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- 8
SELECT continent, name FROM world x
WHERE name = (SELECT name FROM world y WHERE y.continent = x.continent ORDER BY name LIMIT 1)

-- 9
SELECT continent, name FROM world x
WHERE (SELECT MIN(population) FROM world y WHERE y.continent = x.continent) >= 250000000 

-- 10
SELECT name, continent FROM world x
WHERE population > ALL(
SELECT population * 3 as three_times FROM world y WHERE y.continent = x.continent AND y.name != x.name)
