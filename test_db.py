# app/test_db.py

import os
from sqlalchemy import create_engine, text
from dotenv import load_dotenv

# 1️⃣ Load environment variables from the .env file
load_dotenv()

# 2️⃣ Read the DATABASE_URL variable from .env
db_url = os.getenv("DATABASE_URL")

if not db_url:
    raise SystemExit("❌ DATABASE_URL not found. Make sure your .env file exists in the project root.")

# 3️⃣ Create a connection engine
engine = create_engine(db_url, future=True)

# 4️⃣ Try to connect and print PostgreSQL version
try:
    with engine.connect() as conn:
        version = conn.execute(text("SELECT version();")).scalar_one()
        print("✅ Connected successfully!")
        print("PostgreSQL version:", version)
except Exception as e:
    print("❌ Connection failed.")
    print(e)
