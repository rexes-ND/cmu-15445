-- SELECT name, ROUND(AVG(rating), 2)
-- FROM (
--     SELECT person_id, name
--     FROM people
--     WHERE born = 1955
-- ) as people1955,
-- (
--     SELECT person_id, rating
--     FROM crew, ratings
--     WHERE crew.title_id = ratings.title_id
-- ) as people_ratings
-- WHERE people1955.person_id = people_ratings.person_id
-- GROUP BY people1955.person_id
SELECT name, avg_rating
FROM (
    SELECT name, avg_rating, NTILE(10) OVER (
        ORDER BY avg_rating
    ) as p
    FROM (
        SELECT name, ROUND(AVG(rating), 2) as avg_rating
        FROM (
            SELECT person_id, name
            FROM people
            WHERE born = 1955
        ) AS people_1955, crew, ratings, titles
        WHERE
        people_1955.person_id = crew.person_id AND
        crew.title_id = ratings.title_id AND crew.title_id = titles.title_id AND
        titles.type = 'movie'
        GROUP BY name
    )
)
WHERE p = 9
ORDER BY avg_rating DESC, name
