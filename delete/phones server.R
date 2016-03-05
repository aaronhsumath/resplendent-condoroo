library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$dataPlot <- renderPlot({
    
    # Render a barplot
    barplot(data[]
      WorldPhones[,input$region]*1000, 
            main=input$city,
            ylab="Median Sale Price",
            xlab="Year")
  })
})

