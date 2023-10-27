import json
from faker import Faker
from faker.providers.phone_number import Provider
import datetime
import random

fake = Faker()
fake.add_provider(Provider)
table_name = 'international_call'
column_names = ('international_call_id', 'phone_number', 'international_call_start_time', 'international_call_end_time', 'international_callee_number', 'call_zone_id')
international_calls = []
k = 31

filename = f'{table_name}.sql'

with open('dumps/phone_on_tariff.txt', 'r') as f:
    phone_numbers = json.load(f)

with open('backups/international_call_backup.sql', 'w') as f:

    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):

        phone_number = phone_numbers[random.randint(0, 99)]
        call_start_time=f"'{fake.date_time_between(datetime.datetime(2000, 1, 1, 10, 10, 10), datetime.datetime(2023,12,31, 10, 10, 10))}'" 
        call_end_time =f"'{fake.date_time_between(datetime.datetime(2000, 1, 1), datetime.datetime(2023,12,31))}'" 
        while call_start_time >= call_end_time:
            call_start_time = f"'{fake.date_time_between(datetime.datetime(2000, 1, 1, 10, 10, 10), datetime.datetime(2023,12,31, 10, 10, 10))}'"
            call_end_time = f"'{fake.date_time_between(datetime.datetime(2000, 1, 1, 10, 10, 10), datetime.datetime(2023,12,31, 10, 10, 10))}'"
        cost_per_minute_call_zone =f"'{fake.random_int(min=1, max=100)}'"  
        international_callee_number = f"'8{fake.random_int(min=1000000000, max=9999999999)}'"
        call_zone_id = random.randint(1, 15)
        values = [str(i), phone_number, call_start_time, call_end_time, international_callee_number, str(call_zone_id)]
        values_str = ', '.join(values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query)

    f.close()
