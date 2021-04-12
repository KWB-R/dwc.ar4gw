#' plot_data
#'
#' @param mulitarray multidimensional MODFLOW array
#' @param title title for plot
#' @param value_min minimum value. All smaller values will be excluded from dataset
#' (default: NULL)
#' @param value_max maximum value. All larger values will be excluded from dataset
#' (default: NULL)
#' @return plot all Modflow layers
#' @export
#' @import ggplot2
#' @importFrom reshape2 melt
#' @importFrom dplyr rename
#' @importFrom rlang .data
plot_data <- function(mulitarray,
                      title = "",
                      value_min = NULL,
                      value_max = NULL) {

if(title == "") {
  title <- deparse(substitute(multiarray))
}

longData <- reshape2::melt(mulitarray) %>%
  dplyr::rename(layer = "Var1",
                col = "Var2",
                row = "Var3")

if(!is.null(value_min)) {
  longData <- longData %>% dplyr::filter(.data$value > value_min)
}

if(!is.null(value_max)) {
  longData <- longData %>% dplyr::filter(.data$value < value_max)
}



longData %>%
#  dplyr::filter(value > min(longData$value, na.rm = TRUE),
#                value < max(longData$value, na.rm = TRUE)) %>%
#  dplyr::filter(layer == 1) %>%
ggplot2::ggplot(ggplot2::aes_string(x = "col", y = "row")) +
  ggplot2::geom_raster(ggplot2::aes_string(fill = "value")) +
  ggplot2::facet_wrap(~layer) +
  ggplot2::scale_fill_gradient(low="grey90", high="red") +
  labs(x = "row", y = "column", title = title) +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size=9, angle=0, vjust=0.3),
                 axis.text.y = ggplot2::element_text(size=9),
                 plot.title = ggplot2::element_text(size=11))
}




