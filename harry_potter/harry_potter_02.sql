SELECT wp.age, AVG(w.coins_needed), MAX(w.power) FROM Wands w JOIN Wands_Property wp ON w.code = wp.code WHERE wp.is_evil = 1 GROUP BY wp.age ORDER BY wp.age ASC
