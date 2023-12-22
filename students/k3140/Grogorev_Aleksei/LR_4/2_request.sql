SELECT student.surname,teacher.surname
FROM database.exam e
JOIN database.student ON e.code_student = student.code_student
JOIN database.teacher ON e.code_teacher = teacher.code_teacher
WHERE e.grade_exam = 2 AND e.number_try = 1;