shinyUI(fluidPage(
  # Display the title
  titlePanel("Interactive Market Statistics"),
  sidebarLayout(
    
    # Sidebar, where user selects options
    sidebarPanel(
      
      # Select which type of property we wish to see
      selectInput("selectType",
         "Property type:",
         choices = typeNames),
      
      # Select which cities we wish to see
      checkboxGroupInput("selectCity", label = strong("Select cities:"), 
                         choices = list(
                           "Atherton" = "Atherton",
                           "Burlingame" = "Burlingame",
                           "Cupertino" = "Cupertino", 
                           "Hillsborough" = "Hillsborough",
                           "Los Altos" = "Los Altos",
                           "Los Altos Hills" = "Los Altos Hills",
                           "Menlo Park" = "Menlo Park",
                           "Mountain View" = "Mountain View",
                           "Palo Alto" = "Palo Alto",
                           "Portola Valley" = "Portola Valley",
                           "Redwood City" = "Redwood City",
                           "Redwood Shores" = "Redwood Shores",
                           "San Mateo" = "San Mateo",
                           "Sunnyvale" = "Sunnyvale",
                           "Woodside" = "Woodside"
                           ),
                         selected = c("Palo Alto", "Los Altos", "Mountain View", "Sunnyvale")),
    HTML("<br>"),
      img(src = "logo.png", height = 99, width = 108),
    
    HTML("<br><br><em>Created by Aaron Hsu<br>Sunnyvale Specialist and Data Analyst<br>aaron@deleonrealty.com</em>")
    
      ),
    
    # Main panel, which displays requested output
    mainPanel(
      
      # Display the plot
      plotOutput("dataPlotCombined")
      
    )
    
  )
  
))