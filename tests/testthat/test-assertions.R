context("Custom assertions")

test_that("assert_path corecctly throws error", {
    tmpfile <- tempfile()
    expect_error(assert_path(1))
    expect_error(assert_path(c("a", "b")))
    expect_error(assert_path(tmpfile))
})

test_that("assert_codebook correctly throws error", {
    expect_error(assert_codebook(1))
    expect_error(assert_codebook(list("a")))
    expect_error(assert_codebook(data.frame(a = "a")))
    expect_error(assert_codebook(c("a", "b")))
})
