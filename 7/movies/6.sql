SELECT AVG(rating)
FROM ratings
LEFT JOIN movies
ON movies.id = ratings.movie_id
WHERE year = 2012
