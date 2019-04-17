library(shiny)
source("server.R")
source("ui.R")

# Run the application 
#shinyApp(ui = ui, server = server)
shiny::runApp("shiny_app_example", display.mode="showcase")


# Great reference for debugging taken from here:
# https://shiny.rstudio.com/articles/debugging.html
# 1. Breakpoints
# 2. Browser()
# 3. Tracing (Showcase mode, “printf” tracing, The Reactive Log)

# https://shiny.rstudio.com/articles/display-modes.html
