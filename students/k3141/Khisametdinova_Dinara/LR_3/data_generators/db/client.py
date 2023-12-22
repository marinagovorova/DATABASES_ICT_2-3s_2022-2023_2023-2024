from faker import Faker
from faker.providers.phone_number import Provider

fake = Faker()
fake.add_provider(Provider)
table_name = 'client'
column_names = ('client_id', 'full_name', 'passport_issuing_authority', 'passport_series_and_number', 'passport_issuing_date', 'address')
k_clients = 101

filename = f'{table_name}.sql' 
with open('backups/client_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k_clients):

        full_name = f"'{fake.unique.name()}'" 
        passport_issuing_date = f"'{fake.date_of_birth()}'"  
        address = f"'{fake.address()}'"
        passport_issuing_authority = f"'{fake.text(max_nb_chars=90)}'"
        passport_series_and_number = f"'{fake.random_int(min=1000000000, max=9999999999)}'"
        state = fake.random_int(min=1, max=4) 
        values = [str(i), full_name, passport_issuing_authority, passport_series_and_number, passport_issuing_date, address]
        values_str = ', '.join(values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 

    f.close()
