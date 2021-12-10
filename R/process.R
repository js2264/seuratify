#' binImg
#'
#' @export

binImg <- function(img, bins = 100) {
    df <- mutate(img, 
        y = as.numeric(cut(y, breaks = bins, include.lowest = TRUE)) %>% scales::rescale(c(0, 1)), 
        x = as.numeric(cut(x, breaks = bins, include.lowest = TRUE)) %>% scales::rescale(c(0, 1)),
    ) %>% 
    group_by(y, x) %>% 
    summarize(across(c(r,g,b), mean))
    attr(df, 'ratio') <- attr(img, 'ratio')
    return(df)
}

#' jitterPoints
#'
#' @export

jitterPoints <- function(img, jitter = 0.1) {
    img$x <- img$x + sample(seq(0, jitter, 0.001), size = nrow(img), replace = TRUE) - jitter/2
    img$y <- img$y + sample(seq(0, jitter, 0.001), size = nrow(img), replace = TRUE) - jitter/2
    return(img)
}
#' jitterColors
#'
#' @export

jitterColors <- function(img, jitter = 0.1) {
    img$r <- img$r + sample(seq(0, jitter, 0.001), size = nrow(img), replace = TRUE) - jitter/2
    img$g <- img$g + sample(seq(0, jitter, 0.001), size = nrow(img), replace = TRUE) - jitter/2
    img$b <- img$b + sample(seq(0, jitter, 0.001), size = nrow(img), replace = TRUE) - jitter/2
    df <- mutate(img, 
        r = case_when(r > 1 ~ 1, r < 0 ~ 0, TRUE ~ r), 
        g = case_when(g > 1 ~ 1, g < 0 ~ 0, TRUE ~ g), 
        b = case_when(b > 1 ~ 1, b < 0 ~ 0, TRUE ~ b)
    )
    attr(df, 'ratio') <- attr(img, 'ratio')
    return(df)
}

