library(htmltools)
library(shiny)
library(excalidrawr)

ui <- excalidraw(
  onChange = htmlwidgets::JS(
"
function(elements, state) {
  if(Shiny && Shiny.setInputValue) {
    Shiny.setInputValue('excal1', {elements})
  }
}
"
  ),
  elementId = "excal1"
)

server <- function(input, output, session) {
  draw <- reactive({
    input$excal1
  })
  draw_d <- debounce(draw, 1000)
  observe({
    str(draw_d())
  })
}

shinyApp(ui, server)
