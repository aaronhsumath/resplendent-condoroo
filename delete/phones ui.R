library(shiny)

# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Median Sale Price"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("city", "City:", 
                    choices=names(getSheets(loadWorkbook(dataPath)))),
        hr(),
        helpText("Median Sale Price and Price per Square Foot by City")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("dataPlot")  
      )
      
    )
  )
)

