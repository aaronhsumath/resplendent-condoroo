# Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com)
# Date: June 2016

# Load required libraries
library(ggplot2)
library(gridExtra)
library(grid)
library(scales)

# Load data
load("kangaroo.RData")

# Shiny server script
shinyServer(function(input, output) {

  # Define output object dataPlotCombined
  output$dataPlotCombined <- renderPlot({
    
    # Generate plot for MSP
    p1 <- ggplot(
      data = subset(kangaroo, 
                    kangaroo[, "type"] == input$selectType & kangaroo[, "city"] %in% input$selectCity),
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
    labs(y = "Median Sale Price, dollars", x = "Year") +
    scale_colour_discrete(name="") +
    theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.3)) +
    scale_y_continuous(labels = comma) 
    # Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com)
    # ylim(0, max(subset(kangaroo, kangaroo[, "type"] == input$selectType & kangaroo[, "city"] %in% input$selectCity)[, "msp"]))
    
    
    # Generate plot for ratio
    p2 <- ggplot(
      data = subset(kangaroo, 
                    kangaroo[, "type"] == input$selectType & kangaroo[, "city"] %in% input$selectCity),
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
         x = "Year") +
    scale_colour_discrete(name="") +
    theme(legend.position = "bottom", axis.text.x = element_text(angle = 45, hjust = 0.5, vjust = 0.3)) +
    geom_abline(slope = 0, intercept = 1) +
    ylim(0.85, 1.15)

    # xlim(max(subset(kangaroo, kangaroo[, "type"] == input$selectType & kangaroo[, "city"] # Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com) # %in% input$selectCity)), min(subset(kangaroo, kangaroo[, "type"] == input$selectType & kangaroo[, "city"] %in% input$selectCity)))
    
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