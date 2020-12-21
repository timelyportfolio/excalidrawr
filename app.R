library(shiny)
library(excalidraw)

ui <- fluidPage(
  titlePanel("reactR HTMLWidget Example"),
  excalidrawOutput('widgetOutput')
)

server <- function(input, output, session) {
  output$widgetOutput <- renderExcalidraw(
    excalidraw("Hello world!")
  )
}

shinyApp(ui, server)