get_from_env <- function(x, env) {
    if (is.null(x)) {
        x <- env[[deparse(substitute(x))]]
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
    x <- get_from_env(codebook, env)
    assert_that(is_codebook(x) || (is.character(x) & length(x) == 1))
}

assert_dataset <- function(x = NULL, call = parent.frame()) {
    x <- get_from_env(dataset, env)
    assert_that(is_dataset(x) || (is.character(x) & length(x) == 1))
}

assert_strata <- function(x = NULL, call = parent.frame()) {
    x <- get_from_env(strata, env)
    assert_that(is.null(x) || is.character(x) & length(x) == 1,
                msg = "strata has to be either NULL or a character vector of length 1")
}

assert_entry <- function(x = NULL, call = parent.frame()) {
    x <- get_from_env(entry, env)
    assert_that(is.list(x))
    assert_that(all(c("name", "label", "description", "type", "data") %in% names(x)))
}
