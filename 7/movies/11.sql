SELECT title
FROM movies

LEFT JOIN ratings
ON movies.id = ratings.movie_id

LEFT JOIN stars
ON movies.id = stars.movie_id
LEFT JOIN people
ON people.id = stars.person_id

WHERE NAME = "Chadwick Boseman"

ORDER BY rating DESC

LIMIT 5
