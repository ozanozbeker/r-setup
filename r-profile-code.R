# Note: I saved this as an R script so the syntax highlighting stays.
# Having a .Rprofile file in the project directory takes precedence over the user
# Use usethis::edit_r_profile() to open the user .Rprofile file and copy the contents
# below into it.

# My Options Preferences ----
options(
  # Base R
  scipen = 999999,               # A penalty to be applied to turning regular values to scientific notation
  setWidthOnResize = TRUE,       # If set and TRUE, the terminal resize when the terminal pane is resized
  useFancyQuotes = FALSE,        # Turn off fancy quotes
  warn = 1,                      # Prints warnings as they happen instead of when the top function ends
  warnPartialMatchArgs = TRUE,   # Warns if partial matching is used in argument matching
  warnPartialMatchAttr = TRUE,   # Warns if partial matching is used in extracting attributes via attr
  warnPartialMatchDollar = TRUE, # Warns if partial matching is used for extraction by $
  prompt = 'R> ',                # Personal preference
  continue = '+> ',              # Personal preference

  # {rsthemes}
  rsthemes.theme_light = "Elm light {rsthemes}",
  rsthemes.theme_dark = "Elm dark {rsthemes}",

  # {renv}
  renv.config.pak.enabled = TRUE
)

# R Completion Options ----
utils::rc.settings(
  ipck = TRUE, # Enables completion of installed package names inside library() and require()
  func = TRUE, # Enables detection of functions. Might not work great on low end computers.
  fuzzy = TRUE # Enables fuzzy matching, where close but non-exact matches are considered if no exact matches are found
)

# Custom Functions ----
# A {pak} version of update.packages()
update_packages = function() {
  pak::pkg_install(
    pkg = unname(old.packages()[, "Package"]),
    upgrade = TRUE
  )
}

# Interactive Code ----
# Use this code section if you want things to enable in an interactive session,
# like auto-loading certain packages
if (interactive()) {
  message("Welcome Mr. Ozbeker, how may I be of assistance?")
}
