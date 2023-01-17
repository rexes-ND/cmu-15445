-- WORKING BUT UGLY QUERY
-- SELECT p_app.name, p_app.appearance
-- FROM (SELECT p.name AS name, COUNT(*) as appearance
-- FROM people AS p, crew AS c
-- WHERE p.person_id = c.person_id
-- GROUP BY p.person_id) AS p_app
-- ORDER BY appearance DESC
-- LIMIT 20;

-- QUALITY QUERY
SELECT name, COUNT(*) as appearance
FROM people, crew
WHERE people.person_id = crew.person_id
GROUP BY people.person_id
ORDER BY appearance DESC
LIMIT 20;
