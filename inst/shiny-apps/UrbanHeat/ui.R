ui <- fluidPage(

  # Application title
  titlePanel("Urban Heat Maps"),

  # Sidebar with a drop-down for city
  sidebarLayout(
    sidebarMenu(
      selectInput("city", "Select a city", choices = UrbanHeat::cities),
      selectInput("var", "Select a variable", choices = UrbanHeat::variables[, 1])
    ),
    mainPanel(
      #plotOutput("outmap")
      #textOutput("coords")
    )
  ),

  leafletOutput("outmap", height = 750)

)
