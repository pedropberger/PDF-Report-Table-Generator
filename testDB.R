library(readr)
library(DBI)
library(RSQLite)

# Define the directory path containing the CSV files
directory <- "data/areafim/"

# Define the SQLite database name and connection
db_name <- "areafim.db"
conn <- dbConnect(RSQLite::SQLite(), dbname = db_name)

  # Loop through all CSV files in the directory
  file = "atividades.csv"
  # Read the CSV file into a data frame
  df <- read_delim(file.path(directory, file), delim = ";")
  # Use the file name without the extension as the table name
  table_name <- sub("\\.csv$", "", file)
  print('foi 1')
  
  # Insert the data frame as a table into the SQLite database
  dbWriteTable(conn, table_name, df, overwrite = TRUE)
  
  
  file = "funcao.csv"
  # Read the CSV file into a data frame
  df <- read_delim(file.path(directory, file), delim = ",")
  # Use the file name without the extension as the table name
  table_name <- sub("\\.csv$", "", file)
  print('foi 2')
  
  # Insert the data frame as a table into the SQLite database
  dbWriteTable(conn, table_name, df, overwrite = TRUE)
  
  
  file = "orgao.csv"
  # Read the CSV file into a data frame
  df <- read_delim(file.path(directory, file), delim = ",")
  # Use the file name without the extension as the table name
  table_name <- sub("\\.csv$", "", file)
  print('foi 3')
  
  # Insert the data frame as a table into the SQLite database
  dbWriteTable(conn, table_name, df, overwrite = TRUE)
  
  
  file = "promotor.csv"
  # Read the CSV file into a data frame
  df <- read_delim(file.path(directory, file), delim = ",")
  # Use the file name without the extension as the table name
  table_name <- sub("\\.csv$", "", file)
  print('foi 4')
  
  # Insert the data frame as a table into the SQLite database
  dbWriteTable(conn, table_name, df, overwrite = TRUE)

  file = "movimento.csv"
  # Read the CSV file into a data frame
  df <- read_delim(file.path(directory, file), delim = ",")
  # Use the file name without the extension as the table name
  table_name <- sub("\\.csv$", "", file)
  print('foi 4')
  
  # Insert the data frame as a table into the SQLite database
  dbWriteTable(conn, table_name, df, overwrite = TRUE)

# Close the database connection
dbDisconnect(conn)

print('fim')
