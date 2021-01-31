<!--ts-->
   * [Shiny](#shiny)
      * [Reactive variables](#reactive-variables)
         * [Observe a reactive variable](#observe-a-reactive-variable)
      * [Reactive contexts](#reactive-contexts)
      * [Creating reactive variable](#creating-reactive-variable)
      * [Debugging methods](#debugging-methods)
         * [Printing on the server side](#printing-on-the-server-side)
         * [The browser method](#the-browser-method)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: 2020-06-22T12:39+03:00 -->

<!--te-->

# Shiny

## Reactive variables

* All inputs are reactive
* `input$<inputId>` inside render function will cause output to re-render.

```R
output$my_plot <- renderPlot({
	plot(rnorm(input$num))
})
```

`output$my_plot` depends on `input$num`,

in other words `input$num` changes => `output$my_plot` reacts

### Observe a reactive variable

```R
server <-function(input, output){
    observe({
      print(input$num)
    })
}
```
* Useful for debugging, track reactive variable

## Reactive contexts

*  Reactive values can only be used inside **reactive contexts**

* Any `render*()` function is a reactive context (i.e: `renderPlot`, `renderUI`)




## Creating reactive variable

In the server side:

```R
server <-function(input, output){
	x <- reactive({
			input$num + 1
	})

	observe({
		print(input$num)
		print(x())
	})
}

```

* To access custom reactive variable like a function:
	add parenthess `()`

## Debugging methods

### Printing on the server side

```R
cat(file=stderr(), "This is the value of the variable:", input$my_variable, "\n")
```

### The browser method

Where you set the `browser`, it will set a break point.

```R
if (input$my_value > 40)
{
  browser()
}
```
   
## mathjax
[Code Reference](https://ianlucas.github.io/mathjax-editor/)


## Reference

[Debug Shiny apps](https://shiny.rstudio.com/articles/debugging.html)

[Highcharts in R](http://jkunst.com/highcharter/)

[RGL](http://www.sthda.com/english/wiki/a-complete-guide-to-3d-visualization-device-system-in-r-r-software-and-data-visualization)

[Plot side by side in shiny](https://stackoverflow.com/questions/34384907/how-can-put-multiple-plots-side-by-side-in-shiny-r)