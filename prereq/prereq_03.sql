SELECT DISTINCT p2.prereq_id FROM course c JOIN prereq p1 ON c.course_id = p1.course_id JOIN prereq p2 ON p1.prereq_id = p2.course_id WHERE title = 'SINAIS E SISTEMAS'
