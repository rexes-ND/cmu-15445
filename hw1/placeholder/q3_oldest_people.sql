SELECT name, CASE WHEN died is NULL THEN strftime('%Y', DATE()) - born ELSE died - born END AS age
FROM people
WHERE born >= 1900
ORDER BY age DESC, name
LIMIT 20;
