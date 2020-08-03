#' Create front matter
#'
#' Creates the first page of the report. 
#'
#' For all arguments, NULL means that the item will not be included.
#' @param title Character. The report title. Defaults to `"Report"`.
#' @param subtitle Character. The report subtitle. Defaults to NULL.
#' @param author Character. The report author. Defaults to NULL.
#' @param date Character. The report date. Defaults to NULL.
#' @param logo Character. The path to a valid image file to use as
#'     logo. Defaults to NULL.
#' @param image Character. The path to some other front matter
#'     image. Defaults to NULL.
#' @param write Logical. If TRUE the front matter is written to disk
#'     and rendered. Defaults to FALSE.
#' @return A character vector with the front matter as markdown.
#' @examples
#' ## Create front matter with only the title "Report" 
#' create_front_matter()
#'
#' ## Use a custom title
#' create_front_matter("My report")
#'
#' ## Create a full front page and write to disk
#' title <- "My report"
#' subtitle <- "Made with reporter"
#' author <- "Just me"
#' date <- lubridate::today()
#' logo <- "my-logo.png"
#' image <- "my-image.png"
#' create_front_matter(title, subtitle, author, date, logo, image, write = TRUE)
#' @export
create_front_matter <- function(title = "Report", subtitle = NULL, author = NULL,
                                date = NULL, logo = NULL, image = NULL, write = FALSE) {
    ## Check arguments
    assert_that(is.null(title) | (is.character(title) & length(title) == 1))
    assert_that(is.null(subtitle) | (is.character(subtitle) & length(subtitle) == 1))
    assert_that(is.null(author) | (is.character(author) & length(author) == 1))
    assert_that(is.null(date) | (is.character(date) & length(date) == 1))
    assert_that(is.null(logo) | (is.character(logo) & length(logo) == 1))
    assert_that(is.null(image) | (is.character(image) & length(image) == 1))
    assert_that(is.logical(write), length(write) == 1)

    ## Setup arguments
    if (is.null(logo))
        logo <- wrap_file("templates", "logo.svg")
    variables <- list(title = title,
                      subtitle = subtitle,
                      author = author,
                      date = date,
                      logo = logo,
                      image = image)
    variables <- lapply(variables, function(x) if (is.null(x)) "" else x)

    ## Substitute variables in template
    front.matter <- substitute_variables("front-matter", variables)
    ## Return front matter
    front.matter
}
