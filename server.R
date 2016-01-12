shinyServer(function(input, output) {

  titlePanel("Median Sale Price and Price per Square Foot")
  
  output$dataPlot <- renderPlot({
    barplot(
      # data[city, type, type, leaveblank]
      data[input$city, input$type, input$stat,]

              
    )
  })
})