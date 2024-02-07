CREATE OR REPLACE PROCEDURE fine_check(IN id INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE book_circulation
    SET fine = 100
    WHERE book_circulation.number_of_operation = id
      AND book_circulation.return_date > book_circulation.return_date_plan;
END;
$$;


CREATE TRIGGER fine_checker
    AFTER UPDATE ON book_circulation
    FOR EACH ROW
EXECUTE PROCEDURE fine_check(NEW.number_of_operation);