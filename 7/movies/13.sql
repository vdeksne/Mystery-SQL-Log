SELECT DISTINCT p.name
FROM people AS p
INNER JOIN stars AS s1
ON p.id = s1.person_id

INNER JOIN movies
ON s1.movie_id = movies.id

INNER JOIN stars AS s2
ON movies.id = s2.movie_id
INNER JOIN people AS kb
ON s2.person_id = kb.id

WHERE p.name <> "Kevin Bacon"
    AND kb.name = "Kevin Bacon"
    AND kb.birth = 1958

