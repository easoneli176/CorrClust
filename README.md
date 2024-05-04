
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Numpute

<!-- badges: start -->
<!-- badges: end -->

The goal of CorrClust is to find groups (clusters) of correlated
variables within a dataset.

## Installation

You can install the development version of Numpute from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("easoneli176/CorrClust")
```

## Example

First, the CorrTab function makes finding the correlations between
numeric columns simple. Note that if a row value is missing in one
vector, that row will be cut from the pairwise correlation calculation.

``` r
library(CorrClust)

mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#> Warning in data.frame(pred1 = rep(1:4, 10), pred2 = rep(1:5, 8), missvar =
#> as.numeric(c("NA", : NAs introduced by coercion
CorrTab(mock_data)
#>         pred1 pred2     missvar
#> pred1       1     0 -0.40883816
#> pred2      NA     1  0.07647191
#> missvar    NA    NA  1.00000000
```

The CorrClust function goes one step further and uses this table to
cluster the columns into groups. The user can decide the threshold for
how highly variables must be correlated to be grouped.

``` r
CorrClust(mock_data,.4)
#>         Cluster
#> pred1         1
#> pred2         2
#> missvar       1
```

Finally, if for some reason you wish to use correlations calcualted
differently than the base R package, you can use a table of correlation
values as input in CorrClust2

``` r
CorrClust2(CorrTab(mock_data),.4)
#>         Cluster
#> pred1         1
#> pred2         2
#> missvar       1
```
