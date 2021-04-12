#' plot_data
#'
#' @param mulitarray multidimensional MODFLOW array
#' @param title title for plot
#'
#' @return plot all Modflow layers
#' @export
#' @import ggplot2
#' @importFrom reshape melt
#' @importFrom dplyr rename
plot_data <- function(mulitarray,
                      title = "") {

if(title == "") {
  title <- deparse(substitute(multiarray))
}

longData <- reshape2::melt(mulitarray) %>%
  dplyr::rename(layer = "Var1",
                col = "Var2",
                row = "Var3")

longData %>%
#  dplyr::filter(value > min(longData$value, na.rm = TRUE),
#                value < max(longData$value, na.rm = TRUE)) %>%
#  dplyr::filter(layer == 1) %>%
ggplot2::ggplot(ggplot2::aes(x = col, y = row)) +
  ggplot2::geom_raster(ggplot2::aes(fill=value)) +
  ggplot2::facet_wrap(~layer) +
  ggplot2::scale_fill_gradient(low="grey90", high="red") +
  labs(x="row", y="colum", title=title) +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size=9, angle=0, vjust=0.3),
                 axis.text.y = ggplot2::element_text(size=9),
                     plot.title = ggplot2::element_text(size=11))
}




