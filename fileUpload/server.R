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
    dt = read.csv(inFile$datapath, header=input$header, sep=input$sep, quote="'")
    #g <- graph.data.frame(dt)
    output$newGraph <- suppressWarnings(renderPlot({plotMe(dt,input$nodes)
                                   output$nodeCount <- renderText({vcount(ng)})
                                   output$edgeCount <- renderText({ecount(ng)})
                                   output$density <- renderText({graph.density(ng)})
                                   edf <- as.data.frame(get.edgelist(ng))
                                   names(edf) <- c('node A','node B')
                                   output$edgeList <- renderTable({edf})
                                   ddf <- as.data.frame(degree(ng))
                                   names(ddf) <- c('degree')
                                   output$degreeList <- renderTable({ddf})
                                   }))
    
    
    
    ## Decide later what to do with the data, here we just fill
    ##updateSelectInput(session, "product", choices = dt)
  })
})