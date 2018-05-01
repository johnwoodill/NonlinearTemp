## nonlineartempr

https://travis-ci.org/johnwoodill/nonlineartempr.svg?branch=master
# ![](https://img.shields.io/R/v3.4.3.png?color=red)
# ![](https://img.shields.io/license/MIT.png?color=blue)


Overview
--------
`nonlineartempr` calculates nonlinear temperature distributions using an integrated sine technique. Degree days define time above a specified temperature threshold (e.g. degree days above 30C) and time in each degree define time within a specified temperature threshold (e.g. time in 30C).

-   `degree_days()`: calculates degree days within a specified thresholds
-   `degree_time()`: calculates time in each degree at one degree intervals within a specified thresholds.

Installation
------------

``` r
# Install through devtools:install_github()

# install.packages("devtools")
devtools::install_github("johnwoodill/nonlineartempr")
```

Usage
-----

``` r
library(nonlineartempr)

# Load Napa County, CA data
data(napa)

# Degree Days
dd_napa <- degree_days(napa, thresholds = c(0:35))
head(dd_napa)
        date year month day fips      county state  lat   long    tmax   tmin    tavg  dday0C  dday1C
#> 1 1899-12-15 1899    12  15 6055 Napa County    CA 38.5 -122.5 12.5000 4.1100 8.30500 8.30500 7.30500
#> 2 1899-12-16 1899    12  16 6055 Napa County    CA 38.5 -122.5 12.5445 4.2894 8.41695 8.41695 7.41695
#> 3 1899-12-17 1899    12  17 6055 Napa County    CA 38.5 -122.5 12.5878 4.4574 8.52260 8.52260 7.52260
#> 4 1899-12-18 1899    12  18 6055 Napa County    CA 38.5 -122.5 12.6298 4.6144 8.62210 8.62210 7.62210
#> 5 1899-12-19 1899    12  19 6055 Napa County    CA 38.5 -122.5 12.6706 4.7604 8.71550 8.71550 7.71550
#> 6 1899-12-20 1899    12  20 6055 Napa County    CA 38.5 -122.5 12.7103 4.8959 8.80310 8.80310 7.80310
#>    dday2C  dday3C  dday4C  dday5C  dday6C  dday7C  dday8C  dday9C dday10C dday11C dday12C dday13C
#> 1 6.30500 5.30500 4.30500 3.42938 2.69499 2.05296 1.49134 1.00618 0.59837 0.27430 0.05212       0
#> 2 6.41695 5.41695 4.41695 3.50622 2.75479 2.10052 1.52902 1.03544 0.62019 0.28919 0.05975       0
#> 3 6.52260 5.52260 4.52260 3.58250 2.81355 2.14717 1.56600 1.06423 0.64173 0.30402 0.06757       0
#> 4 6.62210 5.62210 4.62210 3.65817 2.87108 2.19273 1.60214 1.09242 0.66291 0.31871 0.07553       0
#> 5 6.71550 5.71550 4.71550 3.73325 2.92721 2.23709 1.63735 1.11996 0.68369 0.33324 0.08359       0
#> 6 6.80310 5.80310 4.80310 3.80821 2.98185 2.28020 1.67162 1.14683 0.70407 0.34760 0.09174       0
#> ...

# Time in each degree
td_napa <- degree_time(napa, thresholds = c(0:35))
head(td_napa)

#>         date year month day fips      county state  lat   long    tmax   tmin tdegree0C tdegree1C
#> 1 1899-12-15 1899    12  15 6055 Napa County    CA 38.5 -122.5 12.5000 4.1100         0         0
#> 2 1899-12-16 1899    12  16 6055 Napa County    CA 38.5 -122.5 12.5445 4.2894         0         0
#> 3 1899-12-17 1899    12  17 6055 Napa County    CA 38.5 -122.5 12.5878 4.4574         0         0
#> 4 1899-12-18 1899    12  18 6055 Napa County    CA 38.5 -122.5 12.6298 4.6144         0         0
#> 5 1899-12-19 1899    12  19 6055 Napa County    CA 38.5 -122.5 12.6706 4.7604         0         0
#> 6 1899-12-20 1899    12  20 6055 Napa County    CA 38.5 -122.5 12.7103 4.8959         0         0
#>   tdegree2C tdegree3C tdegree4C tdegree5C tdegree6C tdegree7C tdegree8C tdegree9C tdegree10C tdegree11C
#> 1         0         0   0.02960   0.07636   0.07794   0.08090   0.08576   0.09359    0.10704    0.13481
#> 2         0         0   0.01624   0.07745   0.07889   0.08172   0.08645   0.09412    0.10727    0.13413
#> 3         0         0   0.00334   0.07853   0.07981   0.08251   0.08711   0.09462    0.10749    0.13350
#> 4         0         0   0.00000   0.07048   0.08070   0.08327   0.08774   0.09509    0.10769    0.13292
#> 5         0         0   0.00000   0.05961   0.08155   0.08399   0.08833   0.09553    0.10786    0.13237
#> 6         0         0   0.00000   0.04926   0.08235   0.08467   0.08888   0.09593    0.10801    0.13183
#> ...

```
