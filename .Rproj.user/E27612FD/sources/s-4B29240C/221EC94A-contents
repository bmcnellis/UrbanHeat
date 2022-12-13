#' @title helper functions for UrbanHeat
#'
#' @description NA
#'
#' @details NA
#'
#' @author Brandon McNellis
#'
#' @export
#' @rdname helpers
project_extent <- function(x, from, to)  {
  require(terra)

  # The S4 method for terra::project() is broken for SpatExtent,
  # but copying it here works. Probably some inheritence issue I guess
  x <- as.polygons(x, crs = from)
  x <- densify(x, 10000)
  ext(project(x, to))
}
#' @export
#' @rdname helpers
get_raster_center <- function(filename) {
  require(terra)

  r0 <- terra::rast(filename)
  e0 <- project_extent(ext(r0), crs(r0), 'epsg:4326')

  terra::mean(e0)
}
