# Script: R & RStudio Setup
# Author: Ozan Ozbeker

# Packages ----
# These are the packages I use frequently, loosely grouped into the categories below:
install.packages(c(
  # Meta Packages
  'tidyverse',  # Easily Install and Load the "Tidyverse" packages | https://tidyverse.tidyverse.org
  'tidymodels', # Easily Install and Load the "Tidymodels" packages | https://tidymodels.tidymodels.org/
  
  # Programming & Development
  'devtools', # Tools to Make Developing R Packages Easier | https://devtools.r-lib.org/
  'usethis',  # Automate Package and Project Setup | https://usethis.r-lib.org/
  'keyring',  # Package for accessing OS's credential store | https://keyring.r-lib.org/
  'fs'        # Provides functions to manage files & directories using tidy principles like tibbles, tidy-paths, etc.

  # Import

  # Tidy/Transform

  # Visualize

  # Model

  # Communicate

  # Database
  
  # Fun
  
))

# Other packages I'm interested in:
# 'targets'   # Pipelining Tools in R | https://docs.ropensci.org/targets/

# RStudio IDE Config ----
# Turns the IDE black:
devtools::install_github('rileytwo/darkstudio')
darkstudio::activate() # Must be running with admin privileges, Run & restart RStudio

# Copy my favorite theme into the theme folder
fs::file_copy(
  path = 'KISS - OZBEKER.rstheme',
  new_path = stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/themes/KISS - OZBEKER.rstheme"),
  overwrite = TRUE
)

# Apply my preferred keybindings
fs::file_copy(
  path = 'rstudio_bindings.json',
  new_path = stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/keybindings/rstudio_bindings.json"),
  overwrite = TRUE
)

# Apply my preferred RStudio Settings
fs::file_copy(
  path = 'rstudio-prefs.json', 
  new_path = stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/rstudio-prefs.json"), 
  overwrite = TRUE
)

# Apply my preferred R Snippets
fs::file_copy(
  path = 'r.snippets', 
  new_path = stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/snippets/r.snippets"), 
  overwrite = TRUE
)

# Apply my preferred .Rprofile config
fs::file_copy(
  path = '.Rprofile', 
  new_path = stringr::str_glue("C:/Users/{Sys.info()[['user']]}/Documents/.Rprofile"), 
  overwrite = TRUE
)

