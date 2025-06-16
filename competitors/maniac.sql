WITH MaxScoreSubmissions AS (
    SELECT s.hacker_id, s.challenge_id
    FROM Submissions s
    JOIN Challenges c ON c.challenge_id = s.challenge_id
    JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
    WHERE s.score = d.score
    GROUP BY s.hacker_id, s.challenge_id
    HAVING COUNT(*) = 1
),
HackerChallenges AS (
    SELECT h.hacker_id, h.name, COUNT(mss.challenge_id) AS solved_challenges
    FROM Hackers h
    LEFT JOIN MaxScoreSubmissions mss ON h.hacker_id = mss.hacker_id
    GROUP BY h.hacker_id, h.name
    HAVING COUNT(mss.challenge_id) = (SELECT COUNT(*) FROM Challenges)
)
SELECT DISTINCT name
FROM HackerChallenges;
