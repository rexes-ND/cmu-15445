-- SELECT DISTINCT type
-- FROM titles

-- tvSeries

-- WITH cteName AS (
--     SELECT 1
-- )
-- SELECT * FROM cteName;

-- WITH cteName (col1, col2) AS (
--     SELECT 1, 2
--     UNION ALL
--     SELECT 3, 4
--     UNION ALL
--     SELECT 5, 6
-- )
-- SELECT col1 + col2 FROM cteName;

-- WITH cte1 (col1) AS (SELECT 1), cte2 (col2) AS (SELECT 2)
-- SELECT * FROM cte1, cte2;

-- SELECT primary_title
-- FROM titles
-- WHERE type = 'tvSeries'
-- AND primary_title = 'House of the Dragon'

WITH 
hotd AS (
    SELECT DISTINCT title
    FROM titles, akas
    WHERE titles.title_id = akas.title_id
    AND primary_title = 'House of the Dragon'
    AND type = 'tvSeries'
    ORDER BY title
),
hotd_row AS (
    SELECT title, ROW_NUMBER() OVER (ORDER BY title) AS rown
    FROM hotd
),
c AS (
    SELECT COUNT(*)
    FROM hotd_row
),
cteSource (title, ctr) AS (
    
    SELECT title, rown AS ctr
    FROM hotd_row
    WHERE rown = 1

    UNION ALL
    
    SELECT cteSource.title || ', ' || hotd_row.title, ctr + 1
    FROM hotd_row, cteSource
    WHERE ctr < (
        SELECT *
        FROM c
    ) AND rown = ctr + 1
    
)
SELECT title
FROM cteSource
WHERE ctr = (
    SELECT *
    FROM c
);
-- SELECT title, rown
-- FROM hotd_row
-- WHERE rown = (
--     SELECT *
--     FROM c
-- )
