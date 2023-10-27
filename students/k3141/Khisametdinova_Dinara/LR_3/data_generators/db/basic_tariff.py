from faker import Faker
from faker.providers.phone_number import Provider

fake = Faker()
fake.add_provider(Provider)
table_name = 'basic_tariff'
column_names = ('tariff_id', 'gb_amount', 'international_call_cost_per_minute', 'domestic_call_cost_per_minute', 'basic_tariff_price', 'tariff_name', 'minutes_amount', 'sms_amount')
k = 31

filename = f'{table_name}.sql' 
with open('backups/basic_tariff_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):
        
        gb_amount = f"'{fake.random_int(min=1, max=200)}'"
        international_call_cost_per_minute = f"'{fake.random_int(min=1, max=50)}'"
        domestic_call_cost_per_minute = f"'{fake.random_int(min=1, max=10)}'"
        price = f"'{fake.random_int(min=100, max=6000)}'"
        tariff_name = f"'{fake.name()}'"
        minutes_amount =f"'{fake.random_int(min=60, max=100000)}'"
        sms_amount = f"'{fake.random_int(min=0, max=100000)}'"
        values = [str(i), gb_amount, international_call_cost_per_minute, domestic_call_cost_per_minute, price, tariff_name, minutes_amount, sms_amount]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()