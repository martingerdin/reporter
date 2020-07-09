#' @import assertthat
NULL

test_params <- function() {
    params <- list(
        codebook = rio::import(system.file("extdata", "codebook.csv", package = "reporter")),
        faulty.codebook = rio::import(system.file("extdata", "faulty-codebook.csv", package = "reporter")),
        dataset = rio::import(system.file("extdata", "codebook.csv", package = "reporter"))
    )
    return (params)
}

stop_wrap <- function(...) {
    stop (stringr::str_wrap(paste0(...)))
}


