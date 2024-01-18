delete from 
    copy_of_book
where
        copy_of_book.id_copy_of_book in
    (
        select
            copy_of_book.id_copy_of_book
        from
            copy_of_book,
            act_of_debiting
        where
            copy_of_book.id_copy_of_book = act_of_debiting.id_copy_of_book
    )