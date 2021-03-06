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
#' @param strata Character or NULL. The name of the variable to use
#'     for stratification. The report will not be stratified if
#'     `strata` is NULL. Defaults to NULL. 
#' @param write Logical. If TRUE the report is written to disk using
#'     `write_report()`. If FALSE the report is only
#'     returned. Defaults to FALSE.
#' @return A report, which is a list of report components that can be
#'     written to disk using `write_report()` or using
#'     `create_report(.., write = TRUE)`
#' @examples
#' create_report()
#' @export
create_report <- function(codebook, dataset, strata = NULL, write = FALSE) {
    ## Check arguments
    assert_codebook()
    assert_dataset()
    assert_that(is.logical(write), length(write) == 1)
    assert_strata()
    ## Import
    if (is.character(codebook))
        codebook <- import_codebook(codebook)
    if (is.character(dataset))
        dataset <- import_dataset(dataset)

    ## Create front matter
    front.matter <- create_front_matter()
    
    ## Create table of contents
    # table.of.contents <- create_table_of_contents()
    
    ## Create content
    content <- create_content(codebook = codebook, dataset = dataset, strata = strata)
    
    ## Combine report components
    report <- combine_report_components(front.matter, content)
        
    ## Write report to disk
    if (write)
        write_to_disk(report, "report.pdf", keep.temp = TRUE)

    ## Return report
    return (report)
}

create_table_of_content <- function() NULL
combine_report_components <- function(...) {
    components <- lapply(list(...), unlist)
    ## Check that all components are character vectors
    assert_that(all(sapply(components, is.character)))
    ## Combine components
    report <- paste0(unlist(components), collapse = "\n")
    report
}
write_report <- function(report) NULL
