SELECT DISTINCT course.course_id FROM course JOIN prereq ON course.course_id = prereq.course_id WHERE prereq.prereq_id = (SELECT course_id FROM course WHERE title = 'CÁLCULO III')
