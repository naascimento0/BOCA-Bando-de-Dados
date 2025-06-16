WITH MaxScores AS (
  SELECT h.hacker_id, s.challenge_id, MAX(s.score) AS score 
  FROM Hackers h
  JOIN Submissions s ON s.hacker_id = h.hacker_id
  WHERE s.score > 0
  GROUP BY h.hacker_id, s.challenge_id
)

SELECT h.hacker_id, h.name, SUM(MaxScores.score) AS soma FROM Hackers h JOIN MaxScores ON h.hacker_id = MaxScores.hacker_id GROUP BY h.hacker_id, h.name ORDER BY soma DESC, h.hacker_id ASC
