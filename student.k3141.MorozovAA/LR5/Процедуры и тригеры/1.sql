CREATE OR REPLACE PROCEDURE check_book_availability (IN book_id INT, OUT num_copies INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT COUNT(*) INTO num_copies FROM copy_of_book WHERE copy_of_book.id_publication = book_id;
END
$$;

call check_book_availability(13, num_copies := 0)