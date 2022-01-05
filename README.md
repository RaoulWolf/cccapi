
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

## Example

This is a basic example which shows you how to get the record details
for a CAS Registry Number. In this case, for aspirin:

``` r
library(cccapi)
cas_rn <- "50-78-2"
get_detail(cas_rn)
```
