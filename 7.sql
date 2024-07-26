-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
SELECT yr FROM movie WHERE title = 'Citizen Kane'

-- 3
SELECT id, title, yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- 4
SELECT id FROM actor WHERE name = 'Glenn Close'

-- 5
SELECT id FROM movie WHERE title = 'Casablanca'

-- 6
SELECT name FROM casting 
JOIN actor ON id=actorid
WHERE movieid=11768

-- 7
SELECT name FROM casting 
JOIN actor ON actor.id=actorid
JOIN movie ON movie.id=movieid
WHERE title = 'Alien'

-- 8
SELECT title FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE actor.name = 'Harrison Ford'

-- 9
SELECT title FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE actor.name = 'Harrison Ford' AND casting.ord != 1

-- 10
SELECT movie.title, actor.name FROM movie
JOIN casting ON movieid = movie.id
JOIN actor ON actorid = actor.id
WHERE movie.yr = 1962 AND casting.ord = 1 

-- 11
SELECT yr, COUNT(title) FROM movie
JOIN casting on casting.movieid = movie.id
JOIN actor on casting.actorid = actor.id
WHERE actor.name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12
SELECT movie.title, actor.name FROM movie
JOIN casting ON casting.movieid=movie.id
JOIN actor ON casting.actorid=actor.id
WHERE movie.id IN (SELECT movieid FROM casting JOIN actor on actorid=actor.id WHERE actor.name = 'Julie Andrews') AND ord=1;

-- 13
SELECT actor.name FROM actor
JOIN casting ON casting.actorid=actor.id
WHERE casting.ord = 1
GROUP BY actor.id
HAVING COUNT(*) >= 15
ORDER BY actor.name

-- 14
SELECT DISTINCT movie.title, COUNT(actorid) FROM casting
JOIN movie on casting.movieid=movie.id
WHERE yr = 1978
GROUP BY movieid
ORDER BY COUNT(actorid) DESC, movie.title

-- 15
SELECT DISTINCT actor.name FROM actor
JOIN casting ON casting.actorid=actor.id
WHERE movieid IN(SELECT movieid FROM casting JOIN actor ON actorid=actor.id WHERE actor.name = 'Art Garfunkel') AND actor.name != 'Art Garfunkel'
