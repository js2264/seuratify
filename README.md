# seuratify

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![pkgdown](https://github.com/js2264/seuratify/workflows/pkgdown/badge.svg)](https://github.com/js2264/seuratify/actions)
<!-- badges: end -->

``` r
library(seuratify)
img <- readImg('~/Documents/Admin/__Photo/photo_in_lab_square-01.png') %>% 
    binImg(bins = 1000) %>% 
    jitterPoints(jitter = 0.0025) %>% 
    jitterColors(jitter = 0.25)
plotSeurat(img, size = 0.15) 
```

