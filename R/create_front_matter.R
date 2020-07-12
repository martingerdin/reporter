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
    NULL
}
