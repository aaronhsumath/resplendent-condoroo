# Load data
load("webdata.data.RData")
require(ggplot2)
require(xlsx)
## Hard-coded
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
          ggplot(
            data = subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
            aes(
              x = year,
              y = msp,
              group = city,
              color = city
            )) +
            geom_point() +
            geom_line()
      })
      
      output$dataPlot2 <- renderPlot({
        ggplot(
          data = subset(frame, frame[, "type"] == input$selectType & frame[, "city"] %in% input$selectCity),
          aes(
            x = year,
            y = ratio,
            group = city,
            color = city
          )) +
          geom_point() +
          geom_line()
      })
})