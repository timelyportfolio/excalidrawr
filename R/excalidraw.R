#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
excalidraw <- function(..., width = NULL, height = NULL, elementId = NULL) {

  # describe a React component to send to the browser for rendering.
  component <- reactR::component(
    "Excalidraw",
    list(...)
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'excalidraw',
    reactR::reactMarkup(component),
    width = width,
    height = height,
    package = 'excalidrawr',
    elementId = elementId,
    dependencies = htmltools::htmlDependency(
      name = "excalidraw",
      version = "0.6.4",
      src = c(file = system.file("htmlwidgets", package="excalidrawr")),
      stylesheet = "excalidraw.min.css"
    )
  )
}

#' Shiny bindings for excalidraw
#'
#' Output and render functions for using excalidraw within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a excalidraw
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name excalidraw-shiny
#'
#' @export
excalidrawOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'excalidraw', width, height, package = 'excalidrawr')
}

#' @rdname excalidraw-shiny
#' @export
renderExcalidraw <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, excalidrawOutput, env, quoted = TRUE)
}

#' Called by HTMLWidgets to produce the widget's root element.
#' @rdname excalidraw-shiny
excalidraw_html <- function(id, style, class, ...) {
  htmltools::tagList(
    # Necessary for RStudio viewer version < 1.2
    reactR::html_dependency_corejs(),
    reactR::html_dependency_react(),
    reactR::html_dependency_reacttools(),
    htmltools::tags$div(id = id, class = class, style = style)
  )
}
