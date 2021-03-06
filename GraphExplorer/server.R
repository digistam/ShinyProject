if (!require("shiny")) {
  install.packages("shiny", repos="http://cran.rstudio.com/") 
  library("shiny") 
}
shinyServer(function(input,output){
  observe({
    inFile<-input$file1
    print(inFile)
    if(is.null(inFile))
      return(NULL)
    dt = read.csv(inFile$datapath, sep=input$sep, quote="'")
    plotMe(dt,input$nodes)
    output$newGraph <- suppressWarnings(renderPlot({plot(ng)}))
    output$nodeCount <- renderText({vcount(ng)})
    output$edgeCount <- renderText({ecount(ng)})
    output$density <- renderText({graph.density(ng)})
    ddf <- sort(degree(ng), decreasing = T)
    ddf <- head(as.data.frame(ddf), n <- 5)
    names(ddf) <- c('Top 5 degree rank')                                   
    output$degreeList <- renderTable({ddf})
    #edf <- as.data.frame(get.edgelist(ng))
    #names(edf) <- c('node A','node B')
    #output$edgeList <- renderTable({edf})
    output$adjacency <- suppressWarnings(renderTable({as.matrix(get.adjacency(ng))})
  )})
})