#' Helper function: convert multiarray to long format
#'
#' @param multiarray multidimensional MODFLOW array
#'
#' @return convert multiarray to long format with columns:
#' layer, col, row, value
#' @export
#' @importFrom reshape2 melt
#' @importFrom dplyr rename
to_long <- function(multiarray) {
  reshape2::melt(multiarray) %>%
    dplyr::rename(layer = "Var1",
                  col = "Var2",
                  row = "Var3")

}

#' plot_data
#'
#' @param multiarray multidimensional MODFLOW array
#' @param title title for plot
#' @param value_min minimum value. All smaller values will be excluded from dataset
#' (default: NULL)
#' @param value_max maximum value. All larger values will be excluded from dataset
#' (default: NULL)
#' @param fill_gradient_low fill_gradient_low (default: "grey90")
#' @param fill_gradient_high fill_gradient_high (default: "red")
#' @return plot all Modflow layers
#' @export
#' @import ggplot2
#' @importFrom rlang .data
plot_data <- function(multiarray,
                      title = "",
                      value_min = NULL,
                      value_max = NULL,
                      fill_gradient_low = "grey90",
                      fill_gradient_high = "red"
                      ) {


long_data <- to_long(multiarray)

if(title == "") {
  title <- deparse(substitute(multiarray))
}


if(!is.null(value_min)) {
  long_data <- long_data %>% dplyr::filter(.data$value > value_min)
}

if(!is.null(value_max)) {
  long_data <- long_data %>% dplyr::filter(.data$value < value_max)
}

long_data %>%
ggplot2::ggplot(ggplot2::aes_string(x = "col", y = "row")) +
  ggplot2::geom_raster(ggplot2::aes_string(fill = "value")) +
  ggplot2::facet_wrap(~layer) +
  ggplot2::scale_fill_gradient(low = fill_gradient_low,
                               high = fill_gradient_high) +
  labs(x = "row", y = "column", title = title) +
  ggplot2::theme_bw() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(size=9, angle=0, vjust=0.3),
                 axis.text.y = ggplot2::element_text(size=9),
                 plot.title = ggplot2::element_text(size=11))
}




