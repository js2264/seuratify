#' readImg
#'
#' @export

readImg <- function(img) {
    isLink <- strsplit(img, '/')[[1]][1] %in% c('https:', 'http:')
    ext <- tools::file_ext(img)
    if (isLink) {
        msg_note(glue::glue("Fetching img from {img}"))
        z <- glue::glue(tempfile(), '.{ext}')
        download.file(img, z)
        img <- z
    }
    if (ext == 'png') {
        img <- png::readPNG(img)
    }
    else if (ext == 'jpeg' | ext == 'jpg') {
        img <- jpeg::readJPEG(img)
    } 
    else {
        stop(msg_warning("Please provide a png or jpeg image"))
    }
    img <- cbind(
        img[, , 1] %>% 
            as_tibble() %>% 
            mutate(y = as.numeric(1:nrow(.))) %>% 
            pivot_longer(-y, names_to = 'x', values_to = 'r') %>% 
            mutate(x = as.numeric(str_replace(x, 'V', ''))),
        img[, , 2] %>% 
            as_tibble() %>% 
            mutate(y = as.numeric(1:nrow(.))) %>% 
            pivot_longer(-y, names_to = 'x', values_to = 'g') %>% 
            mutate(x = as.numeric(str_replace(x, 'V', ''))) %>% 
            select(g),
        img[, , 3] %>% 
            as_tibble() %>% 
            mutate(y = as.numeric(1:nrow(.))) %>% 
            pivot_longer(-y, names_to = 'x', values_to = 'b') %>% 
            mutate(x = as.numeric(str_replace(x, 'V', ''))) %>% 
            select(b)
    ) %>% as_tibble()
    attr(img, 'ratio') <- max(img$y)/max(img$x)
    return(img)
}
