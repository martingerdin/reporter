up <- function(x) usethis::use_package(x, min_version = packageVersion(x))

test_params <- function() {
    codebook.path <- wrap_file("extdata", "codebook.csv")
    dataset.path <- wrap_file("extdata", "dataset.csv")
    codebook <- import_codebook(codebook.path)
    dataset <- import_dataset(dataset.path)
    codebook.data <- create_codebook_data(codebook, dataset, "centre")
    entry <- codebook.data$age
    strata <- "centre"
    params <- list(
        codebook = codebook,
        faulty.codebook = rio::import(wrap_file("extdata", "faulty-codebook.csv")),
        dataset = dataset,
        codebook.data = codebook.data,
        entry = entry,
        strata = strata
    )
    return (params)
}

message_wrap <- function(...) {
    message (stringr::str_wrap(paste0(...)))
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

