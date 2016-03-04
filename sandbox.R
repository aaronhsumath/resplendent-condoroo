

# Calculate maximum widths of plots
maxWidth = unit.pmax(plot1$widths[2:3], plot2$widths[2:3])

# Set plot widths to maxWidth
plot1$widths[2:3] <- maxWidth
plot2$widths[2:3] <- maxWidth

# Arrange the grid  
output$dataPlot1 <- grid.arrange(plot1, plot2, heights = c(3, 2))
