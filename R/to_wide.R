#' to_wide
#'
#' @param multiarray_long multiarray in long format (as retrieved by
#' \code{\link{to_long}})
#' @param parameter prefix to use for parameter in wide format (default: "")
#'
#' @return tibble with column, row, parameter_layer1-n
#' @export
#' @importFrom tidyr pivot_wider
#'
to_wide <- function(multiarray_long, parameter = "" ) {
tidyr::pivot_wider(multiarray_long,
                   names_from = "layer",
                   names_prefix = parameter,
                   values_from = "value")
}
