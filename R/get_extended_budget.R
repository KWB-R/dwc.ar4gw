#' get_extended_budget
#'
#' @description Get the flow rate across cell faces including potential stresses applied
#' along boundaries at a given time. Only implemented for "classical" MODFLOW
#' versions where the budget is recorded as FLOW RIGHT FACE, FLOW FRONT FACE
#' and FLOW LOWER FACE arrays.
#' @param cbcfile  Cell by cell file produced by Modflow.
#' @param ... additional arguments passed to flopy$utils$postprocessing$get_extended_budget
#' for information see references below
#' @return return sub-list for with "Qx_ext", "Qy_ext", "Qz_ext" for each budget
#' output timestep. Flow rates across cell faces. Qx_ext is a array of size (nlay,
#' nrow, ncol + 1). Qy_ext is a array of size (nlay, nrow + 1, ncol). The sign
#' is such that the y axis is considered to increase in the north direction. Qz_ext
#' is a ndarray of size (nlay + 1, nrow, ncol). The sign is such that the z axis
#' is considered to increase in the upward direction.
#' @export
#' @references https://flopy.readthedocs.io/en/latest/source/flopy.utils.postprocessing.html#flopy.utils.postprocessing.get_extended_budget
#' @examples
#'  \dontrun{
#'  flopy <- import_flopy()
#'  reticulate::py_help(object = flopy$utils$postprocessing$get_extended_budget)
#'  }
get_extended_budget <- function(cbcfile, ...) {

  flopy <- import_flopy()

  # reticulate::py_help(object = flopy$utils$postprocessing$get_extended_budget)

  budget <- flopy$utils$CellBudgetFile(filename = cbcfile)

  times <- budget$get_times()

  times_numeric <- times[[1L]]

  # reticulate::py_help(object = flopy$utils$postprocessing$get_extended_budget)
  stats::setNames(lapply(times, function(time) {
    stats::setNames(flopy$utils$postprocessing$get_extended_budget(
      cbcfile = cbcfile,
      totim = time,
      ...),
      nm = c("Qx_ext", "Qy_ext", "Qz_ext")) }
  ),
  nm = sprintf("time_%.1f", times_numeric))
}
