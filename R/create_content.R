#' Create content
#'
#' Creates report content
#'
#' @param codebook List of class `reporter:codebook`. No default.
#' @param dataset Dataframe of class `reporter:dataset`. No default.
#' @param strata Character or NULL. The name of the variable to use
#'     for stratification. The report will not be stratified if
#'     `strata` is NULL. Defaults to NULL.
#' @examples
#' @export
create_content <- function(codebook, dataset, strata = NULL) {
    ## Check arguments
    assert_that(is_codebook(codebook))
    assert_that(is_dataset(dataset))
    assert_strata()
    ## Add data and strata to codebook elements to avoid having to
    ## pass the entire codebook and dataset to subfunctions
    codebook.data <- creata_codebook_data(codebook, dataset, strata)
    ## Create content
    content <- lapply(codebook.data, report)
    ## Return content
    return (content)
} 

create_codebook_data <- function(codebook, dataset, strata) {
    codebook.data <- lapply(codebook, function(x) {
        x <- as.list(x)
        name <- x$name
        x$data <- dataset %>% dplyr::select({{ name }})
        if (!is.null(strata))
            x$strata <- list(codebook = codebook[[strata]],
                             data = dataset %>% dplyr::select({{ strata }}))
        x
    })
    codebook.data
}
