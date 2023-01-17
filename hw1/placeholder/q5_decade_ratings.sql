-- SELECT CAST(1991/10*10 as TEXT) || 's'; 1990s
SELECT CAST(decade as TEXT) || '0s', ROUND(AVG(rating), 2) as avg_rating, MAX(rating), MIN(rating), COUNT(*)
FROM (
    SELECT premiered/10 AS decade, rating 
    FROM titles, ratings
    WHERE titles.title_id = ratings.title_id AND premiered is NOT NULL
)
GROUP BY decade
ORDER BY avg_rating DESC, decade
