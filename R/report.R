#' Report
#'
#' Identifies the appropriate report function depending on variable
#' type
#' @param entry List. The codebook entry for a specific variable with
#'     the variable and if applicable the strata data. No default.
#' @return A character vector formatted as markdown.
#' @export
report <- function(entry) {
    assert_entry()
    type <- entry$type
    unknown <- entry$unknown
    entry$data <- entry$data %>% dplyr::na_if({{ unknown }})
    if (type == "quantitative") {
        return (report_quantitative(entry))
    } else if (type == "qualitative") {
        return (report_qualitative(entry))
    } else if (type == "date") {
        return (report_date(entry))
    } else if (type == "time") {
        return (report_time(entry))
    }
    ## Only use report_default if the variable is none of the types
    ## listed above
    report_default(entry)
}
