#' @title shiny interface
#'
#' @description NA
#'
#' @details NA
#'
#' @author Brandon McNellis
#'
#' @export
#' @rdname UrbanHeat
UrbanHeat <- function(directory = getwd(), map_dir = getwd()) {
  require(terra)
  require(shiny)
  require(shinydashboard)
  require(leaflet)

  # Set up app to run
  appDir <- system.file("shiny-apps", "UrbanHeat", package = "UrbanHeat")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `UrbanHeat`.", call. = FALSE)
  }

  # Parameter checks
  if (!all(UrbanHeat::cities %in% list.files(map_dir))) {
    stop('Missing city GIS subdirectories from map source directory.')
  }

  # Pass parameters
  .GlobalEnv$.directory <- directory
  .GlobalEnv$.map_dir <- map_dir

  # Clean up on exit
  on.exit(rm(list = c('.directory', '.map_dir'), envir = .GlobalEnv))

  # Run app
  shiny::runApp(appDir, display.mode = "normal")
}
