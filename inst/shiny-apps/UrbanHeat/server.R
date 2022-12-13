server <- function(input, output, session) {

  # User-Reactive TIF Filename
  tif_file_RCT <- reactive({
    tif_dir <- file.path(.map_dir, input$city)
    tif_file <- list.files(tif_dir, pattern = input$var, ignore.case = T)
    tif_file <- tif_file[grep('\\.tif$', tif_file)]
    file.path(tif_dir, tif_file)
  })

  # User-Reactive TIF Raster
  tif_RCT <- reactive(terra::rast(tif_file_RCT()))

  # User-Reactive Raster Center Coordinates
  # These could be hard-coded in lazy data to improve speed
  c0_RCT <- reactive(get_raster_center(tif_file_RCT()))

  shp_RCT <- reactive({
    shp_dir <- file.path(.map_dir, input$city)
    nb_file <- list.files(shp_dir, pattern = 'neighborhoods\\.shp', ignore.case = T)
    nb_map <- terra::vect(file.path(shp_dir, nb_file))
    shp_map <- nb_map
  })

  output$outmap <- renderLeaflet({
    leaflet() |>
      addTiles() |>
      setView(lng = c0_RCT()[1], lat = c0_RCT()[2], zoom = 12) |>
      addRasterImage(tif_RCT(), layerId = 1)
  })

}
