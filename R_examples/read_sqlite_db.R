# Reconnect and explore
# Load libraries
library(DBI)
library(RSQLite)

con <- dbConnect(RSQLite::SQLite(), "bikestore.sqlite")

# List all tables
tables <- dbListTables(con)
tables

# Check a specific table structure
dbListFields(con, tables[1])  # First table

# Query some data
dbGetQuery(con, "SELECT * FROM sales.orders LIMIT 5")

# Close connection
dbDisconnect(con)