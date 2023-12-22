SELECT student.surname
FROM database.exam
JOIN database.student ON exam.code_student = student.code_student
CROSS JOIN (SELECT AVG(grade_exam) grade FROM database.exam) grade
WHERE exam.grade_exam > grade