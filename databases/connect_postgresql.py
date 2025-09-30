#%%
import psycopg2
from dotenv import load_dotenv
import os
import pandas as pd


#%%
# Load environment variables from .env
load_dotenv()

# Fetch variables
USER = os.getenv("USER")
PASSWORD = os.getenv("PASSWORD")
HOST = os.getenv("HOST")
PORT = os.getenv("port")
DBNAME = os.getenv("dbname")
#%%

# Connect to the database
try:
    connection = psycopg2.connect(
        user=USER,
        password=PASSWORD,
        host=HOST,
        port=PORT,
        dbname=DBNAME
    )
    print("Connection successful!")
    
    # Create a cursor to execute SQL queries
    cursor = connection.cursor()
    
    # Example query
    cursor.execute("SELECT NOW();")
    result = cursor.fetchone()
    print("Current Time:", result)

    cursor.execute("SELECT * FROM TENNIS.SPELERS;")
    
    spelers_data = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    spelers_df = pd.DataFrame(spelers_data, columns=columns)


    # Close the cursor and connection
    cursor.close()
    connection.close()
    print("Connection closed.")

except Exception as e:
    print(f"Failed to connect: {e}")