
#' Import "flopy" Python Package
#'
#' @param convert Boolean (default: TRUE); should Python objects be automatically
#' converted to their R equivalent? If set to FALSE, you can still manually convert
#' Python objects to R via the \link[reticulate]{py_to_r} function.
#' @param ... additional arguments passed to \link[reticulate]{import}
#' @return imports "flopy" python package
#' @export
#' @importFrom reticulate import
import_flopy <- function(convert = TRUE, ...) {
  reticulate::import("flopy",
                     convert = convert,
                     ...)
}
