SELECT sg.code_group, s.surname, s.name, AVG(e.grade_exam) AS average_grade,
    CASE
        WHEN COUNT(CASE WHEN e.grade_exam = '3' THEN 1 END) = 0 THEN 1
        ELSE 0
    END AS scholarship
FROM database.student s
JOIN database.student_in_group sg ON s.code_student = sg.code_student
LEFT JOIN database.exam e ON s.code_student = e.code_student
GROUP BY sg.code_group, s.surname, s.name
ORDER BY sg.code_group, s.surname;
