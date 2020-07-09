#' Create a codebook template
#'
#' Creates an empty codebook object.
#' @return A list
#' @examples
#' create_codebook_template()
#' @export
create_codebook_template <- function() {
    codebook_template <- list(label = NA,
                              name = NA,
                              description = NA,
                              source = NA,
                              coding_instructions = NA, 
                              id = NA,
                              complete = NA,
                              header = NA,
                              input = NA,
                              double_enter = NA,
                              type = NA, 
                              valid_values = NA,
                              show_valid_values = NA,
                              unknown = NA,
                              value_labels = NA, 
                              logic_checks = NA,
                              logic_prompts = NA,
                              logic_must_be_true = NA,
                              calculated = NA, 
                              equation = NA,
                              visible = NA,
                              group1 = NA,
                              group2 = NA)
    return (codebook_template)
}
