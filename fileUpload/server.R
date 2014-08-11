library(shiny)
library(igraph)
shinyServer(function(input,output,session){
  observe({
    inFile<-input$file1
    print(inFile)
    if(is.null(inFile))
      return(NULL)
    #output$nodes <- renderText({input$nodes})
    #nodes <<- output$nodes
    dt = read.csv(inFile$datapath, header=input$header, sep=input$sep)
    #g <- graph.data.frame(dt)
    output$newGraph <- renderPlot({plotMe(dt,input$nodes)})
    output$zollie <- renderTable({dt})
    output$dollie <- renderPrint({table(V(ng))})
    
    ## Decide later what to do with the data, here we just fill
    ##updateSelectInput(session, "product", choices = dt)
  })
})