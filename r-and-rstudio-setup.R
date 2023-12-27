# Script: RStudio Initial Setup
# Author: Ozan Ozbeker

# Packages ----
# These are the packages I use frequently, loosely grouped into the categories below:
install.packages(c(
  # Meta Packages
  'tidyverse', # Easily Install and Load the 'Tidyverse' | https://tidyverse.tidyverse.org
  'tidymodels',

  # Programming & Development
  'devtools', # Tools to Make Developing R Packages Easier | https://devtools.r-lib.org/
  'usethis',  # Automate Package and Project Setup | https://usethis.r-lib.org/
  'keyring',  # Package for accessing OS's credential store | https://keyring.r-lib.org/
  'fs',       # Provides functions to manage files & directories using tidy principles like tibbles, tidy-paths, etc.
  'gert',     # Interacts with GitHub as a Git server, using HTTPS or SSH protocol | https://docs.ropensci.org/gert/
  'gh'       # Interacts with GitHub via its REST API | https://gh.r-lib.org/
  
  # Import

  # Tidy/Transform

  # Visualize

  # Model

  # Communicate

  # Database

))

# Other packages I'm interested in:
# 'callr' | https://callr.r-lib.org/
# 'targets' | https://docs.ropensci.org/targets/
# 'crew' | (not sure what this does but mentioned in 'targets'), https://wlandau.github.io/crew/

# RStudio IDE Config ----
# Turns the IDE black:
devtools::install_github('rileytwo/darkstudio')
darkstudio::activate() # Must be running with admin privileges, Run & restart RStudio

# Apply preferred RStudio Settings
if (fs::file_exists('rstudio-prefs.json')) fs::file_copy('rstudio-prefs.json', "C:/Users/OzanO/AppData/Roaming/RStudio/rstudio-prefs.json", overwrite = TRUE) else usethis::edit_rstudio_prefs()

# Add preferred r.snippets
if (fs::file_exists('r.snippets')) fs::file_copy('r.snippets', "C:/Users/OzanO/AppData/Roaming/RStudio/snippets/r.snippets", overwrite = TRUE) else usethis::edit_rstudio_snippets()

# Add preferred .Rprofile config
if (fs::file_exists('.Rprofile')) fs::file_copy('.Rprofile', "C:/Users/OzanO/Documents/.Rprofile", overwrite = TRUE) else usethis::edit_r_profile()

# Git Setup ----
# Install https://git-for-windows.github.io/

# Initial Check
usethis::git_sitrep()
usethis::gh_token_help()

# Config as needed
usethis::use_git_config(user.name = 'ozanozbeker', user.email = 'ozanozbeker99@outlook.com')
usethis::git_vaccinate()
usethis::git_default_branch_configure(name = 'main')
usethis::create_github_token(description = 'OZAN-XPS17') # Edit for taste
gitcreds::gitcreds_set()
gh::gh_whoami()
keyring::key_set_with_value(service = 'github', username = 'PAT: OZAN-XPS17', password = NA) # Put PAT here
keyring::key_list()

# Final Check
usethis::git_sitrep()
