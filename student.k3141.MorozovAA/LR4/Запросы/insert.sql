INSERT INTO
    copy_of_book
VALUES 
    (1000,
     true,
     (SELECT library_code FROM publication, publishing_house WHERE
                                                                   publication.id_publishing_house = publishing_house.id_publishing_house and
                                                                   publishing_house.name = 'Penguin Books' and
                                                                   publishing_house.compilers = 'Manuel Buesden'),
     'New');