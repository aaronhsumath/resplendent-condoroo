# Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com)
# Date: June 2016

shinyUI(fluidPage(
  # Display the title
  # titlePanel("Interactive Market Statistics"),
  sidebarLayout(
    
    # Sidebar, where user selects options
    sidebarPanel(
      
      # Select which type of property we wish to see
      selectInput("selectType",
         "Property type:",
         choices= c("Condo", "Townhome") # Took out SFR
),
      
      # Select which cities we wish to see
      checkboxGroupInput("selectCity", label = strong("Select cities:"), 
                         choices = list(
                           # "Atherton" = "Atherton",
                           "Burlingame" = "Burlingame",
                           "Cupertino" = "Cupertino", 
                           # "Hillsborough" = "Hillsborough",
                           "Los Altos" = "Los Altos",
                           # "Los Altos Hills" = "Los Altos Hills",
                           "Menlo Park" = "Menlo Park",
                           "Mountain View" = "Mountain View",
                           "Palo Alto" = "Palo Alto",
                           # "Portola Valley" = "Portola Valley",
                           "Redwood City" = "Redwood City",
                           "Redwood Shores" = "Redwood Shores",
                           "San Mateo" = "San Mateo",
                           "Sunnyvale" = "Sunnyvale"
                           # "Woodside" = "Woodside"
                           ),
                         selected = c("Palo Alto", "Los Altos", "Mountain View", "Cupertino")),
    #HTML("<br>"),
      #img(src = "logo.png", height = 99, width = 108),
    
    #HTML("<br><br><em>Created by Aaron Hsu<br>Sunnyvale Specialist and Data Analyst<br>aaron@deleonrealty.com</em>"),
    HTML("<br><br><em><font color=F5F5F5><font size = 1>Created by Aaron Hsu 2016</font></font></em>"),
    
       width = 3),
    
    # Main panel, which displays requested output
    mainPanel(
      
      # Display the plot
      plotOutput("dataPlotCombined")
      
    )
    
  )
  
))