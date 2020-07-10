get_from_env <- function(x, env) {
    if (is.null(x)) {
        x <- env$path
        assert_that(!is.null(x))
    }
    return (x)
}

is_codebook <- function(x) {
    cond <- "reporter_codebook" %in% class(x)
    return (cond)
}

on_failure(is_codebook) <- function(call, env) {
    paste0(deparse(call$x), " is not a valid codebook")
}

is_dataset <- function(x) {
    cond <- "reporter_dataset" %in% class(x)
    return (cond)
}

on_failure(is_dataset) <- function(call, env) {
    paste0(deparse(call$x), "is not a valid codebook")
}

assert_path <- function(path = NULL, env = parent.frame()) {
    path <- get_from_env(path, env)
    assert_that(is.character(path), length(path) == 1, file.exists(path))
}

assert_codebook <- function(codebook = NULL, env = parent.frame()) {
    codebook <- get_from_env(codebook, env)
    assert_that(is_codebook(codebook) || (is.character(codebook) & length(codebook) == 1))
}

assert_dataset <- function(x = NULL, call = parent.frame()) {
    dataset <- get_from_env(dataset, env)
    assert_that(is_dataset(x) || (is.character(x) & length(x) == 1))
}


