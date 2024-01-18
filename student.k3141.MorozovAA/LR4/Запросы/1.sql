select
    reader.id_reader,
    reader.name,
    reader.surname
from
    reader,
    book_circulation,
    copy_of_book,
    publication,
    book
where
    reader.id_reader = book_circulation.id_reader and 
    book_circulation.id_copy_of_book = copy_of_book.id_copy_of_book and 
    copy_of_book.id_publication = publication.library_code and
    publication.id_book = book.id_book and
    book.language = 'English' and 
    publication.year_of_release > 2000;