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
  'gh',       # Interacts with GitHub via its REST API | https://gh.r-lib.org/
  
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
if (fs::file_exists('rstudio-prefs.json')) {
  print("rstudio-prefs.json exists, copying to user's RStudio directory")
  fs::file_copy('rstudio-prefs.json', "C:/Users/OzanO/AppData/Roaming/RStudio/rstudio-prefs.json", overwrite = TRUE)
} else {
  # Open rstudio-prefs.json
  usethis::edit_rstudio_prefs()

  # COPY TO `rstudio-prefs.json` FILE
  # END OF COPYING
}

# Add preferred r.snippets
if (fs::file_exists('r.snippets')) {
  print("r.snippets exists, copying to user's RStudio directory")
  fs::file_copy('r.snippets', "C:/Users/OzanO/AppData/Roaming/RStudio/snippets/r.snippets", overwrite = TRUE)
  usethis::edit_rstudio_snippets()
} else {
  # Open r.snippets
  usethis::edit_rstudio_snippets()

  # COPY TO `rstudio-prefs.json` FILE
  # END OF COPYING
}

# .Rprofile Config ----
if (fs::file_exists('.Rprofile')) {
  print(".Rprofile exists, copying to user's Documents")
  fs::file_copy('.Rprofile', "C:/Users/OzanO/Documents/.Rprofile", overwrite = TRUE)
  usethis::edit_r_profile()
} else {
  # Open .Rprofile
  usethis::edit_r_profile()

  # COPY TO `.Rprofile` FILE
  if (interactive()) { # Use this code section if you want things to enable in an interactive session, like auto-loading certain packages
    require(usethis)
  }

  options( # Options I like, ?options to view more
    # Base
    scipen = 999999,               # A penalty to be applied to turning regular values to scientific notation
    setWidthOnResize = TRUE,       # If set and TRUE, the terminal resize when the terminal pane is resized
    useFancyQuotes = FALSE,        # Turn off fancy quotes
    warn = 2,                      # Turns warnings into errors. The idea is, if you really want to suppress a warning, silence it with suppressWarnings() and explain why
    warnPartialMatchAttr = TRUE,   # Warn on partial matching for the attr() function
    warnPartialMatchDollar = TRUE, # Warn on partial matches for $ operator
    warnPartialMatchArgs = TRUE,   # Warn on partial matches for function argument names

    # Usethis
    usethis.full_name = 'Ozan Ozbeker',
    usethis.protocol = 'https',
    usethis.destdir = 'C:/Users/OzanO/Code'
  )

  utils::rc.settings( # ipck, func, & fuzzy are turned off by default. Check out ?utils::rc.settings for more details
    ipck = TRUE, # Auto-complete package names in require() and library() calls
    func = TRUE, # Enables detection of functions
    fuzzy = TRUE # Enables fuzzy matching, where close but non-exact matches are considered if exact matches are not found
  )
  # END OF COPYING
}

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
