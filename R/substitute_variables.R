#' Substitute variables
#'
#' Substitute variables in a R markdown template with the variables
#' provided. Basically renders the R markdown document using
#' `knitr::knit` and writes it back to a temporary file as markdown.
#' @param template Character. The name of the template file. No
#'     default.
#' @param variables List. The variables. No default.
#' @return A character vector formatted as markdown.
#' @export
substitute_variables <- function(template, variables) {
    ## Check arguments
    assert_that(is.character(template), length(template) == 1)
    assert_that(is.list(variables))
    ## Substitute variables
    tmp.file <- tempfile(tmpdir = ".", fileext = ".md")
    template.file <- wrap_file("templates", paste0(template, ".Rmd"))
    with(variables, knitr::knit(input = template.file, output = tmp.file))
    file.content <- readLines(tmp.file)
    file.remove(tmp.file)
    file.content
}
