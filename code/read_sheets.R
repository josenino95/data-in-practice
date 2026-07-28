library(googlesheets4)
library(dplyr)
library(purrr)

# Deauthorize to allow access to public Google Sheets without requiring interactive authentication
gs4_deauth()

# Google Sheets URL
sheets_url <- "https://docs.google.com/spreadsheets/d/1x_p4mg8aFhJfMcnQhQde0ef0Kmk9N-_FYk7GPkLa0kU/edit?gid=1681383745#gid=1681383745"

# Get all sheet names from the Google Spreadsheet
all_sheets <- sheet_names(sheets_url)

# Filter out "ReferenceSheet"
sheets_to_read <- all_sheets[all_sheets != "ReferenceSheet"]

# Read each sheet into a named list of data frames
sheets_data <- map(sheets_to_read, ~ read_sheet(sheets_url, sheet = .x)) %>%
  set_names(sheets_to_read)

# Combine/join all sheet data into a single table
combined_data <- bind_rows(sheets_data, .id = "pollster")

# Save to CSV
write.csv(combined_data, file = "data/combined_data.csv")

