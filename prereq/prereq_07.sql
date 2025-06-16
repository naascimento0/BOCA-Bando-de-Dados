WITH RECURSIVE all_courses AS (
    SELECT course_id, prereq_id from prereq 
  UNION
    SELECT p.course_id, all_courses.prereq_id FROM prereq p JOIN all_courses ON all_courses.course_id = p.prereq_id
)

SELECT c.course_id AS Codigo, c.title AS Disciplina, COUNT(ac.prereq_id) AS Num_Prereq FROM course c LEFT JOIN all_courses ac ON c.course_id = ac.course_id GROUP BY c.course_id, c.title ORDER BY Num_Prereq DESC, Codigo ASC
