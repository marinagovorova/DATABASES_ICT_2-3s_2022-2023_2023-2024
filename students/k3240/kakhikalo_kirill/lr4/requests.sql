-- Пробовал сделать разными вариантами, решил что это самый лучший вариант
-- Самая первая версия была с тремя JOIN, а потом WHERE с subquery, но это было не производительно прям совсем, тк subquery коррелированный
-- Потом я попробовал три JOIN, а потом GROUP BY, но это требовало кучи колонок в GROUP BY, непроизводительно (много колонок в GROUP BY + лишние JOIN)
-- Это лучшее к чему я пришёл. Если бы оптимизатор в Postgres был умнее, то он бы понял, 
-- что между group_id и enrollment_id и programm_code есть функциональная зависимость, и он бы смог оптимизировать запрос,
-- я бы смог не использовать subquery, а обошёлся бы тремя JOIN и GROUP BY только с одним столбцом.

SELECT number, education_programm.programm_code
FROM (SELECT "group".group_id, number, "group".enrollment_id as enrollment_id_short
      FROM "group"
               JOIN student ON "group".group_id = student.group_id
      GROUP BY "group".group_id
      HAVING COUNT(student.student_id) < 10
     )
JOIN enrollment ON enrollment_id_short = enrollment.enrollment_id
JOIN education_programm ON enrollment.programm_code = education_programm.programm_code;

CREATE INDEX group_id_index ON student (group_id);

SELECT teacher.teacher_id, COUNT(class)
FROM teacher
         LEFT JOIN class ON teacher.teacher_id = class.teacher_id AND extract(year from class.date) = extract(year from CURRENT_TIMESTAMP) - 1
         LEFT JOIN course ON class.course_id = course.course_id
         LEFT JOIN programm_element ON course.programm_element_id = programm_element.programm_element_id
         LEFT JOIN enrollment ON programm_element.enrollment_id = enrollment.enrollment_id
GROUP BY enrollment.programm_code, teacher.teacher_id;

SELECT DISTINCT (class.teacher_id)
FROM class
WHERE classes_order_number <> 3;

-- 7 - EXTRACT(DOW FROM CURRENT_DATE) - дней до конца недели. +1 чтобы сдвинуть на понедельник.
-- || day позволяет превратить numeric в string с day, чтобы потом скастить в interval.
SELECT classroom.classroom_id
FROM classroom
    WHERE NOT EXISTS(SELECT * from class WHERE classroom.classroom_id = class.classroom_id AND class.date = CURRENT_DATE + ((7 - EXTRACT(DOW FROM CURRENT_DATE) + 1) || ' day')::interval) AND type = 'лекционная';

SELECT education_programm.programm_code, COUNT(student)
FROM education_programm
         LEFT JOIN enrollment ON education_programm.programm_code = enrollment.programm_code
         LEFT JOIN "group" ON enrollment.enrollment_id = "group".enrollment_id AND extract(year from CURRENT_TIMESTAMP) IN (extract(year from "group".start_date), extract(year from "group".end_date))
         LEFT JOIN student ON "group".group_id = student.group_id
GROUP BY education_programm.programm_code;

-- Нет компьютерных классов, заменил на лекционные.
SELECT AVG(load) * 1.5 as average_load
FROM (SELECT COUNT(class.classroom_id) as load
      FROM classroom
               LEFT JOIN class ON classroom.classroom_id = class.classroom_id AND extract(month from CURRENT_TIMESTAMP) = extract(month from class.date) AND extract(year from CURRENT_TIMESTAMP) = extract(year from class.date)
      WHERE classroom.type = 'лекционная'
      GROUP BY classroom.classroom_id);

CREATE INDEX class_some_fields_index ON class (classroom_id, date);

SELECT education_programm.programm_code, COUNT(student) as students_count
FROM education_programm
         LEFT JOIN enrollment ON education_programm.programm_code = enrollment.programm_code
         LEFT JOIN "group" ON enrollment.enrollment_id = "group".enrollment_id AND extract(year from CURRENT_TIMESTAMP) >= extract(year from "group".start_date) AND (extract(year from CURRENT_TIMESTAMP) - 2) <= extract(year from "group".end_date)
         LEFT JOIN student ON "group".group_id = student.group_id
GROUP BY education_programm.programm_code
ORDER BY students_count DESC
LIMIT 3;

-- Здесь логика не совсем правильная, так как эти данные имеют смысл только для определённого enrollment,
-- так как программа может меняться из года в год, но тогда view сделать не получится.
CREATE VIEW programm_disciplines AS
SELECT education_programm.programm_code, academic_discipline.name as discipline_name, academic_discipline.total_duration
FROM education_programm
         JOIN enrollment ON education_programm.programm_code = enrollment.programm_code
         JOIN programm_element ON enrollment.enrollment_id = programm_element.enrollment_id
         JOIN academic_discipline ON programm_element.discipline_id = academic_discipline.discipline_id
ORDER BY education_programm.programm_code;

-- Общий доход посчитать не выйдет, так как нет никаких данных о стоимости обучения, но можно вместо этого
-- посчитать количество студентов на каждой программе за последний год.
CREATE VIEW students_per_programm AS
SELECT education_programm.programm_code, COUNT(student) as students_count
FROM education_programm
         LEFT JOIN enrollment ON education_programm.programm_code = enrollment.programm_code
         LEFT JOIN "group" ON enrollment.enrollment_id = "group".enrollment_id AND extract(year from CURRENT_TIMESTAMP) IN (extract(year from "group".start_date), extract(year from "group".end_date))
         LEFT JOIN student ON "group".group_id = student.group_id
GROUP BY education_programm.programm_code;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- Задублировать все результаты увеличив попытку на 1, если это возможно.
INSERT INTO result (result_id, student_id, teacher_id, programm_element_id, attempt)
SELECT uuid_generate_v4(), student_id, teacher_id, programm_element_id, attempt + 1
FROM result
WHERE attempt < 2 AND NOT EXISTS(SELECT * FROM result inner_result WHERE result.student_id = inner_result.student_id AND result.programm_element_id = inner_result.programm_element_id AND result.attempt + 1 = inner_result.attempt);

-- Отчислить всех студентов у которых есть хотя бы один result с null оценкой.
UPDATE student
SET status_in_group = 'отчислен'
WHERE EXISTS(SELECT * FROM result WHERE result.student_id = student.student_id AND mark IS NULL);

-- Удалить всех клиентов, которые не имеют студента.
DELETE FROM client
WHERE NOT EXISTS(SELECT * FROM student WHERE student.client_id = client.client_id);
