import boto3
import pymssql
import json

def lambda_handler(event, context):
    secrets_manager = boto3.client('secretsmanager')
    
    secret_name = "forta_dev_secret"
    secret_response = secrets_manager.get_secret_value(SecretId=secret_name)
    secret = secret_response['SecretString']
    secret_dict = json.loads(secret)

    db_host = secret_dict['host']
    db_username = secret_dict['username']
    db_password = secret_dict['password']
    
    conn = pymssql.connect(server=db_host, user=db_username, password=db_password)
    cursor = conn.cursor()
    
    new_database_name = "forta_dev_database"
    create_db_query = f"CREATE DATABASE {new_database_name}"
    cursor.execute(create_db_query)
    conn.commit()
    
    conn.close()
    
    return {
        'body': 'Database created successfully'
    }
