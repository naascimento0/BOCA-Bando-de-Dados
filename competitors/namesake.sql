WITH MaxScoreHackers AS (
  SELECT h.name, h.hacker_id, COUNT(*)
  FROM Hackers h
  JOIN Submissions s ON s.hacker_id = h.hacker_id
  JOIN Challenges c ON c.challenge_id = s.challenge_id
  JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
  WHERE s.score = d.score
  GROUP BY h.name, h.hacker_id
  HAVING COUNT(*) > 1
)

SELECT DISTINCT m.name 
FROM MaxScoreHackers m
JOIN MaxScoreHackers m2 ON m.name = m2.name AND m.hacker_id != m2.hacker_id
ORDER BY m.name
