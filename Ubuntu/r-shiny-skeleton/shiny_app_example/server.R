# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    #  An example of a print debug:
    cat(file=stderr(), "drawing histogram with", input$bins, "bins", "\n")
    
    # Example using browser
    if (input$bins > 40)
    {
      browser()
    }
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
  })
}
