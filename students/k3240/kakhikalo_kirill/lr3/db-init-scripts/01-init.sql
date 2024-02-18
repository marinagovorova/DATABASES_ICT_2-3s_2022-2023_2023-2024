-- File: 01-init.sql
CREATE TYPE ATTESTATION_TYPE AS ENUM ('дифференциальный', 'зачёт', 'экзамен');
CREATE TYPE QUALIFICATION AS ENUM ('бакалавр', 'магистр', 'техник', 'преподаватель - исследователь');
CREATE TYPE EDUCATION_LEVEL AS ENUM ('бакалавр', 'магистр', 'аспирант', 'СПО');
CREATE TYPE JOB_TITLE AS ENUM ('преподаватель', 'старший преподаватель', 'доцент', 'лаборант', 'ассистент');
CREATE TYPE CLASS_TYPE AS ENUM ('лабораторная', 'практика', 'лекция');
CREATE TYPE AUDITORY_TYPE AS ENUM ('малая', 'лекционная');
CREATE TYPE STUDENT_STATUS AS ENUM ('учится', 'отчислен');
CREATE TYPE PROGRAM_TYPE AS ENUM ('ДПО', 'основная');
CREATE TYPE MARK AS ENUM ('2', '3', '4', '5', 'yes', 'no');

CREATE DOMAIN GROUP_NUMBER AS VARCHAR(8)
    CHECK (VALUE ~ '^[a-zA-Z0-9]+$');
CREATE DOMAIN LAT_CYR_NUM_VARCHAR8 AS VARCHAR(8)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$');
CREATE DOMAIN LAT_CYR_NUM_VARCHAR16 AS VARCHAR(16)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$');
CREATE DOMAIN LAT_CYR_NUM_VARCHAR32 AS VARCHAR(32)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$');
CREATE DOMAIN LAT_CYR_NUM_VARCHAR64 AS VARCHAR(64)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$');
CREATE DOMAIN LAT_CYR_NUM_VARCHAR256 AS VARCHAR(256)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s]+$');
CREATE DOMAIN CONTACTS256 AS VARCHAR(256)
    CHECK (VALUE ~ '^[a-zA-Z0-9а-яёА-ЯЁ\s+-@.,]+$');

CREATE OR REPLACE FUNCTION check_group_dates()
RETURNS TRIGGER AS $$
DECLARE
    enrollment_start_date DATE;
    enrollment_end_date DATE;
BEGIN
SELECT start_date, end_date INTO enrollment_start_date, enrollment_end_date
FROM enrollment
WHERE enrollment_id = NEW.enrollment_id;

IF NEW.start_date < enrollment_start_date THEN
        RAISE EXCEPTION 'Group start date must be on or after the enrollment start date.';
END IF;
IF NEW.end_date > enrollment_end_date THEN
        RAISE EXCEPTION 'Group end date must be on or before the enrollment end date.';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;
   
CREATE OR REPLACE FUNCTION check_student_dates()
RETURNS TRIGGER AS $$
DECLARE
    group_start_date DATE;
    group_end_date DATE;
BEGIN
SELECT start_date, end_date INTO group_start_date, group_end_date
FROM enrollment
WHERE enrollment_id = NEW.enrollment_id;

IF NEW.start_date < group_start_date THEN
        RAISE EXCEPTION 'Student start date must be on or after the group start date.';
END IF;
IF NEW.end_date > group_end_date THEN
        RAISE EXCEPTION 'Student end date must be on or before the group end date.';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;
   
CREATE OR REPLACE FUNCTION check_mark()
RETURNS TRIGGER AS $$
DECLARE
    programm_discipline_id UUID;
    discipline_attestation_type ATTESTATION_TYPE;
BEGIN
SELECT discipline_id INTO programm_discipline_id
FROM programm_element
WHERE programm_element_id = NEW.programm_element_id;

SELECT attestation_type INTO discipline_attestation_type
FROM academic_discipline
WHERE discipline_id = programm_discipline_id;

IF NEW.mark IS NULL THEN
   RETURN NEW;
END IF;
IF discipline_attestation_type = 'зачёт' AND NEW.mark NOT IN ('yes', 'no') THEN
   RAISE EXCEPTION 'If attestation type is зачёт then allowed marks are only yes and no';
END IF;
IF discipline_attestation_type IN ('дифференциальный','экзамен') AND NEW.mark NOT IN ('2', '3', '4', '5') THEN
   RAISE EXCEPTION 'If attestation type is дифференциальный or экзамен then allowed marks are only 2, 3, 4, 5';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;
   
CREATE OR REPLACE FUNCTION check_result_date()
RETURNS TRIGGER AS $$
DECLARE
    student_start_date DATE;
BEGIN
SELECT start_date INTO student_start_date
FROM student
WHERE student_id = NEW.student_id;

IF NEW.date < student_start_date THEN
        RAISE EXCEPTION 'Result date must be on or after the student start date.';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;
   
CREATE OR REPLACE FUNCTION check_result_attempts()
RETURNS TRIGGER AS $$
BEGIN
IF NEW.attempt = 0 THEN
    RETURN NEW;
END IF;

IF EXISTS (SELECT 1 FROM result WHERE programm_element_id = NEW.programm_element_id AND student_id = NEW.student_id AND attempt = NEW.attempt - 1) THEN
    RETURN NEW;
END IF;

RAISE EXCEPTION 'Previous attempt is not exists.';
END;
$$ LANGUAGE plpgsql;
   
CREATE OR REPLACE FUNCTION check_class()
RETURNS TRIGGER AS $$
DECLARE
    auditory_type AUDITORY_TYPE;
    discipline_discipline_id UUID;
    group_start_date DATE;
    groups_with_late_start INT;
    classroom_capacity INT;
    total_students INT;
BEGIN

SELECT type INTO auditory_type
FROM classroom
WHERE classroom_id = NEW.classroom_id;

IF auditory_type <> 'лекционная' and NEW.type = 'лекция' THEN
   RAISE EXCEPTION 'Classroom type is wrong for this type of class.';
END IF;

SELECT discipline_id INTO discipline_discipline_id
FROM programm_element
WHERE programm_element_id = (
    SELECT programm_element_id
    FROM course
    WHERE course_id = NEW.course_id
);
    
IF NOT EXISTS (SELECT 1 FROM teaching_permit WHERE discipline_id = discipline_discipline_id AND (NEW.type <> 'лекция' OR is_lecture_allowed = TRUE) LIMIT 1) THEN
    RAISE EXCEPTION 'Selected teacher cant be assigned to this class.';
END IF;

SELECT COUNT(*) INTO groups_with_late_start
FROM "group"
WHERE group_id IN (
    SELECT group_id
    FROM course_participant
    WHERE course_id = NEW.course_id
) AND start_date > NEW.date;

IF groups_with_late_start <> 0 THEN
   RAISE EXCEPTION 'Some of groups has start date after class date.';
END IF;

SELECT capacity INTO classroom_capacity
FROM classroom
WHERE classroom_id = NEW.classroom_id;

SELECT COUNT(*) INTO total_students
FROM student
WHERE group_id IN (
    SELECT group_id
    FROM course_participant
    WHERE course_id = NEW.course_id AND status_in_group = 'учится'
);

IF classroom_capacity < total_students THEN
    RAISE EXCEPTION 'Classroom is too small to fit all students.';
END IF;

RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS academic_discipline (
    discipline_id UUID PRIMARY KEY,
    name LAT_CYR_NUM_VARCHAR32 UNIQUE NOT NULL,
    practical INT NOT NULL CHECK (practical > 0),
    lectures_labs INT CHECK (lectures_labs > 0),
    total_duration INT NOT NULL CHECK (total_duration > practical + lectures_labs),
    attestation_type ATTESTATION_TYPE NOT NULL
);
CREATE TABLE IF NOT EXISTS subdivision (
    subdivision_id UUID PRIMARY KEY,
    name LAT_CYR_NUM_VARCHAR32 UNIQUE NOT NULL
);
CREATE TABLE IF NOT EXISTS specialty (
    code LAT_CYR_NUM_VARCHAR16 PRIMARY KEY,
    qualification QUALIFICATION NOT NULL,
    level EDUCATION_LEVEL NOT NULL,
    name LAT_CYR_NUM_VARCHAR64 UNIQUE NOT NULL,
    subdivision_id UUID NOT NULL,
    CONSTRAINT subdivision_id_fkey FOREIGN KEY ("subdivision_id") REFERENCES subdivision (subdivision_id) MATCH SIMPLE
);
CREATE TABLE IF NOT EXISTS education_programm (
    programm_code LAT_CYR_NUM_VARCHAR16 PRIMARY KEY,
    programm_type PROGRAM_TYPE NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    specialty_code LAT_CYR_NUM_VARCHAR16 NOT NULL,
    CONSTRAINT specialty_code_fkey FOREIGN KEY ("specialty_code") REFERENCES specialty (code) MATCH SIMPLE
);
CREATE TABLE IF NOT EXISTS enrollment (
    enrollment_id UUID PRIMARY KEY,
    programm_code LAT_CYR_NUM_VARCHAR16 NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > start_date),
    CONSTRAINT education_programm_programm_code_fkey FOREIGN KEY ("programm_code") 
        REFERENCES education_programm (programm_code) MATCH SIMPLE
);
CREATE TABLE IF NOT EXISTS programm_element (
    programm_element_id UUID PRIMARY KEY,
    enrollment_id UUID NOT NULL,
    discipline_id UUID NOT NULL,
    CONSTRAINT enrollment_enrollment_id_fkey FOREIGN KEY ("enrollment_id")
        REFERENCES enrollment (enrollment_id) MATCH SIMPLE,
    CONSTRAINT academic_discipline_discipline_id_fkey FOREIGN KEY ("discipline_id")
        REFERENCES academic_discipline (discipline_id) MATCH SIMPLE,
    UNIQUE (enrollment_id, discipline_id)
);
CREATE TABLE IF NOT EXISTS teacher (
    teacher_id UUID PRIMARY KEY,
    name LAT_CYR_NUM_VARCHAR64 NOT NULL,
    surname LAT_CYR_NUM_VARCHAR64 NOT NULL,
    patronymic LAT_CYR_NUM_VARCHAR64 NOT NULL,
    job_title JOB_TITLE NOT NULL
);
CREATE TABLE IF NOT EXISTS teaching_permit (
    teaching_permit_id UUID PRIMARY KEY,
    teacher_id UUID NOT NULL,
    discipline_id UUID NOT NULL,
    is_lecture_allowed BOOLEAN NOT NULL,
    CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY ("teacher_id")
        REFERENCES teacher (teacher_id) MATCH SIMPLE,
    CONSTRAINT academic_discipline_discipline_id_fkey FOREIGN KEY ("discipline_id")
        REFERENCES academic_discipline (discipline_id) MATCH SIMPLE,
    UNIQUE (teacher_id, discipline_id)
);
CREATE TABLE IF NOT EXISTS client (
    client_id UUID PRIMARY KEY,
    name LAT_CYR_NUM_VARCHAR64 NOT NULL,
    surname LAT_CYR_NUM_VARCHAR64 NOT NULL,
    patronymic LAT_CYR_NUM_VARCHAR64 NOT NULL,
    contacts CONTACTS256 NOT NULL,
    passport_number LAT_CYR_NUM_VARCHAR32 NOT NULL,
    passport_serial LAT_CYR_NUM_VARCHAR32 NOT NULL,
    passport_issue_date DATE NOT NULL,
    passport_expiration_date DATE NOT NULL CHECK (passport_expiration_date > passport_issue_date),
    UNIQUE(passport_number, passport_serial)
);

CREATE TABLE IF NOT EXISTS "group" (
    group_id UUID PRIMARY KEY,
    enrollment_id UUID NOT NULL,
    number GROUP_NUMBER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL CHECK (end_date > start_date),
    CONSTRAINT enrollment_enrollment_id_fkey FOREIGN KEY ("enrollment_id")
        REFERENCES enrollment (enrollment_id) MATCH SIMPLE
);
CREATE TRIGGER check_group_dates_trigger
    BEFORE INSERT OR UPDATE ON "group"
    FOR EACH ROW
    EXECUTE FUNCTION check_group_dates();

CREATE TABLE IF NOT EXISTS student (
    student_id UUID PRIMARY KEY,
    client_id UUID NOT NULL,
    group_id UUID NOT NULL,
    start_date DATE NOT NULL,
    finish_date DATE NOT NULL CHECK (finish_date > start_date),
    status_in_group STUDENT_STATUS NOT NULL,
    CONSTRAINT client_client_id_fkey FOREIGN KEY ("client_id")
        REFERENCES client (client_id) MATCH SIMPLE,
    CONSTRAINT group_group_id_fkey FOREIGN KEY ("group_id")
        REFERENCES "group" (group_id) MATCH SIMPLE,
    UNIQUE (client_id, group_id)
);
CREATE TRIGGER check_student_dates_trigger
    BEFORE INSERT OR UPDATE ON "group"
    FOR EACH ROW
    EXECUTE FUNCTION check_student_dates();

CREATE TABLE IF NOT EXISTS result (
    result_id UUID PRIMARY KEY,
    student_id UUID NOT NULL,
    teacher_id UUID NOT NULL,
    programm_element_id UUID NOT NULL,
    date DATE,
    mark MARK,
    attempt INT NOT NULL CHECK(attempt >= 0 AND attempt <= 3),
    UNIQUE (student_id, programm_element_id, attempt),
    CONSTRAINT student_student_id_fkey FOREIGN KEY ("student_id")
        REFERENCES student (student_id) MATCH SIMPLE,
    CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY ("teacher_id")
        REFERENCES teacher (teacher_id) MATCH SIMPLE
);
CREATE TRIGGER check_result_mark_trigger
    BEFORE INSERT OR UPDATE ON result
    FOR EACH ROW
    EXECUTE FUNCTION check_mark();
CREATE TRIGGER check_result_date_trigger
    BEFORE INSERT OR UPDATE ON result
    FOR EACH ROW
    EXECUTE FUNCTION check_result_date();
CREATE TRIGGER check_result_attempts_trigger
    BEFORE INSERT OR UPDATE ON result
    FOR EACH ROW
    EXECUTE FUNCTION check_result_attempts();

CREATE TABLE IF NOT EXISTS building (
    building_id UUID PRIMARY KEY,
    address LAT_CYR_NUM_VARCHAR64 NOT NULL
);

CREATE TABLE IF NOT EXISTS classroom(
    classroom_id UUID PRIMARY KEY,
    building_id UUID NOT NULL,
    number INT NOT NULL CHECK(number >= 0),
    type AUDITORY_TYPE NOT NULL,
    capacity INT NOT NULL CHECK(capacity > 0),
    CONSTRAINT building_building_id_fkey FOREIGN KEY ("building_id")
        REFERENCES building (building_id) MATCH SIMPLE,
    UNIQUE (building_id, number)
);

CREATE TABLE IF NOT EXISTS course(
    course_id UUID PRIMARY KEY,
    programm_element_id UUID NOT NULL,
    CONSTRAINT programm_element_programm_element_id_fkey FOREIGN KEY ("programm_element_id")
        REFERENCES programm_element (programm_element_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS course_participant(
    course_participant_id UUID PRIMARY KEY,
    group_id UUID NOT NULL,
    course_id UUID NOT NULL,
    CONSTRAINT group_group_id_fkey FOREIGN KEY ("group_id")
        REFERENCES "group" (group_id) MATCH SIMPLE,
    CONSTRAINT course_course_id_fkey FOREIGN KEY ("course_id")
        REFERENCES course (course_id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS class(
    class_id UUID PRIMARY KEY,
    course_id UUID NOT NULL,
    classroom_id UUID NOT NULL,
    teacher_id UUID NOT NULL,
    date DATE NOT NULL,
    classes_order_number INT NOT NULL CHECK (classes_order_number >= 0 AND classes_order_number < 10),
    type CLASS_TYPE NOT NULL,
    CONSTRAINT course_course_id_fkey FOREIGN KEY ("course_id")
        REFERENCES course (course_id) MATCH SIMPLE,
    CONSTRAINT classroom_classroom_id_fkey FOREIGN KEY ("classroom_id")
        REFERENCES classroom (classroom_id) MATCH SIMPLE,
    CONSTRAINT teacher_teacher_id_fkey FOREIGN KEY ("teacher_id")
        REFERENCES teacher (teacher_id) MATCH SIMPLE,
    UNIQUE (classroom_id, classes_order_number, date),
    UNIQUE (teacher_id, classes_order_number, date)
);
CREATE TRIGGER check_class_trigger
    BEFORE INSERT OR UPDATE ON class
    FOR EACH ROW
    EXECUTE FUNCTION check_class();