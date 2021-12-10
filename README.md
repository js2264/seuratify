# seuratify

<!-- badges: start -->
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![pkgdown](https://github.com/js2264/seuratify/workflows/pkgdown/badge.svg)](https://github.com/js2264/seuratify/actions)
<!-- badges: end -->

``` r
library(seuratify)
img_path <- randomImg('img_2.jpg')
img <- readImg('img_1.jpg') %>% 
    binImg(bins = 1000) %>% 
    jitterPoints(jitter = 0.01) %>% 
    jitterColors(jitter = 0.1)
p <- plotSeurat(img, size = 0.2) 
ggsave('seurat.png', width = 18, height = 10)
```

