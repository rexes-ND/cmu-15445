SELECT primary_title, premiered, runtime_minutes || ' (mins)'
FROM titles
WHERE genres LIKE '%Sci-Fi%' -- https://stackoverflow.com/questions/3498844/sqlite-string-contains-other-string-query
ORDER BY runtime_minutes DESC
LIMIT 10;
