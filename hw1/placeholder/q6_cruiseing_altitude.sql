-- Don't think this one is very efficient one

-- SELECT primary_title, votes
-- FROM crew, ratings, titles, people
-- WHERE crew.person_id = people.person_id 
-- AND crew.title_id = ratings.title_id
-- AND titles.title_id = crew.title_id
-- AND name LIKE '%Cruise%' AND born = 1962
-- ORDER BY votes DESC
-- LIMIT 10;

SELECT primary_title, votes
FROM (
    SELECT title_id
    FROM people, crew
    WHERE name LIKE '%Cruise%' AND born = 1962 AND people.person_id = crew.person_id
) AS cruise_titles, 
(
    SELECT titles.title_id, votes, primary_title
    FROM titles, ratings
    WHERE titles.title_id = ratings.title_id
) AS rating_titles
WHERE cruise_titles.title_id = rating_titles.title_id
ORDER BY votes DESC
LIMIT 10;
