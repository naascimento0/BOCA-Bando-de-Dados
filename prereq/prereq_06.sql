WITH RECURSIVE all_courses AS (
    SELECT course_id FROM prereq WHERE prereq_id = (SELECT course_id FROM course WHERE title = 'CÁLCULO III')
  UNION
    SELECT c.course_id FROM prereq c JOIN all_courses ac ON c.prereq_id = ac.course_id
)

SELECT DISTINCT course_id FROM all_courses
