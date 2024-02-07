update
    copy_of_book
set
    condition = 'Fair'
where
    copy_of_book.id_copy_of_book in 
    (
        select
            copy_of_book.id_copy_of_book
        from
            copy_of_book, act_of_registration
        where
            copy_of_book.id_copy_of_book = act_of_registration.id_copy_of_book and
            act_of_registration.date_of_signing < date('2000-01-01')
    )