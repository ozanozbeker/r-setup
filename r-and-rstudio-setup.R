# Packages ----
install.packages(c(
  # Meta Packages
  'tidyverse',  # Easily Install and Load the "Tidyverse" packages | https://tidyverse.tidyverse.org
  'tidymodels', # Easily Install and Load the "Tidymodels" packages | https://tidymodels.tidymodels.org/

  # Programming & Development
  'purrr',     # Functional Programming Tools | https://purrr.tidyverse.org/
  'forcats',   # Tools for Working with Categorical Variables (Factors) | https://forcats.tidyverse.org/
  'keyring',   # Package for accessing OS's credential store | https://keyring.r-lib.org/
  'fs',        # Cross-Platform File System Operations Based on 'libuv' | https://fs.r-lib.org/
  'renv',      # Project Environments | https://rstudio.github.io/renv/index.html
  'pins',      # | https://pins.rstudio.com/
  'plumber',   # | https://www.rplumber.io/
  'vetiver',   # | https://rstudio.github.io/vetiver-r/index.html

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

  # Model
  'rsample',   # General Re-sampling Infrastructure | https://rsample.tidymodels.org/
  'parsnip',   # A Common API to Modeling and Analysis Functions | https://parsnip.tidymodels.org/
  'recipes',   # Pre-processing and Feature Engineering Steps for Modeling | https://recipes.tidymodels.org/
  'workflows', # Modeling Workflows | https://workflows.tidymodels.org/
  'tune',      # Tidy Tuning Tools | https://tune.tidymodels.org/
  'yardstick', # Tidy Characterizations of Model Performance | https://yardstick.tidymodels.org/
  'broom',     # Convert Statistical Objects into Tidy Tibbles | https://broom.tidymodels.org/
  'dials',     # Tools for Creating Tuning Parameter Values | https://dials.tidymodels.org/
  'infer',     # Tidy Statistical Inference | https://infer.tidymodels.org/
  'corrr',     # Correlations in R | https://corrr.tidymodels.org/

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

# Other packages I'm interested in:
# 'profvis'  # Interactive Visualizations for Profiling R Code | https://rstudio.github.io/profvis/
# 'targets'  # Pipelining Tools in R | https://docs.ropensci.org/targets/
# 'testthat' # Unit Testing for R | https://testthat.r-lib.org
# 'usethis'  # Automate Package and Project Setup | https://usethis.r-lib.org/
# 'devtools' # Tools to Make Developing R Packages Easier | https://devtools.r-lib.org/
# 'zoo'      # S3 Infrastructure for Regular and Irregular Time Series (Z's Ordered Observations) | https://zoo.R-Forge.R-project.org/

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
