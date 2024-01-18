select
    DISTINCT reader.id_reader,
    reader.name,
    reader.surname
from
    book_circulation,
    reader
where
    reader.id_reader = book_circulation.id_reader and
    book_circulation.issue_date < date('2022-12-22');