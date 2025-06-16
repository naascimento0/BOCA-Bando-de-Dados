WITH DesafiosCount AS (
  SELECT h.hacker_id, h.name, COUNT(c.challenge_id) as qtd
  FROM Hackers h
  JOIN Challenges c ON c.hacker_id = h.hacker_id
  GROUP BY h.hacker_id, h.name
),
MaxDesafios AS (
  SELECT MAX(qtd) AS max_qtd
  FROM DesafiosCount
)

SELECT dc.hacker_id, dc.name, dc.qtd 
FROM DesafiosCount dc
JOIN MaxDesafios md ON dc.qtd = md.max_qtd OR 
(dc.qtd < md.max_qtd AND dc.qtd NOT IN (
  SELECT qtd FROM DesafiosCount GROUP BY qtd HAVING COUNT(*) > 1 AND qtd < md.max_qtd
))
ORDER BY dc.qtd DESC, dc.hacker_id ASC
