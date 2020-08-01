up <- function(x) usethis::use_package(x, min_version = packageVersion(x))

test_params <- function() {
    params <- list(
        codebook = rio::import(system.file("extdata", "codebook.csv", package = "reporter")),
        faulty.codebook = rio::import(system.file("extdata", "faulty-codebook.csv", package = "reporter")),
        dataset = rio::import(system.file("extdata", "dataset.csv", package = "reporter"))
    )
    return (params)
}

stop_wrap <- function(...) {
    stop (stringr::str_wrap(paste0(...)))
}

wrap_file <- function(...) {
    system.file(..., package = "reporter", mustWork = TRUE)
}

get_template <- function(name) {
    readLines(wrap_file("templates", paste0(name, ".Rmd")))
}

