shinyUI(fluidPage(

  sidebarLayout(
    
    sidebarPanel(
      selectInput("city",
        "City:",
        choices = cityNames),
      selectInput("type",
         "Property Type:",
         choices = typeNames),
      selectInput("stat",
                  "Statistic Requested:",
                  choices = statNames),
      hr()
    ),
    mainPanel(plotOutput("dataPlot"))
  )
))