#' plotSeurat
#'
#' @export

plotSeurat <- function(img, size = 0.2) {
    df <- mutate(img, col = rgb(r, g, b, maxColorValue = 1))
    p <- ggplot(df[sample(1:nrow(df)), ], aes(x = x, y = -y)) + 
        ggrastr::geom_point_rast(aes(col = col), size = size, raster.dpi = 1000) +
        scale_colour_identity() + 
        theme_void() + 
        theme(aspect.ratio = attr(img, 'ratio'))
    return(p)
}
