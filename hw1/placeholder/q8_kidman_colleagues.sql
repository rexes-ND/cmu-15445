SELECT DISTINCT name
FROM people, crew
WHERE 
title_id in (
    SELECT title_id
    FROM people, crew
    WHERE name = 'Nicole Kidman' AND born = 1967 AND people.person_id = crew.person_id
) AND people.person_id = crew.person_id AND (category = 'actor' OR category = 'actress')
ORDER BY name
