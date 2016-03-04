# Load data
load("webdata.data.RData")
require(ggplot2)

# require(gridExtra)

## Hard-coded constants
nSheets = 12  # number of sheets (cities)
nTypes = 3  # number of types of buildings
nStats = 3  # number of stats to read
nYears = 13 # number of rows (years) to read
cityNames = c("Atherton",
              "Cupertino",
              "Los Altos",
              "Los Altos Hills",
              "Menlo Park",
              "Mountain View",
              "Palo Alto",
              "Portola Valley",
              "Redwood City",
              "Redwood Shores",
              "Sunnyvale",
              "Woodside")

shinyServer(function(input, output) {
#   plot1 <- reactive({
#       plot1 <- 
        
  output$dataPlot1 <- renderPlot({
    ggplot(
      data = subset(frame, 
                    frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
      aes(
        x = year,
        y = msp,
        group = city,
        color = city
      )
    ) +
    geom_point() +
    geom_line()
  })
})  
  
  
  
#         ggplot(
#             data = subset(frame, 
#                           frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
#             aes(
#               x = year,
#               y = msp,
#               group = city,
#               color = city
#             )) +
#             geom_point() +
#             geom_line()
#   })
#   plot2 <- reactive({
#     
#       plot2 <- ggplot(
#           data = subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
#           aes(
#             x = year,
#             y = ratio,
#             group = city,
#             color = city
#           )) +
#           geom_point() +
#           geom_line()
#   })
#       plot1 <- ggplot_gtable(ggplot_build(plot1))
#       plot2 <- ggplot_gtable(ggplot_build(plot2))
#       
#       # Calculate maximum widths of plots
#       maxWidth = unit.pmax(plot1$widths[2:3], plot2$widths[2:3])
#       
#       
#       # Set plot widths to maxWidth
#       plot1$widths[2:3] <- maxWidth
#       plot2$widths[2:3] <- maxWidth
#       
      # Arrange the grid  
#       output$dataPlot1 <- renderPlot({
#         
#      plot1
        # grid.arrange(plot1, plot2, heights = c(3, 2))
#       
#       
#       })
# 
#       })
#       
