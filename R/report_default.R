#' Report default
#'
#' The default report variable function.
#' @param entry List. The codebook entry for a specific
#'     variable with the variable and if applicable the strata
#'     data. No default.
#' @return A character vector formatted as markdown.
#' @import ggplot2
#' @export
report_default <- function(entry) {
    assert_entry()
    ## Create plot
    variable <- entry$name
    variable <- ensym(variable)
    summary.data <- entry$data
    stratify <- !is.null(entry$strata)
    if (stratify) {
        summary.data <- cbind(summary.data, entry$strata$data) 
        strata <- entry$strata$codebook$name
        overall.data <- summary.data
        overall.data[[strata]] <- "All"
        summary.data <- rbind(summary.data, overall.data) %>% dplyr::as_tibble()
    }
    variable.plot <- ggplot(data = summary.data, aes(!!variable)) + geom_histogram()
    if (stratify)
        variable.plot <- variable.plot +
            facet_wrap(strata)
    ## Create table
    if (stratify) {
        strata <- ensym(strata)
        summary.data <- dplyr::group_by(summary.data, !!strata)
    }
    variable.table <- summary.data %>%
        dplyr::summarise(N = dplyr::n(),
                         Mean = mean(!!variable, na.rm = TRUE),
                         Median = median(!!variable, na.rm = TRUE),
                         Min. = min(!!variable, na.rm = TRUE),
                         Max. = max(!!variable, na.rm = TRUE),
                         "Missing (N)" = sum(is.na(!!variable)),
                         "Missng (%)" = round(mean(is.na(!!variable)) * 100)) %>%
        knitr::kable()
    ## Create variables
    variables <- list(label = entry$label,
                      name = entry$name,
                      description = entry$description,
                      variable.plot = variable.plot,
                      variable.table = variable.table)
    ## Add to template
    report <- substitute_variables("variable-report", variables)
    ## Return report
    report
}
    
