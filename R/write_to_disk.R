#' Write to disk
#'
#' Write an object to disk and render with `package:rmarkdown`.
#' @param object Character. No default.
#' @param file.name Character or NULL. The name of the rendered
#'     file. If NULL the name will be created based on the object
#'     argument. Defaults to NULL.
#' @param keep.temp Logical. If TRUE the temporary file used to render
#'     the final document is kept. This is useful for
#'     debugging. Defaults to FALSE.
#' @return Returns `object` invisibly.
#' @examples
#' front.matter <- create_front_matter()
#' write_to_disk(front.matter)
#' @export
write_to_disk <- function(object, file.name = NULL, keep.temp = FALSE) {
    assert_that(is.character(object))
    assert_that(is.null(file.name) || (is.character(file.name) & length(file.name) == 1))
    assert_that(is.logical(keep.temp), length(keep.temp) == 1)
    if (is.null(file.name))
        file.name <- paste0(deparse(substitute(object)), ".pdf")
    tmp.file <- tempfile(tmpdir = ".", fileext = ".md") 
    writeLines(object, tmp.file)
    tryCatch(rmarkdown::render(tmp.file, output_file = file.name),
             error = function(e) stop(e$message),
             finally = if (!keep.temp) file.remove(tmp.file))
    invisible(object)
} 
