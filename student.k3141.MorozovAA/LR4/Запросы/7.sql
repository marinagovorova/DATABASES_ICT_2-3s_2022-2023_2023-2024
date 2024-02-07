select
    distinct copy_of_book.id_publication,
    copy_of_book.availability,
    book.name_of_book
from
    copy_of_book,
    publication,
    book
where
    copy_of_book.id_publication = publication.library_code and
    publication.id_book = book.id_book
group by
    copy_of_book.id_publication,
    copy_of_book.availability,
    book.name_of_book
having
    copy_of_book.availability = FALSE;