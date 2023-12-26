# Use this code section if you want things to enable in an interactive session, like auto-loading certain packages
if (interactive()) {
  # require(devtools)
  require(usethis)
}

# Options I like, ?options to view more
options(
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

# ipck, func, & fuzzy are turned off by default. Check out ?utils::rc.settings for more details
utils::rc.settings(
  ipck = TRUE, # Auto-complete package names in require() and library() calls
  func = TRUE, # Enables detection of functions
  fuzzy = TRUE # Enables fuzzy matching, where close but non-exact matches are considered if exact matches are not found
)
