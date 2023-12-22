import random
from faker import Faker
from faker.providers.phone_number import Provider

fake = Faker()
fake.add_provider(Provider)
table_name = 'internal_service'
column_names = ('internal_service_id', 'internal_service_price', 'internal_service_description', 'internal_service_periodicity')
k = 61

filename = f'{table_name}.sql' 
with open('backups/internal_service_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):
        
        price = f"'{fake.random_int(min=1, max=10^100)}'"
        service_description = f"'{fake.text()}'"
        periodicity = random.choice(["'daily'", "'weekly'", "'monthly'", "'yearly'", "'hourly'"])

        values = [str(i), price, service_description, periodicity]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()