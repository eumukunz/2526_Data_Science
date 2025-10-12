# 2526_Data_Science
Data Science course content

## Getting Started

Follow these steps to set up the repository on your local machine:

### 1. Clone the Repository

**Where to execute these commands in Positron:**
- Press `Ctrl + `` (backtick) to open the integrated terminal, or
- Go to `Terminal` → `New Terminal` from the menu, or
- Use `View` → `Terminal`

```bash
git clone https://github.com/dannyvolkaerts/2526_Data_Science.git
cd 2526_Data_Science
```

*Note: If you're already viewing this README in Positron, you've likely already cloned the repository and can skip this step.*

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

*Note: If `requirements.txt` doesn't exist yet, you can create it by installing packages manually and then generating it with:*
```bash
pip freeze > requirements.txt
```

### 5. Set Up Environment Variables

Create a `.env` file in the root directory to store sensitive configuration data:

```bash
# Create the .env file (Windows Command Prompt)
echo. > .env

# Or using PowerShell
New-Item -Path ".env" -ItemType File
```

### 6. Verify Installation

You should see `(venv)` at the beginning of your command prompt, indicating the virtual environment is active. You can now start working with the project!

### Deactivating the Virtual Environment

When you're done working on the project, deactivate the virtual environment:

```bash
deactivate
```

## R Environment Management with renv

For R projects, this repository uses the `renv` package to manage package dependencies and create reproducible environments.

### What is renv?

`renv` is R's dependency management tool that creates isolated, portable, and reproducible environments for R projects. It's similar to Python's virtual environments but designed specifically for R.

**Key Benefits:**
- **Isolation**: Each project has its own private package library
- **Reproducibility**: Lock file ensures everyone uses the same package versions
- **Portability**: Easy to share and collaborate on projects
- **Restoration**: Quickly recreate the exact environment on any machine

### Setting up renv

#### 1. Install renv (if not already installed)

Open R or Positron and run:

```r
# Install renv from CRAN
install.packages("renv")
```

#### 2. Initialize renv in your project

Navigate to your project directory in R and initialize renv:

```r
# Initialize renv in the current project
renv::init()
```

This will:
- Create a private package library for your project
- Create an `renv.lock` file recording package versions
- Create an `.Rprofile` file to automatically activate renv
- Create an `renv/` directory with project settings

#### 3. Install packages in the renv environment

Install packages as you normally would:

```r
# Install packages - they'll go to the project-specific library
install.packages(c("tidyverse", "ggplot2", "dplyr", "readr"))
install.packages(c("rmarkdown", "knitr", "plotly"))

# For data science packages
install.packages(c("caret", "randomForest", "e1071"))
```

#### 4. Snapshot your environment

After installing packages, create a snapshot:

```r
# Save the current state of your project library
renv::snapshot()
```

This updates the `renv.lock` file with current package versions.

### Working with renv

#### Restore an environment

When someone else (or you on another machine) opens the project:

```r
# Restore packages from renv.lock
renv::restore()
```

#### Check project status

```r
# Check if packages are in sync with renv.lock
renv::status()
```

#### Update packages

```r
# Update a specific package
renv::install("ggplot2")

# Update all packages to latest versions
renv::update()

# Snapshot after updates
renv::snapshot()
```

#### Remove packages

```r
# Remove a package
renv::remove("package_name")

# Clean up unused packages
renv::clean()
```

### renv Workflow

Here's a typical workflow when working with renv:

```r
# 1. Open your R project (renv activates automatically)
# 2. Install new packages as needed
install.packages("new_package")

# 3. Work on your analysis/code
# Your R scripts here...

# 4. Before committing changes, snapshot your environment
renv::status()  # Check what's changed
renv::snapshot()  # Save current state

# 5. Commit both your code AND renv.lock to version control
```

### Important renv Files

## Next Steps

- Open the project in your preferred IDE (VS Code, PyCharm, Positron, etc.)
- For R projects, ensure renv is initialized and packages are restored
- For Python projects, activate the virtual environment and install dependencies
- Set up your `.env` file with any required API keys or configuration values
- Start exploring the course content and exercises
- Remember to activate the appropriate environment each time you work on the projectg code
4. **Use `renv::restore()` when joining a project** - Sets up the exact environment
5. **Document package purposes** - Add comments about why packages are needed

### Common renv Commands

```r
# Project management
renv::init()          # Initialize renv in project
renv::activate()      # Activate renv (usually automatic)
renv::deactivate()    # Deactivate renv

# Package management
renv::install()       # Install packages
renv::remove()        # Remove packages
renv::update()        # Update packages
renv::restore()       # Restore from lockfile
renv::snapshot()      # Save current state

# Status and diagnostics
renv::status()        # Check project status
renv::diagnostics()   # Detailed system info
renv::dependencies()  # List project dependencies
```

### Troubleshooting renv

**Problem: Package installation fails**
```r
# Try installing from different sources
renv::install("package_name", repos = "https://cran.rstudio.com/")

# Or force reinstall
renv::install("package_name", force = TRUE)
```

**Problem: Environment seems broken**
```r
# Rebuild the environment from scratch
renv::restore(clean = TRUE)
```

**Problem: renv not activating**
```r
# Manually activate
renv::activate()

# Check if .Rprofile exists and contains renv activation code
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
