shinyUI(fluidPage(

  sidebarLayout(
    
    # Sidebar, where user selects options
    sidebarPanel(
      
      # Select which type of property we wish to see
      selectInput("selectType",
         "Property Type:",
         choices = typeNames),
      
      # Select which cities we wish to see
      checkboxGroupInput("selectCity", label = h3("Checkbox group"), 
                         choices = list(
                           "Atherton" = "AT",
                           "Cupertino" = "CU", 
                           "Los Altos" = "LA",
                           "Los Altos Hills" = "LAH",
                           "Menlo Park" = "MP",
                           "Mountain View" = "MV",
                           "Palo Alto" = "PA",
                           "Portola Valley" = "PV",
                           "Redwood City" = "RC",
                           "Redwood Shores" = "RS",
                           "Sunnyvale" = "SU",
                           "Woodside" = "WOD"
                           ),
                         selected = 1)
    ),
    
    # Main panel, which displays requested output
    mainPanel(
      
      # Display the title
      titlePanel("Median Sale Price and Price per Square Foot"),
      
      # Display the plot
      plotOutput("dataPlot1"),
      plotOutput("dataPlot2")
    )
    
  )
  
))