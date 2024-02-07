CREATE OR REPLACE PROCEDURE add_new_reader
    (
    IN reader_name VARCHAR,
    IN reader_surname VARCHAR,
    IN reader_patronymic VARCHAR,
    IN reader_phone_number VARCHAR,
    IN reader_address VARCHAR,
    IN reader_passport VARCHAR,
    IN reader_email VARCHAR
    )
    LANGUAGE plpgsql
AS
$$
DECLARE
    reader_exists BOOLEAN = false;
BEGIN
    SELECT true FROM reader WHERE reader.name = reader_name AND reader.phone_number = reader_phone_number INTO reader_exists;

    IF NOT reader_exists THEN
        INSERT INTO reader (id_reader, count_of_books, name, surname, patronymic, phone_number, address, passport, email)
        VALUES (id_reader := 9999, count_of_books := 0, reader_name, reader_surname, reader_patronymic, reader_phone_number, reader_address, reader_passport, reader_email);
    ELSE
        RAISE NOTICE 'Читатель уже есть в БД';
    END IF;
END;
$$;