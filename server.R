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
    geom_line() +
    ggtitle("Median Sale Price") +
    labs(y = "Median Sale Price, dollars",
         x = "Year")
    
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
    geom_line() +
    ggtitle("Sale Price to List Price Ratio") +
    labs(y = "Sale Price to List Price Ratio",
         x = "Year") 
    # xlim(max(subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity)), min(subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity)))
    
    # Convert plots into gtables
    p1 <- ggplot_gtable(ggplot_build(p1))
    p2 <- ggplot_gtable(ggplot_build(p2))
    
    # Calculate max widths of the plots
    maxWidth = unit.pmax(p1$widths[2:3], p2$widths[2:3])
    
    # Set the widths to be the same
    p1$widths[2:3] <- maxWidth
    p2$widths[2:3] <- maxWidth
    
    # Draw the plots
    grid.arrange(p1, p2, heights = c(10,6))
  }, height = 900)
  
})