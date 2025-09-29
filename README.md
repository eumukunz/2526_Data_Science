# 2526_Data_Science
Data Science course content

## Getting Started

Follow these steps to set up the repository on your local machine:

### 1. Clone the Repository

```bash
git clone https://github.com/dannyvolkaerts/2526_Data_Science.git
cd 2526_Data_Science
```

*Replace `yourusername` with the actual GitHub username/organization name.*

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

### 5. Verify Installation

You should see `(venv)` at the beginning of your command prompt, indicating the virtual environment is active. You can now start working with the project!

### Deactivating the Virtual Environment

When you're done working on the project, deactivate the virtual environment:

```bash
deactivate
```

## Next Steps

- Open the project in your preferred IDE (VS Code, PyCharm, Positron, etc.)
- Start exploring the course content and exercises
- Remember to activate the virtual environment each time you work on the project
