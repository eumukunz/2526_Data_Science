# create sqlite database 

# Load required libraries
library(DBI)
library(RSQLite)
library(readr)

# Function to create SQLite database from SQL files
create_bikestore_database <- function(sql_folder = "data/bikestore_db", 
                                    db_path = "bikestore.sqlite") {
  # Connect to SQLite database (creates if doesn't exist)
  con <- dbConnect(RSQLite::SQLite(), db_path)
  
  # Get all SQL files from the folder
  sql_files <- list.files(sql_folder, pattern = "\\.sql$", full.names = TRUE)
  
  if (length(sql_files) == 0) {
    stop("No SQL files found in the specified folder")
  }
  
  # Process each SQL file
  for (file in sql_files) {
    cat("Processing:", basename(file), "\n")
    
    # Read the SQL file
    sql_content <- read_file(file)
    
    # Split by semicolons to handle multiple statements
    statements <- strsplit(sql_content, ";")[[1]]
    statements <- trimws(statements)
    statements <- statements[statements != ""]
    
    # Execute each statement
    for (stmt in statements) {
      if (nchar(stmt) > 0) {
        tryCatch({
          dbExecute(con, stmt)
        }, error = function(e) {
          cat("Warning in", basename(file), ":", e$message, "\n")
        })
      }
    }
  }
  
  # List created tables
  tables <- dbListTables(con)
  cat("\nCreated tables:\n")
  print(tables)
  
  # Close connection
  dbDisconnect(con)
  
  cat("\nDatabase created successfully at:", db_path, "\n")
  return(db_path)
}

# Usage
db_file <- create_bikestore_database()