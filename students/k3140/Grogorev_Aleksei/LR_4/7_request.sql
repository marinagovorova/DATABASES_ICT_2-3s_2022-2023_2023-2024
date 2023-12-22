WITH RankedStudents AS (
    SELECT
        sg.code_group,
        s.surname,
        s.name,
        AVG(e.grade_exam) AS average_grade,
        RANK() OVER(PARTITION BY sg.code_group ORDER BY AVG(e.grade_exam) DESC) AS rank_in_group
    FROM
        database.student s
    JOIN
        database.student_in_group sg ON s.code_student = sg.code_student
    LEFT JOIN
        database.exam e ON s.code_student = e.code_student
    GROUP BY
        sg.code_group, s.surname, s.name
)

SELECT code_group, surname, name, average_grade
FROM RankedStudents
WHERE rank_in_group = 1;
