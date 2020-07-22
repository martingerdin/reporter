#' Create content
#'
#' Creates report content
#'
#' @param codebook List of class `reporter:codebook`. No default.
#' @param dataset Dataframe of class `reporter:dataset`. No default.
#' @examples
#' @export
create_content <- function(codebook, dataset) {
    assert_that(is_codebook(codebook))
    assert_that(is_dataset(dataset))
} 
