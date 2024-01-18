CREATE OR REPLACE PROCEDURE plan_date(IN id INT)
    LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE book_circulation
    SET return_date_plan = issue_date + INTERVAL '20 days'
    WHERE book_circulation.number_of_operation = id;
END;
$$;

CREATE TRIGGER fine_checker
    AFTER UPDATE ON book_circulation
    FOR EACH ROW
EXECUTE PROCEDURE plan_date(NEW.number_of_operation);