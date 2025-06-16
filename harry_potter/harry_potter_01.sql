SELECT w.id, wp.age, w.coins_needed, w.power 
FROM Wands w 
JOIN Wands_Property wp ON w.code = wp.code 
WHERE wp.is_evil = 0 AND w.coins_needed = (SELECT MIN(coins_needed) FROM Wands 
JOIN Wands_Property ON Wands.code = Wands_Property.code WHERE is_evil = 0 AND Wands.power = w.power AND Wands_Property.age = wp.age) ORDER BY w.power DESC, wp.age DESC
