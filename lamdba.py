import json
import pymysql
import boto3

def lambda_handler(event, context):
    region_name = 'Enter the Region'  
    secret_name = 'Enter the secret name'  
    database_name = 'Enter the database name' 

    client = boto3.client('secretsmanager', region_name=region_name)

    response = client.get_secret_value(SecretId=secret_name)
    secret = json.loads(response['SecretString'])

    username = secret['username']
    password = secret['password']
    host = secret['host']
    port = secret['port']

    conn = pymysql.connect(
        host=host,
        user=username,
        password=password,
        port=port,
        charset='utf8mb4',
        cursorclass=pymysql.cursors.DictCursor
    )

    with conn.cursor() as cursor:
        cursor.execute(f"CREATE DATABASE IF NOT EXISTS {database_name}")
        conn.commit()

    return {
        'statusCode': 200,
        'body': json.dumps(f"Database '{database_name}' created successfully!")
    }
