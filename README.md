# 2526_Data_Science
Data Science course content

## Getting Started

Follow these steps to set up the repository on your local machine:

### 1. Clone the Repository

**Where to execute these commands in Positron:**
- Go to `Terminal` → `New Terminal` from the menu, or
- Use `View` → `Terminal`

```bash
git clone https://github.com/dannyvolkaerts/2526_Data_Science.git
cd 2526_Data_Science
```

### 2. Create a Virtual Environment

Create a Python virtual environment to isolate project dependencies:

```bash
python -m venv venv
```

### 3. Activate the Virtual Environment

**On Windows:**

Using Command Prompt:
```cmd
venv\Scripts\activate
```

Using PowerShell:
```powershell
venv\Scripts\Activate.ps1
```

**On macOS/Linux:**
```bash
source venv/bin/activate
```

### 4. Install Dependencies

Once the virtual environment is activated, install the required packages:

```bash
pip install -r requirements.txt
```

#### Updating Dependencies

If you add new packages, update `requirements.txt` with:

```bash
pip freeze > requirements.txt
```
#### Update venv from requirements.txt
To update your virtual environment with any changes made to `requirements.txt`, run:

```bash
pip install -r requirements.txt --upgrade
```

### 5. Verify Installation

You should see `(venv)` at the beginning of your command prompt, indicating the virtual environment is active. You can now start working with the project!

### 6. Deactivating the Virtual Environment

When you're done working on the project, deactivate the virtual environment:

```bash
deactivate
```

## Working with Environment Variables (.env file)

### What is a .env file?

A `.env` file stores environment variables that contain sensitive or configuration data that should not be committed to version control (like API keys, database credentials, etc.).

### Setting up .env file

#### 1. Ensure .env is in .gitignore

The `.env` file is already included in the `.gitignore` file, which means it won't be tracked by Git. This is crucial for keeping sensitive data secure.

#### 2. Create your .env file

Create a `.env` file in the root directory of the project with the following structure:

```env
# API Keys
OPENAI_API_KEY=your_openai_api_key_here
HUGGINGFACE_API_KEY=your_huggingface_token_here

# Database Configuration
DATABASE_URL=postgresql://username:password@localhost:5432/dbname
DB_HOST=localhost
DB_PORT=5432
DB_NAME=your_database_name
DB_USER=your_username
DB_PASSWORD=your_password

# Other Configuration
DEBUG=True
LOG_LEVEL=INFO
DATA_PATH=./data/
MODEL_PATH=./models/

# Web Scraping/API Endpoints
BASE_URL=https://api.example.com
TIMEOUT=30
```

### Using Environment Variables in Python Scripts

#### Method 1: Using python-dotenv (Recommended)

First, install the python-dotenv package:

```bash
pip install python-dotenv
```

Then use it in your Python scripts:

```python
import os
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Access environment variables
api_key = os.getenv('OPENAI_API_KEY')
db_host = os.getenv('DB_HOST', 'localhost')  # 'localhost' is the default value
debug_mode = os.getenv('DEBUG', 'False').lower() == 'true'

# Example usage
if api_key:
    print("API key loaded successfully")
else:
    print("Warning: API key not found in environment variables")
```

#### Method 2: Using os.environ directly

```python
import os

# Access environment variables directly (must be set in system environment)
api_key = os.environ.get('OPENAI_API_KEY')
db_url = os.environ.get('DATABASE_URL', 'default_connection_string')

# Using os.getenv() (same as os.environ.get())
log_level = os.getenv('LOG_LEVEL', 'INFO')
```

#### Example: Complete script with error handling

```python
import os
from dotenv import load_dotenv
import sys

# Load environment variables
load_dotenv()

def get_required_env_var(var_name):
    """Get required environment variable or exit with error."""
    value = os.getenv(var_name)
    if not value:
        print(f"Error: Required environment variable '{var_name}' not found in .env file")
        sys.exit(1)
    return value

def get_optional_env_var(var_name, default_value):
    """Get optional environment variable with default value."""
    return os.getenv(var_name, default_value)

# Required variables
API_KEY = get_required_env_var('OPENAI_API_KEY')
DATABASE_URL = get_required_env_var('DATABASE_URL')

# Optional variables with defaults
DEBUG = get_optional_env_var('DEBUG', 'False').lower() == 'true'
LOG_LEVEL = get_optional_env_var('LOG_LEVEL', 'INFO')
DATA_PATH = get_optional_env_var('DATA_PATH', './data/')

print(f"Configuration loaded:")
print(f"- Debug mode: {DEBUG}")
print(f"- Log level: {LOG_LEVEL}")
print(f"- Data path: {DATA_PATH}")
print(f"- API key loaded: {'Yes' if API_KEY else 'No'}")
```

### Best Practices

1. **Never commit .env files** - Always keep them in .gitignore
2. **Use .env.example** - Provide a template for other developers
3. **Use descriptive variable names** - Make it clear what each variable is for
4. **Set sensible defaults** - Use `os.getenv('VAR', 'default')` for non-critical settings
5. **Validate required variables** - Check for essential variables at startup
6. **Document your variables** - Add comments in .env.example explaining what each variable does

## Next Steps

- Open the project in your preferred IDE (VS Code, PyCharm, Positron, etc.)
- Start exploring the course content and exercises
- Remember to activate the virtual environment each time you work on the project
- Set up your `.env` file with any required API keys or configuration values
