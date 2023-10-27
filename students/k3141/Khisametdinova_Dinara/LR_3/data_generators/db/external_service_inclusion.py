import random
from faker import Faker
from faker.providers.phone_number import Provider
import datetime
import json

fake = Faker()
fake.add_provider(Provider)
table_name = 'external_service_inclusion'
column_names = ('external_service_inclusion_id', 'external_service_id', 'phone_number', 'external_service_date_of_connection', 'external_service_date_of_disconnection')
k = 101

with open('dumps/phone_on_tariff.txt', 'r') as f:
    phone_numbers = json.load(f)


filename = f'{table_name}.sql' 
with open('backups/external_service_inclusion_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):

        internal_service_id = random.randint(1, 60)
        phone_number = phone_numbers[random.randint(0, 99)]

        connect_date=f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        disconnect_date =f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        while connect_date >= disconnect_date:
            connect_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
            disconnect_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
        
        values = [str(i), internal_service_id, phone_number, connect_date, disconnect_date]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()