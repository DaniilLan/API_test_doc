import psycopg2
from psycopg2 import sql
from dotenv import load_dotenv
import os

# Данные для подключения
host = os.getenv('DB_HOST')
port = os.getenv('DB_PORT')
dbname = os.getenv('DB_NAME')
user = os.getenv('DB_USER')
password = os.getenv('DB_PASSWORD')


def query_delete(id_user):
    conn = None
    cursor = None
    try:
        # Подключение к базе данных
        conn = psycopg2.connect(
            host=host,
            port=port,
            dbname=dbname,
            user=user,
            password=password
        )
        cursor = conn.cursor()
        query = f"DELETE FROM public.users WHERE id={id_user};"

        # Выполнение запроса
        if id_user:
            cursor.execute(query, id_user)
        else:
            cursor.execute(query)

        conn.commit()
        return None

    except psycopg2.Error as e:
        print("Ошибка при выполнении запроса:", e)
        return None

    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

