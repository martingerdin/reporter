#' Create summary table
#'
#' Creates a summary table
#' @param summary.data Data frame. The data to be summarised. No
#'     default.
#' @param varible A symbol (class `name`) or characater. The variable
#'     in `summary.data` to be summarised. No default.
#' @export
create_summary_table <- function(summary.data, variable) {
    assert_that(is.data.frame(summary.data))
    variable.class <- class(variable)
    assert_that(is.character(variable) | variable.class == "name")
    if (variable.class != "name")
        variable <- ensym(variable)
    variable.table <- summary.data %>%
        dplyr::summarise(N = dplyr::n(),
                         Mean = mean(!!variable, na.rm = TRUE),
                         Median = median(!!variable, na.rm = TRUE),
                         Min. = min(!!variable, na.rm = TRUE),
                         Max. = max(!!variable, na.rm = TRUE),
                         "Missing (N)" = sum(is.na(!!variable)),
                         "Missng (%)" = round(mean(is.na(!!variable)) * 100)) %>%
        knitr::kable()
    variable.table
}
