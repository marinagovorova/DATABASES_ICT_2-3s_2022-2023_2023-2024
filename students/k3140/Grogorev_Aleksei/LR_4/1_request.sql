SELECT se.date_exam, subject.name_subject, te.surname as teacher_last_name
FROM database.schedule_exam se
JOIN database.subject ON se.code_subject = subject.code_subject
JOIN database.teacher te ON se.code_teacher = te.code_teacher
WHERE se.code_group = 2;