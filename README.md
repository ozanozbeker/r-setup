# R & RStudio Setup
Ozan Ozbeker

# Intro

This is a hybrid blog post/README/code file where it is the actual code
file I use when I update my R environment/computer, but also I wrote
some descriptions along the way so if somebody else stumbles upon this
and likes what they see, they can copy it or maybe even find something
new that they didn’t know about before.

# r-rstudio-setup.qmd

First, we begin with this Quarto file that applies everything below. As
I write this, it feels a little 4th wall breaking, but hey that’s life
😎

## Packages

These are the packages I most frequently use, loosely grouped into the
categories below. This does not include dependency packages. So for
example, I use `quarto` to render Quarto documents via R code, but I
don’t directly use the `markdown` package myself, so it is not listed
below.

You can find the info page for each package at
`https://cran.r-project.org/web/packages/[package_name]/index.html`
where `[package_name]` is the name of the package.

<div class="code-with-filename">

**r-and-rstudio-setup.qmd**

``` r
install.packages(c(
  # Meta Packages
  'tidyverse',  # Easily Install and Load the "Tidyverse" packages | https://tidyverse.tidyverse.org
  'tidymodels', # Easily Install and Load the "Tidymodels" packages | https://tidymodels.tidymodels.org/
  
  # Programming & Development
  'purrr',    # Functional Programming Tools | https://purrr.tidyverse.org/
  'forcats',  # Tools for Working with Categorical Variables (Factors) | https://forcats.tidyverse.org/
  'keyring',  # Package for accessing OS's credential store | https://keyring.r-lib.org/
  'fs',       # Cross-Platform File System Operations Based on 'libuv' | https://fs.r-lib.org/

  # Import
  'readr',    # Read Rectangular Data | https://readr.tidyverse.org/
  'httr2',    # Perform HTTP Requests and Process the Responses | https://httr2.r-lib.org/
  'readxl',   # Read Excel Files | https://readxl.tidyverse.org/
  'rvest',    # Easily Harvest (Scrape) Web Pages | https://rvest.tidyverse.org/
  'jsonlite', # A Simple and Robust JSON Parser and Generator for R | https://jeroen.r-universe.dev/jsonlite
  
  # Tidy/Transform
  'dplyr',     # A Grammar of Data Manipulation | https://dplyr.tidyverse.org/
  'tidyr',     # Tidy Messy Data | https://tidyr.tidyverse.org/
  'tibble',    # Simple Data Frames | https://tibble.tidyverse.org/
  'stringr',   # Simple, Consistent Wrappers for Common String Operations | https://stringr.tidyverse.org/
  'lubridate', # Make Dealing with Dates a Little Easier | https://lubridate.tidyverse.org/
  'janitor',   # Simple Tools for Examining and Cleaning Dirty Data | https://sfirke.github.io/janitor/index.html 

  # Visualize
  'ggplot2', # Create Elegant Data Visualizations Using the Grammar of Graphics | https://ggplot2.tidyverse.org/
  
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
  'quarto', # R Interface to 'Quarto' Markdown Publishing System

  # Database
  'DBI',     # R Database Interface | https://dbi.r-dbi.org/index.html
  'odbc',    # Connect to ODBC Compatible Databases (using the {DBI} Interface) | https://odbc.r-dbi.org/
  'dbplyr',  # A {dplyr} Back End for Databases | https://dbplyr.tidyverse.org/
  'duckdb',  # {DBI} Package for the DuckDB Database Management System | https://r.duckdb.org/
  'duckplyr' # A DuckDB-backed Version of {dplyr} | https://duckdblabs.github.io/duckplyr/
))

# Other packages I'm interested in:
# 'profvis'  # Interactive Visualizations for Profiling R Code | https://rstudio.github.io/profvis/
# 'targets'  # Pipelining Tools in R | https://docs.ropensci.org/targets/
# 'testthat' # Unit Testing for R | https://testthat.r-lib.org
# 'usethis'  # Automate Package and Project Setup | https://usethis.r-lib.org/
# 'devtools' # Tools to Make Developing R Packages Easier | https://devtools.r-lib.org/
# 'zoo'      # S3 Infrastructure for Regular and Irregular Time Series (Z's Ordered Observations) | https://zoo.R-Forge.R-project.org/
```

</div>

After these are installed, close and open RStudio again so that the
addins from the packages also load.

## RStudio Configuration

As I’ve been using R & RStudio, I’ve learned which settings I like the
most, whether they are RStudio settings or R options, as well as some
custom snippets. This section of code takes the respective files and
copies them to where the base files for R and RStudioa are. I really
created this because of my job where we log into different virtual
machines, and I got sick of resetting all of these options by hand, so
now I just pull this repo from GitHub and run the code.

The directories don’t exist by default, they are created when you
manually change the respective settings, so this chunk takes care of
that, especially if it’s a fresh install of RStudio.

<div class="code-with-filename">

**r-and-rstudio-setup.qmd**

``` r
purrr::walk(
  .x = c('themes', 'keybindings', 'snippets'),
  .f = \(directory) stringr::str_c("C:/Users/", {Sys.info()[['user']]}, "/AppData/Roaming/RStudio/", directory) |> fs::dir_create()
)
```

</div>

Then we copy the files from this folder to their appropriate locations.

<div class="code-with-filename">

**r-and-rstudio-setup.qmd**

``` r
purrr::pwalk(
  .l = tibble::tribble(
    ~file,                   ~destination,
    'rstudio_bindings.json',  stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/keybindings/rstudio_bindings.json"),
    'addins.json',            stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/keybindings/addins.json"),
    'r.snippets',             stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/snippets/r.snippets"),
    'rstudio-prefs.json',     stringr::str_glue("C:/Users/{Sys.info()[['user']]}/AppData/Roaming/RStudio/rstudio-prefs.json"),
    '.Rprofile',              stringr::str_glue("C:/Users/{Sys.info()[['user']]}/Documents/.Rprofile")),
  .f = \(file, destination) fs::file_copy(path = file, new_path = destination, overwrite = TRUE)
)
```

</div>

## R Themes

I hate that when you use dark mode in RStudio, it’s just this dark blue
shade for the UI, not actually dark/black. Also, I’m really not a fan of
any of the themes that come with RStudio. To some extent, I think
[Garrick Aden-Buie](https://www.garrickadenbuie.com/) also agreed with
my sentiment and created this awesome package,
[{rsthemes}](https://www.garrickadenbuie.com/project/rsthemes/).

### {rthemes}

This package comes with a bunch of awesome themes that complete change
the way RStudio looks and feels, and I would recommend it to anybody
looking to modernize their RStudio interface. You can see the usage in
the docs, and the settings I’m using in my `.Rprofile`, which I talk
about below.

<div class="code-with-filename">

**r-and-rstudio-setup.qmd**

``` r
install.packages(
  "rsthemes",
  repos = c(gadenbuie = 'https://gadenbuie.r-universe.dev', getOption("repos"))
)
```

</div>

### {darkstudio}

I’m now using the {rsthemes} package, but I have to give a huge shoutout
to GitHub user [rileytwo](https://github.com/rileytwo). I used
rileytwo’s work below for more than a year, and I can’t not shout them
out.

- [{darkstudio}](https://github.com/rileytwo/darkstudio) is a package
  that turns the IDE elements to shades of black whenever you are using
  a theme with `rs-theme-is-dark: TRUE`.
- [Kiss: Keep It Stupid Simple](https://github.com/rileytwo/kiss) is a
  theme from Riley that just looks so good, it’s been my go to for over
  a year now.

If either of these interest you, please go check them out as they have
been the staple to my R experience and I like to support the creator as
best as I can.

<div class="code-with-filename">

**r-and-rstudio-setup.qmd**

``` r
devtools::install_github('rileytwo/darkstudio')
darkstudio::activate() # This requires admin privileges
```

</div>

# .Rprofile

The `.Rprofile` file is an R script that runs each time R starts up that
lets you to customize your R environment. It can be used to set global
options, load packages, define functions, and customize the R startup
process. Or in my case, have some fun 😁

## Options

`options()` lets you set the global options for R. All of them have a
default, and these are the ones I’ve changed for my preference. You can
use `?options` to view the full list.

<div class="code-with-filename">

**.Rprofile**

``` r
options(
  scipen = 999999,               # A penalty to be applied to turning regular values to scientific notation
  setWidthOnResize = TRUE,       # If set and TRUE, the terminal resize when the terminal pane is resized
  useFancyQuotes = FALSE,        # Turn off fancy quotes
  warn = 1,                      # Prints warnings as they happen instead of when the top function ends.
  warnPartialMatchArgs = TRUE,   # Warns if partial matching is used in argument matching.
  warnPartialMatchAttr = TRUE,   # Warns if partial matching is used in extracting attributes via attr.
  warnPartialMatchDollar = TRUE, # Warns if partial matching is used for extraction by $.
  prompt = 'R> ',                # This is complete personal preference
  continue = '+> ',              # This is complete personal preference
  rsthemes.theme_light = "Elm light {rsthemes}",
  rsthemes.theme_dark = "Elm dark {rsthemes}",
  rsthemes.theme_favorite = "Elm dark {rsthemes}"
)
```

</div>

## R Completion Options

The `rc.settings` function is part of the utils package in R, which
configures settings for the R completion mechanism. It can enable or
disable specific completion features like inter-package completion,
function argument completion, and fuzzy matching. You can use
`?rc.settings` to view the full list.

1.  `ipck` (Inter-Package Completion):

    - Description: This option enables or disables completion of object
      names across all loaded packages.
    - Explanation: If you work with multiple packages, you can quickly
      access functions and objects from any loaded package without
      having to remember which package they belong to.

2.  `func` (Function Argument Completion):

    - Description: This option enables or disables completion of
      function argument names.
    - Explanation: This helps you to write function calls more
      efficiently by providing argument suggestions, reducing the need
      to look up function documentation frequently.

3.  `fuzzy` (Fuzzy Matching):

    - Description: This option enables or disables fuzzy matching for
      completion.
    - Explanation: This is useful when you cannot recall the exact name
      of a function or object. Fuzzy matching will suggest completions
      that closely resemble what you have typed, saving time and
      reducing frustration.

In short, the more help I can get coding, the better 😁

<div class="code-with-filename">

**.Rprofile**

``` r
rc.settings(ipck = TRUE, func = TRUE, fuzzy = TRUE)
```

</div>

## Interactive Sessions

You can use this code section if you want things to enable in an
interactive session, like auto-loading certain packages. Some people use
it to load packages that they always use, like `tidyverse`, `usethis`,
`devtools`, and so on, but I’m in the camp that every script should be
very explicit in what packages are being used, so I use this feature to
have some fun.

If in an interactive session, this code will output my message in the
console everytime R starts. I’ve always wanted my own
[J.A.R.V.I.S.](https://en.wikipedia.org/wiki/J.A.R.V.I.S.), R is close
enough 🥲

<div class="code-with-filename">

**.Rprofile**

``` r
if (interactive()) {
  message("Welcome Mr. Ozbeker, how may I be of assistance?")
}
```

</div>

# r.snippets & rstudio_bindings.json

RStudio lets you add custom snippets (pieces of code that can be quickly
inserted, useful for repetitive code) and key bindings that can really
help your code flow if you use them. For both files, I only added one
thing, but they’ve really improved my coding experience.

<div class="code-with-filename">

**r.snippets**

``` r
snippet user
  user = Sys.info()[['user']]
```

</div>

<div class="code-with-filename">

**rstudio_bindings.json**

``` json
{
    "insertPipeOperator": "Ctrl+\\"
}
```

</div>

RStudio uses a separate file for key bindings for addins, and the
{rsthemes} package comes with a feature for toggling from light and dark
modes, and a recommended key binding to follow:

<div class="code-with-filename">

**addins.json**

``` json
{
    "rsthemes::use_theme_toggle": "Ctrl+Alt+D"
}
```

</div>
