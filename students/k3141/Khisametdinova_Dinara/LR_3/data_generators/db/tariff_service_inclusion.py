import datetime
import random
from faker import Faker
from faker.providers.phone_number import Provider

fake = Faker()
fake.add_provider(Provider)
table_name = 'tariff_service_inclusion'
column_names = ('tariff_service_inclusion_id', 'internal_service_id', 'tariff_id', 'tariff_service_date_of_connection', 'tariff_service_date_of_disconnection')
k = 101

filename = f'{table_name}.sql' 
with open('backups/tariff_service_inclusion_backup.sql', 'w') as f: 
    
    columns_str = ', '.join(f'"{column}"' for column in column_names)
    for i in range(1, k):
        
        internal_service_id = random.randint(1, 60)
        tariff_id = random.randint(1, 30)

        connect_date=f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        disconnect_date =f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'" 
        while connect_date >= disconnect_date:
            connect_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
            disconnect_date = f"'{fake.date_between(datetime.date(2000, 1, 1), datetime.date(2023,12,31))}'"
        
        values = [str(i), internal_service_id, tariff_id, connect_date, disconnect_date]
        values_str = ', '.join(str(value) for value in values)
        insert_query = f'INSERT INTO "{table_name}" ({columns_str}) VALUES ({values_str});\n'
        print(insert_query) 
        f.write(insert_query) 
    f.close()