#' Apply a codebook to a dataset
#'
#' Given a codebook and a dataset this function returns a dataset where the column classes have been modified to fit and factors have been supplied with human readable levels.
#'
#' @param codebook List of class `reporter:codebook` or character. A
#'     character vector of length 1 is assumed to be the codebook file
#'     path and is passed to `import_codebook()`. No default.
#' @param dataset Dataframe. The dataset to which the codebook should
#'     be applied. No default.
#' @return A tibble.
#' @export
apply_codebook <- function(codebook, dataset) {
    ## Check arguments
    assert_codebook()
    assert_that(is.data.frame(dataset))
    ## Import
    if (is.character(codebook))
        codebook <- import_codebook(codebook)
    ## Store column order
    column.order <- names(dataset)
    ## Store classes
    classes <- class(dataset)
    ## Apply codebook
    relevant.columns <- names(codebook)[names(codebook) %in% names(dataset)]
    new.columns <- lapply(codebook[relevant.columns], function(entry) {
        column <- dataset %>% dplyr::pull({entry$name})
        tryCatch(convert_column(column, entry, dataset),
                 error = function(e) {
                     message_wrap("The column ", entry$name, " could not be ",
                                  "converted. Conversion failed with the error ",
                                  e$message, ".\n")
                     column
                 })
    })
    dataset[relevant.columns] <- new.columns
    ## Restore column order
    dataset <- dataset[, column.order]
    ## Restore dataset classes
    class(dataset) <- classes
    ## Return dataset
    dataset
}

convert_column <- function(column, entry, dataset) {
    type <- entry$type
    if (type == "quantitative") {
        column <- as.numeric(column)
    } else if (type == "qualitative") {
        levels <- as.numeric(unlist(strsplit(entry$valid_values, ",")))
        labels <- gsub("\"", "", unlist(strsplit(entry$value_labels, ",")))
        if (length(labels > 0))
            column <- as.numeric(column) %>% factor(levels = levels, labels = labels)
        return (column)
    } else if (type == "date") {
        column <- lubridate::as_date(column)
    } else if (type == "time") {
        return (column)
    } else {
        return (column)
    }
    column
}
