select
    reader.id_reader,
    reader.name,
    reader.surname,
    reader.count_of_books
from
    reader,
    book_circulation
where
    reader.id_reader = book_circulation.id_reader and
    ((book_circulation.return_date_plan < current_date and book_circulation.return_date > book_circulation.return_date_plan and book_circulation.fine = False) or
    book_circulation.fine = True) and
    reader.count_of_books > 9;
/* У меня стоит ограничение на количесиво книг 10, поэтому делаю запрос на >9