context("Import functions")

test_that("import_codebook throws errors on faulty codebook", {
    path <- system.file("extdata", "faulty-codebook.csv", package = "reporter")
    expect_error(import_codebook(path), "The file that you")
})

test_that("import_dataset returns tibble", {
    path <- system.file("extdata", "dataset.csv", package = "reporter")
    expect_s3_class(import_dataset(path), "tbl_df")
})
