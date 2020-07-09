#' Import codebook
#'
#' Imports a codebook and makes sure that it conforms to the expected
#' format.
#' @param path Character vector of length 1. The path to the
#'     codebook. Defaults to "./codebook.csv", i.e. it looks for a
#'     file called `codebook.csv` in the current working directory.
#' @return A list of codebook components indexed according to `name`.
#' @examples
#' \dontrun {
#' ## Assumes a file called codebook.csv in the current working
#' ## directory
#' codebook <- import_codebook()
#' codebook
#' }
#' @export
import_codebook <- function(path) {
    ## Check arguments
    assert_that(is.character(path) & length(path) == 1)
    assert_that(file.exists(path))
    ## Import codebook
    codebook <- rio::import(path)
    template.names <- names(create_codebook_template())
    if (!all(template.names %in% names(codebook)))
        stop_wrap ("The file that you are trying to import does ",
                   "not appear to be a valid codebook. Please specify ",
                   "a different file.")
    codebook <- split(codebook, as.factor(codebook$name))
    return (codebook)
}
    
