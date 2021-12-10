#' plotSeurat
#'
#' @export

plotSeurat <- function(img, size = 0.2) {
    df <- mutate(img, col = rgb(r, g, b, maxColorValue = 1))
    p <- ggplot(df, aes(x = x, y = -y)) + 
        ggrastr::geom_point_rast(aes(col = col), size = size) +
        scale_colour_identity() + 
        theme_void() + 
        theme(aspect.ratio = attr(img, 'ratio'))
    return(p)
}
