# cccapi 0.1.3 (2022-04-11)

* Vectorized the `.check_cas()` function.  

# cccapi 0.1.2 (2022-03-22)

* Safer queries in `get_search()` *via* `utils::URLencode()`.
* Updated "Get started" vignette. 
* Minor (non-functional) code cosmetics.

# cccapi 0.1.1 (2022-01-26)

* Fixed a bug when searching for SMILES with URL-problematic characters. 

# cccapi 0.1.0 (2022-01-19)

* Minor bugfixes.

# cccapi 0.0.4 (2022-01-07)

* Added logo to GitHub README.
* Removed ghost parameters from `get_detail()` and `get_search()`.
* Updated tests to reflect the removal of ghost parameters in `get_detail()` 
  and `get_search()`.

# cccapi 0.0.3 (2022-01-07)

* Added logical `json` parameter to `get_detail()` and `get_search()` to 
  retrieve the original JSON as returned from the API (*i.e.*, skipping the 
  `jsonlite::from_json()` parsing). The default value is `FALSE`. 
* Added the "Get Started with cccapi" vignette to demonstrate a basic workflow.

# cccapi 0.0.2 (2022-01-06)

* Basic support for the three main functions: `get_detail()`, `get_export()`
  and `get_search()`. 
* Implemented internal functionality to sanity-check CAS Registry Numbers 
  before running queries: `.check_cas()`.  
* Added continuous integration *via* GitHub Actions.
* Added tests via {tinytest} and added it to suggestions.
* Added coverage via {covr} and added it to suggestions.
* Added {magick} and {rsvg} to suggestions to work with SVG files. 
* Added life cycle badge

# cccapi 0.0.1 (2022-01-05)

* Added a `NEWS.md` file to track changes to the package.
