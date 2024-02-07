select
    reader.id_reader,
    reader.name,
    reader.surname
from
    reader,
    book_circulation
where
    reader.id_reader = book_circulation.id_reader and
    book_circulation.fine = True;