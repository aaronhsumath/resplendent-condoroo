# Load data
load("webdata.data.RData")
library(ggplot2)
library(gridExtra)
library(grid)

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

        
  output$dataPlot1 <- renderPlot({
    
    # Plot for MSP
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
  
  output$dataPlot2 <- renderPlot({
    
    # Plot for ratio
    ggplot(
      data = subset(frame, 
                    frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
      aes(
        x = year,
        y = ratio,
        group = city,
        color = city
      )
    ) +
    geom_point() +
    geom_line()
    
  })
  
  output$dataPlotCombined <- renderPlot({
    
    # Generate plot for MSP
    p1 <- ggplot(
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
    
    # Generate plot for ratio
    p2 <- ggplot(
      data = subset(frame, 
                    frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
      aes(
        x = year,
        y = ratio,
        group = city,
        color = city
      )
    ) +
      geom_point() +
      geom_line()
    
    # Convert plots into gtables
    p1 <- ggplot_gtable(ggplot_build(p1))
    p2 <- ggplot_gtable(ggplot_build(p2))
    
    maxWidth = unit.pmax(p1$widths[2:3], p2$widths[2:3])
    
    p1$widths[2:3] <- maxWidth
    p2$widths[2:3] <- maxWidth
    
    grid.arrange(p1, p2)
  })
  
})  
  








# 
# 
# 
# # Plot for PSRatio
# ggplot(
#   data = subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
#   aes(
#     x = year,
#     y = ratio,
#     group = city,
#     color = city
#   )) +
#   geom_point() +
#   geom_line()
  
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
