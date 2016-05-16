data <- load("webdata.data.RData")
cityNames = c("AT", "CU", "LA", "LAH","MP", "MV", "PA", "PV", "RC", "RS", "SU", "WOD")

## Define other names
typeNames = c("SFR", "Condo", "Townhome")
statNames = c("Year","MSP","Ratio")
yearNames = unlist(2003:2015)

shinyServer(function(input, output) {

  titlePanel("Median Sale Price and Price per Square Foot")
  
  output$dataPlot <- renderPlot({
    barplot(
      # data[city, type, type, leaveblank]
      data[input$city, input$type, input$stat,]

              
    )
  })
})