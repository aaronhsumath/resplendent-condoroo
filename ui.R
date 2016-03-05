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
                           "Atherton" = "Atherton",
                           "Cupertino" = "Cupertino", 
                           "Los Altos" = "Los Altos",
                           "Los Altos Hills" = "Los Altos Hills",
                           "Menlo Park" = "Menlo Park",
                           "Mountain View" = "Mountain View",
                           "Palo Alto" = "Palo Alto",
                           "Portola Valley" = "Portola Valley",
                           "Redwood City" = "Redwood City",
                           "Redwood Shores" = "Redwood Shores",
                           "Sunnyvale" = "Sunnyvale",
                           "Woodside" = "Woodside"
                           ),
                         selected = 1)
    ),
    
    # Main panel, which displays requested output
    mainPanel(
      
      # Display the title
      titlePanel("Median Sale Price and Price per Square Foot"),
      
      # Display the plot
      plotOutput("dataPlotCombined")
    )
    
  )
  
))