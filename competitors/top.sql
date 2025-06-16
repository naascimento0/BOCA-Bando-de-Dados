WITH winners AS (
  SELECT h.hacker_id, h.name, COUNT(*) AS qtd
  FROM Hackers h
  JOIN Submissions s ON s.hacker_id = h.hacker_id
  JOIN Challenges c ON c.challenge_id = s.challenge_id
  JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
  WHERE s.score = d.score
  GROUP BY h.hacker_id, h.name
  HAVING COUNT(*) > 1
)

SELECT hacker_id, name FROM winners ORDER BY qtd DESC, hacker_id ASC


