CREATE OR REPLACE PROCEDURE add_new_book (IN library_code INT, IN name_of_publishing_house VARCHAR, IN year_of_release INT, IN id_book INT, IN language VARCHAR)
    LANGUAGE plpgsql
AS
$$
    DECLARE
        id INT;
BEGIN
    SELECT id_publishing_house INTO id FROM publishing_house WHERE publishing_house.name = name_of_publishing_house;
    INSERT INTO publication VALUES (library_code, name_of_publishing_house, year_of_release, id_book, language);
END;
$$;