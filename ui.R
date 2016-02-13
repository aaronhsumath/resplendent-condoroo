shinyUI(fluidPage(

  sidebarLayout(
    
    sidebarPanel(

      selectInput("selectType",
         "Property Type:",
         choices = typeNames),
#       selectInput("selectStat",
#                   "Statistic Requested:",
#                   choices = statNames),
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
                         selected = 1),
      
      hr()
    ),
    mainPanel(plotOutput("dataPlot"))
  )
))