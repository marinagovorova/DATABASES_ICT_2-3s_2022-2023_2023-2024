SELECT gr.code_group, AVG(CAST(e.grade_exam AS FLOAT)) AS average_grade
FROM database.group gr
JOIN database.student_in_group sig ON gr.code_group = sig.code_group
JOIN database.exam e ON sig.code_student = e.code_student
JOIN database.subject_in_plan sp ON e.code_subject = sp.code_subject
WHERE gr.code_plan = 2
GROUP BY gr.code_group
ORDER BY average_grade DESC;