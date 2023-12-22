from faker import Faker
from faker.providers.phone_number import Provider
import datetime
import random

fake = Faker()
fake.add_provider(Provider)
table_name = 'contract'
column_names = ('contract_id', 'date_of_conclusion', 'date_of_cancellation', 'client_id')
k_contracts = 201

filename = f'{table_name}.sql' 
with open('backups/contract_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k_contracts):

        client_id = random.randint(1, 100)
        date_of_conclusion=f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        date_of_cancellation =f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        while date_of_conclusion >= date_of_cancellation:
            date_of_conclusion = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
            date_of_cancellation = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
        values = [str(i), date_of_conclusion, date_of_cancellation, client_id]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()
