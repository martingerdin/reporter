#' Import dataset
#'
#' Imports a dataset
#' @param path Character vector of length 1. The path to the
#'     dataset. Defaults to `"./dataset.csv"`, i.e. it looks for a
#'     file called `dataset.csv` in the current working directory.
#' @return A tibble.
#' @examples
#' \dontrun{
#' import_dataset()
#' }
#' @export
import_dataset <- function(path) {
    assert_path()
    dataset <- rio::import(path) %>% dplyr::as_tibble()
    class(dataset) <- c("reporter_dataset", class(dataset))
    return (dataset)
}
