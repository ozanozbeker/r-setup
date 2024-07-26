# Packages ----
install.packages(c(
  # Meta Packages
  'tidyverse',  # Easily Install and Load the "Tidyverse" packages
  'tidymodels', # Easily Install and Load the "Tidymodels" packages

  # Programming & Development
  'purrr',     # Functional Programming Tools
  'forcats',   # Tools for Working with Categorical Variables (Factors)
  'keyring',   # Package for accessing OS's credential store
  'fs',        # Cross-Platform File System Operations Based on 'libuv' 
  'renv',      # Project Environments

  # Import
  'readr',     # Read Rectangular Data | https://readr.tidyverse.org/
  'httr2',     # Perform HTTP Requests and Process the Responses | https://httr2.r-lib.org/
  'readxl',    # Read Excel Files | https://readxl.tidyverse.org/
  'rvest',     # Easily Harvest (Scrape) Web Pages | https://rvest.tidyverse.org/
  'jsonlite',  # A Simple and Robust JSON Parser and Generator for R | https://jeroen.r-universe.dev/jsonlite

  # Tidy/Transform
  'dplyr',     # A Grammar of Data Manipulation | https://dplyr.tidyverse.org/
  'tidyr',     # Tidy Messy Data | https://tidyr.tidyverse.org/
  'tibble',    # Simple Data Frames | https://tibble.tidyverse.org/
  'stringr',   # Simple, Consistent Wrappers for Common String Operations | https://stringr.tidyverse.org/
  'lubridate', # Make Dealing with Dates a Little Easier | https://lubridate.tidyverse.org/
  'janitor',   # Simple Tools for Examining and Cleaning Dirty Data | https://sfirke.github.io/janitor/index.html

  # Visualize
  'ggplot2',   # Create Elegant Data Visualizations Using the Grammar of Graphics | https://ggplot2.tidyverse.org/
  'marquee',   # | https://marquee.r-lib.org/index.html
  'gt',        # Easily Create Presentation-Ready Display Tables | https://gt.rstudio.com/
  'skimr',     # Compart and Flexible Summaries of Data | https://docs.ropensci.org/skimr/

  # Communicate
  'quarto',    # R Interface to 'Quarto' Markdown Publishing System

  # Database
  'DBI',       # R Database Interface | https://dbi.r-dbi.org/index.html
  'odbc',      # Connect to ODBC Compatible Databases (using the {DBI} Interface) | https://odbc.r-dbi.org/
  'RPostgres', 
  'dbplyr',    # A {dplyr} Back End for Databases | https://dbplyr.tidyverse.org/
  'duckdb',    # {DBI} Package for the DuckDB Database Management System | https://r.duckdb.org/
  'duckplyr'   # A DuckDB-backed Version of {dplyr} | https://duckdblabs.github.io/duckplyr/
))

install.packages(
  "rsthemes",
  repos = c(gadenbuie = 'https://gadenbuie.r-universe.dev', getOption("repos"))
)

rsthemes::install_rsthemes()

# RStudio Config ----
purrr::walk(
  .x = c('themes', 'keybindings', 'snippets'),
  .f = \(directory) stringr::str_c(Sys.getenv("APPDATA"), "/RStudio/", directory) |> fs::dir_create()
)

purrr::pwalk(
  .l = tibble::tribble(
    ~file,                   ~destination,
    'rstudio_bindings.json', paste0(Sys.getenv("APPDATA"), "/RStudio/keybindings/rstudio_bindings.json"),
    'addins.json',           paste0(Sys.getenv("APPDATA"), "/RStudio/keybindings/addins.json"),
    'r.snippets',            paste0(Sys.getenv("APPDATA"), "/RStudio/snippets/r.snippets"),
    'rstudio-prefs.json',    paste0(Sys.getenv("APPDATA"), "/RStudio/rstudio-prefs.json"),
    '.Rprofile',             paste0(Sys.getenv("R_USER"), "/Documents/.Rprofile")),
  .f = \(file, destination) fs::file_copy(path = file, new_path = destination, overwrite = TRUE)
)
