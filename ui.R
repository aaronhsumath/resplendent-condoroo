shinyUI(fluidPage(

  sidebarLayout(
    
    sidebarPanel(
      selectInput("city",
        "City:",
        choices = cityNames),
      selectInput("selectType",
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