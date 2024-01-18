select 
    distinct copy_of_book.id_publication
from
    copy_of_book
group by 
    copy_of_book.id_publication
having count(id_copy_of_book) = 1;