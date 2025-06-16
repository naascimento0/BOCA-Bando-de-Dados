WITH RECURSIVE asteriscos AS (
    SELECT 1 AS n
    UNION
    SELECT n + 1 FROM asteriscos WHERE n < 20
)
SELECT REPEAT('* ', n) FROM asteriscos
