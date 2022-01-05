
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cccapi

<!-- badges: start -->

[![R-CMD-check](https://github.com/RaoulWolf/cccapi/workflows/R-CMD-check/badge.svg)](https://github.com/RaoulWolf/cccapi/actions)
<!-- badges: end -->

The goal of cccapi is to provide a minimal interface to the CAS Common
Chemistry API services
(<https://www.cas.org/services/commonchemistry-api>).

## Installation

You can install the development version of cccapi from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
remotes::install_github("RaoulWolf/cccapi")
```

## Examples

This is an example which shows you how to get the record details for a
CAS Registry Number. In this case, for aspirin:

``` r
library(cccapi)
cas_rn <- "50-78-2"
get_detail(cas_rn)
```

Here is an example which shows you how to get the SDF file for a CAS
Registry Number. In this case, again, for aspirin:

``` r
library(cccapi)
cas_rn <- "50-78-2"
get_export(cas_rn)
```

And finally, here is an example which shows you how to search for CAS
Registry Numbers with a partial name. See `?get_search` for details on
the available search options!

``` r
library(cccapi)
q <- "Aspir*"
get_search(q)
```
