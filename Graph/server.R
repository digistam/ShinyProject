library(shiny)
shinyServer(
  function(input, output) {
    output$nodes <- renderText({input$nodes})
    output$newGraph <- renderPlot({
      suppressWarnings(plotMe(input$nodes))
        output$totalNodes <- renderText({totalNodes})
        output$degreeHist <- renderPlot({
          hist(shortestPath, main="Histogram degrees of separation", xlab="Shortest paths")
          }, height = 400, width = 425)
        output$shortestPath <- renderText({shortestPath})
    })
  })
