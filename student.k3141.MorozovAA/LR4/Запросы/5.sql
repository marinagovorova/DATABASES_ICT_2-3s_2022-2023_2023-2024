select
    copy_of_book.*
from
    book_circulation,
    copy_of_book,
    publication,
    book
where
        book_circulation.id_copy_of_book = copy_of_book.id_copy_of_book and
        copy_of_book.id_publication = publication.library_code and
        publication.id_book = book.id_book and
        copy_of_book.availability = FALSE and
        book_circulation.return_date_plan <= date('2023-12-25') and
        book_circulation.return_date_plan >= date('2023-12-23') and
        book.area_of_knowledge = 'Computer Science';