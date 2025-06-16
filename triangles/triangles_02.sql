WITH RECURSIVE asteriscos AS (
  SELECT 20 as n
  UNION
  SELECT n - 1 FROM asteriscos WHERE n > 1
)
SELECT REPEAT('* ', n) FROM asteriscos
