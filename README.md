
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cccapi <img src="man/figures/logo.svg" align="right" height="139" />

<!-- badges: start -->

[![R-CMD-check](https://github.com/RaoulWolf/cccapi/workflows/R-CMD-check/badge.svg)](https://github.com/RaoulWolf/cccapi/actions)
[![Codecov test
coverage](https://codecov.io/gh/RaoulWolf/cccapi/branch/master/graph/badge.svg)](https://app.codecov.io/gh/RaoulWolf/cccapi?branch=master)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

> A [ZeroPM](https://zeropm.eu/) R package

The goal of the cccapi package is to provide a minimal and lightweight
interface to the [CAS Common
Chemistry](https://commonchemistry.cas.org/) API services. To get access
to the API services, you need to register at
<https://www.cas.org/services/commonchemistry-api>.

The dependencies of cccapi are kept at a bare minimum:
[curl](https://cran.r-project.org/web/packages/curl/index.html) for
handling the API requests and
[jsonlite](https://cran.r-project.org/web/packages/jsonlite/index.html)
to parse data from JSON format.

## Installation

You can install the development version of cccapi from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("ZeroPM-H2020/cccapi")
```

## Examples

The following examples show the functionality of the three API functions
of cccapi: `get_detail()`, `get_export()`, and `get_search()`.

This is an example which shows you how to get the record details for a
CAS Registry Number. In this case, for
[atrazine](https://en.wikipedia.org/wiki/Atrazine):

``` r
library(cccapi)
atz_det <- get_detail("1912-24-9")
str(atz_det)
#> List of 15
#>  $ uri                   : chr "substance/pt/1912249"
#>  $ rn                    : chr "1912-24-9"
#>  $ name                  : chr "Atrazine"
#>  $ image                 : chr "<svg width=\"181.11\" viewBox=\"0 0 6037 4324\" text-rendering=\"auto\" stroke-width=\"1\" stroke-opacity=\"1\""| __truncated__
#>  $ inchi                 : chr "InChI=1S/C8H14ClN5/c1-4-10-7-12-6(9)13-8(14-7)11-5(2)3/h5H,4H2,1-3H3,(H2,10,11,12,13,14)"
#>  $ inchiKey              : chr "InChIKey=MXWJVTOOROXGIU-UHFFFAOYSA-N"
#>  $ smile                 : chr "N(C(C)C)C=1N=C(NCC)N=C(Cl)N1"
#>  $ canonicalSmile        : chr "ClC=1N=C(N=C(N1)NC(C)C)NCC"
#>  $ molecularFormula      : chr "C<sub>8</sub>H<sub>14</sub>ClN<sub>5</sub>"
#>  $ molecularMass         : chr "215.68"
#>  $ experimentalProperties:'data.frame':  2 obs. of  3 variables:
#>   ..$ name        : chr [1:2] "Melting Point" "Density"
#>   ..$ property    : chr [1:2] "175-177 Â°C" "1.23 g/cm<sup>3</sup> @ Temp: 22 Â°C"
#>   ..$ sourceNumber: int [1:2] 1 1
#>  $ propertyCitations     :'data.frame':  1 obs. of  3 variables:
#>   ..$ docUri      : chr ""
#>   ..$ sourceNumber: int 1
#>   ..$ source      : chr "Hazardous Substances Data Bank data were obtained from the National Library of Medicine (US)"
#>  $ synonyms              : chr [1:71] "1,3,5-Triazine-2,4-diamine, 6-chloro-<em>N</em><sup>2</sup>-ethyl-<em>N</em><sup>4</sup>-(1-methylethyl)-" "<em>s</em>-Triazine, 2-chloro-4-(ethylamino)-6-(isopropylamino)-" "1,3,5-Triazine-2,4-diamine, 6-chloro-<em>N</em>-ethyl-<em>N</em>â\200²-(1-methylethyl)-" "6-Chloro-<em>N</em><sup>2</sup>-ethyl-<em>N</em><sup>4</sup>-(1-methylethyl)-1,3,5-triazine-2,4-diamine" ...
#>  $ replacedRns           : chr [1:6] "11121-31-6" "12040-45-8" "12797-72-7" "39400-72-1" ...
#>  $ hasMolfile            : logi TRUE
```

Here is an example which shows you how to get the MOL file for a CAS
Registry Number. In this case, again, for atrazine:

``` r
atz_exp <- get_export("1912-24-9")
str(atz_exp)
#>  chr "Atrazine\nC8H14ClN5\n1912-24-9 Copyright (C) 2021 ACS\n 14 14  0  0  0  0  0  0  0  0999 V2000\n    8.0021    0"| __truncated__
```

And finally, here is an example which shows you how to search for CAS
Registry Numbers with a partial name. See `?get_search` for details on
the available search options!

``` r
atz_src <- get_search("atrazin*")
str(atz_src)
#> List of 2
#>  $ count  : int 12
#>  $ results:'data.frame': 12 obs. of  3 variables:
#>   ..$ rn   : chr [1:12] "1007-28-9" "1912-24-9" "2163-68-0" "39324-65-7" ...
#>   ..$ name : chr [1:12] "Deisopropylatrazine" "Atrazine" "Hydroxyatrazine" "1,3,5-Triazine-2,4-diamine, 6-chloro-<em>N</em>-ethyl-<em>N</em>â\200²-(1-methylethyl)-, mixt. with <em>N</em>-"| __truncated__ ...
#>   ..$ image: chr [1:12] "<svg width=\"178.77\" viewBox=\"0 0 5959 4052\" text-rendering=\"auto\" stroke-width=\"1\" stroke-opacity=\"1\""| __truncated__ "<svg width=\"181.11\" viewBox=\"0 0 6037 4324\" text-rendering=\"auto\" stroke-width=\"1\" stroke-opacity=\"1\""| __truncated__ "<svg width=\"178.77\" viewBox=\"0 0 5959 4324\" text-rendering=\"auto\" stroke-width=\"1\" stroke-opacity=\"1\""| __truncated__ "" ...
```

## Acknowledgement

This R package was developed by the EnviData initiative at the
[Norwegian Geotechnical Institute (NGI)](https://www.ngi.no/eng) as part
of the project [ZeroPM: Zero pollution of Persistent, Mobile
substances](https://zeropm.eu/). This project has received funding from
the European Union’s Horizon 2020 research and innovation programme
under grant agreement No 101036756.

------------------------------------------------------------------------

If you find this package useful and can afford it, please consider
making a donation to a humanitarian non-profit organization, such as
[Sea-Watch](https://sea-watch.org/en/). Thank you.
