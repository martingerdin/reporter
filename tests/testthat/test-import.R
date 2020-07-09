context("import_codebook")

get_dataset <- function(x) rio::import(system.file("extdata", "dataset.csv", package = "reporter"))

test_that("import_codebook throws errors on faulty codebook", {
    path <- system.file("extdata", "faulty-codebook.csv", package = "reporter")
    expect_error(import_codebook(path), "The file that you")
})
