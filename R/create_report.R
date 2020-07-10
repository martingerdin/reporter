#' Create a report
#'
#' Creates a data report using a codebook and dataset. The codebook
#' and dataset have to be aligned so that the codebook describes the
#' content of the dataset.
#' @param codebook List of class `reporter:codebook` or character. A
#'     character vector of length 1 is assumed to be the codebook file
#'     path and is passed to `import_codebook()`. No default.
#' @param dataset Dataframe of class `reporter:dataset` or
#'     character. A character vector of length 1 is assumed to be the
#'     dataset file path and is passed to `import_dataset()`. No
#'     default.
#' @param write Logical. If TRUE the report is written to disk using
#'     `write_report()`. If FALSE the report is only
#'     returned. Defaults to FALSE.
#' @return A report, which is a list of report components that can be
#'     written to disk using `write_report()` or using
#'     `create_report(.., write = TRUE)`
#' @examples
#' create_report()
#' @export
create_report <- function(codebook, dataset, write = FALSE) {
    ## Check arguments
    assert_codebook()
    assert_dataset()
    assert_that(is.logical(write), length(write) == 1)
    
}
