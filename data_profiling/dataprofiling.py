#%%
import pandas as pd
from ydata_profiling import ProfileReport
# import sys
# sys.path.append('databases')
from databases.connect_postgresql import load_database_data
# setuptools no longer being bundled with venvs from Python 3.12 -> pip install setuptools


#%%
# # Simple example 
# url = "https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv"
# df = pd.read_csv(url)
spelers_df = load_database_data(query="SELECT * FROM tennis.boetes;")

# Basic profiling report
profile = ProfileReport(spelers_df, title="Spelers Analysis")
profile.to_file("spelers_report.html")
print("Report saved as spelers_report.html")