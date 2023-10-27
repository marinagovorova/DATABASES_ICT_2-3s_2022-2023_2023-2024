from faker import Faker
from faker.providers.phone_number import Provider

fake = Faker()
fake.add_provider(Provider)
table_name = 'call_zone'
column_names = ('call_zone_id', 'country', 'cost_per_minute_call_zone', 'region', 'city')
k = 16

filename = f'{table_name}.sql' 
with open('backups/call_zone_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):
        country = f"'{fake.country()}'" 
        cost_per_minute_call_zone =f"'{fake.random_int(min=1, max=100)}'"  
        region = f"'{fake.country()}'"
        city = f"'{fake.city()}'"
        values = [i, country, cost_per_minute_call_zone, region, city]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()
