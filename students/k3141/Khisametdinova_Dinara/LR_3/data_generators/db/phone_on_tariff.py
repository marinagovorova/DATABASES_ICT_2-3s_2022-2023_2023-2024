import random
from faker import Faker
from faker.providers.phone_number import Provider
import datetime
import json

fake = Faker()
fake.add_provider(Provider)
table_name = 'phone_on_tariff'
column_names = ('phone_on_tariff_number', 'tariff_id', 'activation_date', 'deletion_date', 'current_balance', 'contract_id')
phone_numbers = []
k = 101

filename = f'{table_name}.sql' 
with open('backups/phone_on_tariff_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):

        activation_date=f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        deletion_date =f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        while activation_date >= deletion_date:
            activation_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
            deletion_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
        phone_number = f"'8{fake.random_int(min=1000000000, max=9999999999)}'"
        phone_numbers.append(phone_number)
        current_balance = f"'{fake.random_int(min=0, max=1000000)}'"
        callee_number = f"'8{fake.random_int(min=1000000000, max=9999999999)}'"
        domestic_call_id = f"'{fake.random_int(min=111, max=999999)}'"
        international_call_id = f"'{fake.random_int(min=111, max=999999)}'"
        
        tariff_id = random.randint(1, 30)
        contract_id = random.randint(1, 200) # выбор случайного contract_id из списка contracts
        payment_id = random.randint(1, 100)

        values = [phone_number, tariff_id, activation_date, deletion_date, current_balance, contract_id]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()

    with open('dumps/phone_on_tariff.txt', 'w') as f:
        json.dump(phone_numbers, f)
