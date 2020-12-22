
<!-- README.md is generated from README.Rmd. Please edit that file -->

# excalidrawr

<!-- badges: start -->

<!-- badges: end -->

Quick experiment to wrap [Excalidraw](https://excalidraw.com/) for use
in R.

## Installation

``` r
remotes::install_github("timelyportfolio/excalidrawr")
```

## Example

Currently, the package does very little except open an `Excalidraw`
instance ready for your creative adventures.

``` r
library(excalidrawr)

excalidraw()
```

We can also use the `onChange` prop to communicate with Shiny.

``` r
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
```
