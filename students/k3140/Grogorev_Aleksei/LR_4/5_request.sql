SELECT DISTINCT s.code_student, s.surname, s.name, s.middlename
FROM database.student s
WHERE s.code_student IN (
    SELECT sg.code_student
    FROM database.student_in_group sg
    WHERE sg.code_group IN (
        SELECT gr.code_group
        FROM database.group gr
        WHERE NOT EXISTS (
            SELECT sp.code_subject
            FROM database.subject_in_plan sp
            WHERE NOT EXISTS (
                SELECT e2.code_exam
                FROM database.exam e2
                WHERE e2.code_student = sg.code_student
                AND e2.code_subject = sp.code_subject
            )
            AND sp.code_subject NOT IN (
                SELECT e3.code_subject
                FROM database.exam e3
                WHERE e3.code_student = sg.code_student
            )
            AND gr.code_plan = sp.code_plan
        )
    )
);
