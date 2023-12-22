import json
import random
from faker import Faker
from faker.providers.phone_number import Provider
import datetime

fake = Faker()
fake.add_provider(Provider)
table_name = 'payment'
column_names = ('payment_id', 'payment_status', 'phone_number', 'payment_date', 'payment_amount')
k = 101

with open('dumps/phone_on_tariff.txt', 'r') as f:
    phone_numbers = json.load(f)

filename = f'{table_name}.sql' 
with open('backups/payment_backup.sql', 'w') as f:
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):
        
        payment_status = random.choice([True, False])
        payment_amount = f"'{fake.random_int(min=50, max=5000)}'"
        phone_number = phone_numbers[random.randint(0, 99)]
        payment_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
        values = [str(i), payment_status, phone_number, payment_date, payment_amount]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()